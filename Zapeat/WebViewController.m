//
//  WebViewController.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 07/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "WebViewController.h"
#import "PromocaoService.h"
#import "ControleService.h"
#import "CoreLocationController.h"
#import "ZapeatUtil.h"
#import "LoginController.h"
@interface WebViewController ()

@end

@implementation WebViewController

@synthesize webView,CLController;


- (void)viewDidLoad {
    
    [super viewDidLoad];

    CLController = [[CoreLocationController alloc] init];
	CLController.delegate = self;
    CLController.locMgr.distanceFilter = 500;
    CLController.locMgr.desiredAccuracy = kCLLocationAccuracyHundredMeters;
	[CLController.locMgr startUpdatingLocation];
    
    webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *urlAddress = [NSString stringWithFormat:@"http://localhost:8080/ZapeatMobile/menu.xhtml?usuarioId=%@",[prefs stringForKey:@"token"]];
    NSURL *url = [NSURL URLWithString:urlAddress];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [webView loadRequest:requestObj];
    [self.view addSubview:webView];
    [webView setDelegate:self];
}

- (void)locationUpdate:(CLLocation *)location {

    double latitude = location.coordinate.latitude;
    double longitude = location.coordinate.longitude;
    PromocaoService *promocaoService = [[PromocaoService alloc]init];
    double distancia=-1;
    
    for(Promocao *promocao in [promocaoService getPromocoes]) {
        
        distancia = -1;
        
        distancia = [promocao distancia:latitude longitude:longitude];
        
        if(promocao.notificada==0 && distancia>0 && distancia < 5000) {
            
            [promocaoService markAsNotified:promocao];
            
            [self showAlert:promocao];
            
        }
        
    }
    
    [self verifyPromocoes];
    
}

- (void)locationError:(NSError *)error {

}


-(void) verifyPromocoes {
    
    @try {
        
        ControleService *service = [[ControleService alloc]init];
        
        NSDate *ultimaAtualizacao = [service getUltimaDataAtualizacao];
        
        int intervalo = [ZapeatUtil hourBetweenDates:ultimaAtualizacao and:[NSDate date]];
        
        if(intervalo>3) {
            
            NSString *url = [NSString stringWithFormat:@"http://192.168.0.17:8080/ZapeatMobile/promocoes"];
            NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
            NSError* error;
            NSDictionary *resultados = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                       options:NSJSONReadingMutableContainers error:&error];
            
            
            NSArray *itens = (NSArray *)[resultados objectForKey:@"promocoes"];
            
            NSMutableArray *promocoesDia = [[NSMutableArray alloc]init];
            
            for(id item in itens) {
                
                [promocoesDia addObject: [Promocao init:item]];
                
            }
            
            PromocaoService *promocaoService = [[PromocaoService alloc]init];
            
            [promocaoService inserir:promocoesDia];
            
        }
    }
    
    @catch (NSException *exception) {
        NSLog(@"Serviço Fora");
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self.webView release];
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

- (void)showAlert:(Promocao *)promocao {
    
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
    
    NSString *url = [[request URL]absoluteString];
    
    if([url hasSuffix:@"sair.xhtml"]) {
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs removeObjectForKey:@"token"];
        exit(0);
    }
    
    return YES;
    
}

@end
