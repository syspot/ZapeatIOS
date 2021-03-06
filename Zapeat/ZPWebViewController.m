//
//  WebViewController.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 07/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "ZPWebViewController.h"
#import "ZPPromocaoService.h"
#import "ZPControleService.h"
#import "ZPCoreLocationController.h"
#import "ZPZapeatUtil.h"
#import "ZPSemConexaoController.h"
@interface ZPWebViewController ()

@end

@implementation ZPWebViewController

@synthesize webView,CLController;


- (void)viewDidLoad {
    
    [super viewDidLoad];

    CLController = [[ZPCoreLocationController alloc] init];
	CLController.delegate = self;
    CLController.locMgr.distanceFilter = 500;
    CLController.locMgr.desiredAccuracy = kCLLocationAccuracyHundredMeters;
	[CLController.locMgr startUpdatingLocation];
    
    webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    webView.scrollView.bounces = NO;
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *ultimaPromocaoNotificada = [prefs objectForKey:@"ultimaPromocaoNotificada"];
    NSString *urlAddress = nil;
    
    if(ultimaPromocaoNotificada !=nil) {
    
         urlAddress = [NSString stringWithFormat:@"http://www.zapeat.com/ZapeatMobile/detalhamento.xhtml?promocaoId=%@",ultimaPromocaoNotificada];
        
        [prefs removeObjectForKey:@"ultimaPromocaoNotificada"];
        
    } else {
    
     urlAddress = [NSString stringWithFormat:@"http://www.zapeat.com/ZapeatMobile/menu.xhtml"];
    }
    
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    [self.view addSubview:webView];
    [webView setDelegate:self];
    
    loadingIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(145, 190, 20,20)];
    
    [loadingIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [loadingIndicator setHidesWhenStopped:YES];
    
    [webView addSubview:loadingIndicator];
    
    [self verifyPromocoes];
    
}

- (void)locationUpdate:(CLLocation *)location {

    [self verifyPromocoes];
    
    double latitude = location.coordinate.latitude;
    double longitude = location.coordinate.longitude;
    ZPPromocaoService *promocaoService = [[ZPPromocaoService alloc]init];
    double distancia=-1;
     NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    for(ZPPromocao *promocao in [promocaoService getPromocoes]) {
        
        distancia = -1;
        
        distancia = [promocao distancia:latitude longitude:longitude];
        
        if(promocao.notificada==0 && distancia>0 && distancia < 5000) {
            
            [promocaoService markAsNotified:promocao];
            
            [self showAlert:promocao];
            
            [prefs setObject:[promocao codigo] forKey:@"ultimaPromocaoNotificada"];
            
        }
        
    }
    
    [promocaoService release];
    
}

- (void)locationError:(NSError *)error {

}


-(void) verifyPromocoes {
    
    @try {
        
        ZPControleService *service = [[ZPControleService alloc]init];
        
        NSDate *ultimaAtualizacao = [service getUltimaDataAtualizacao];
        
        int intervalo = [ZPZapeatUtil hourBetweenDates:ultimaAtualizacao and:[NSDate date]];
        
        if(intervalo>3) {
            
            NSString *url = [NSString stringWithFormat:@"http://www.zapeat.com/ZapeatMobile/promocoes"];
            NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
            NSError* error;
            NSDictionary *resultados = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                       options:NSJSONReadingMutableContainers error:&error];
            
            
            NSArray *itens = (NSArray *)[resultados objectForKey:@"promocoes"];
            
            NSMutableArray *promocoesDia = [[NSMutableArray alloc]init];
            
            for(id item in itens) {
                
                [promocoesDia addObject: [ZPPromocao init:item]];
                
            }
            
            ZPPromocaoService *promocaoService = [[ZPPromocaoService alloc]init];
            
            [promocaoService inserir:promocoesDia];
            
            [service updateDataATualizacao];
            
        }
    }
    
    @catch (NSException *exception) {
        NSLog(@"Serviço Fora");
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [webView release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
	[CLController release];
    [super dealloc];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    
    return self;
}

- (void)showAlert:(ZPPromocao *)promocao {
    
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    localNotif.fireDate = [NSDate date];
    localNotif.timeZone = [NSTimeZone defaultTimeZone];

    NSString* message = [NSString stringWithFormat:@" %@ : %@ Preço original: %@ Preço Promocional: %@",promocao.localidade,promocao.descricao,promocao.precoOriginal,promocao.precoPromocional];
    
    localNotif.alertBody = message;
    localNotif.alertAction=@"Gostei, quero ver!";

    localNotif.soundName = UILocalNotificationDefaultSoundName;
    localNotif.applicationIconBadgeNumber = 1;

    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    [localNotif release];
}

-(BOOL)webView:(UIWebView *)view shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    if(![ZPZapeatUtil isNetworkAvailable]) {
        ZPSemConexaoController *semConexaoController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"ZPSemConexaoController"];
        [self presentModalViewController:semConexaoController animated:YES];
        return NO;
        
    }
    
    return YES;
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [loadingIndicator stopAnimating];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    [loadingIndicator startAnimating];
}

@end
