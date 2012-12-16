//
//  LoginController.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 04/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "SemConexaoController.h"
#import "Usuario.h"
#import "WebViewController.h"
#import "UsuarioService.h"
#import "ZapeatUtil.h"
@interface SemConexaoController ()

@end

@implementation SemConexaoController

- (IBAction)tentarNovamente:(id)sender {
    
    if([ZapeatUtil isNetworkAvailable]) {
        
        WebViewController *webViewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateViewControllerWithIdentifier:@"WebViewController"];
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
