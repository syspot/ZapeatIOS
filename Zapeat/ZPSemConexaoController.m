//
//  LoginController.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 04/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "ZPSemConexaoController.h"
#import "ZPUsuario.h"
#import "ZPWebViewController.h"
#import "ZPUsuarioService.h"
#import "ZPZapeatUtil.h"
@interface ZPSemConexaoController ()

@end

@implementation ZPSemConexaoController

- (IBAction)tentarNovamente:(id)sender {
    
    if([ZPZapeatUtil isNetworkAvailable]) {
        
        ZPWebViewController *webViewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"ZPWebViewController"];
        [self presentModalViewController:webViewController animated:YES];
        
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
