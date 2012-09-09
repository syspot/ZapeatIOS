//
//  LoginController.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 04/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "LoginController.h"
#import "Usuario.h"
#import <KeyValueObjectMapping/DCKeyValueObjectMapping.h>
#import "WebViewController.h"
#import "UsuarioService.h"
@interface LoginController ()

@end

@implementation LoginController

@synthesize login,senha;

-(IBAction)logar:(id)sender {
    
        
    if(self.validateEmptyFields) {
 
    
        Usuario *usuario = [[Usuario alloc]init];
        usuario.login = login.text;
        usuario.senha = senha.text;
        NSString *url = [NSString stringWithFormat:@"http://192.168.0.17:8080/TestAndroid/autenticar"];
        NSData *jsonData = [NSData dataWithContentsOfURL: [NSURL URLWithString:url]];
        NSError* error;
        NSDictionary *resultados = [NSJSONSerialization JSONObjectWithData:jsonData
                                                                   options:NSJSONReadingMutableContainers error:&error];
            
            if([[resultados objectForKey:@"logged"]boolValue]) {
            
                usuario = [Usuario init:resultados];

                UsuarioService *service = [[UsuarioService alloc]init];
                
                [service initConfiguration:usuario];
                
                WebViewController *webView =  [[WebViewController alloc]init];
                
                webView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
                
                [self presentModalViewController:webView animated:YES];
                
            } else {
                [self showAlert:@"Falha ao autenticar" message:@"Login e/ou senha incorreto(s)."];
            }
        
        }else {
         
            [self showAlert:@"Falha ao autenticar" message:@"Falha ao autenticar usuário, verifique sua conexão com a internet ou tente mais tarde."];
        }
    
}

-(BOOL) validateEmptyFields {
    
    NSString *textLogin = [login text];
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmed = [textLogin stringByTrimmingCharactersInSet:whitespace];
    
    if([trimmed length]==0) {
        
        [self showAlert:@"Erro de validação" message:@"Login: Campo obrigatório"];
        
        [textLogin release];
        [trimmed release];
        
        return false;
        
    } else {
        
        NSString *textSenha = [senha text];
    
        trimmed = [textSenha stringByTrimmingCharactersInSet:whitespace];
        
        if([trimmed length]==0) {
            [self showAlert:@"Erro de validação" message:@"Senha: Campo obrigatório"];
            [textSenha release];
            [trimmed release];
            return false;
            
        }
        
    }
    
    [textLogin release];
    [trimmed release];
    
    return true;
    
}


-(IBAction)clickOut:(id)sender {
    
    [sender resignFirstResponder];
    
}

-(IBAction)clickBackground:(id)sender{
    
    [login resignFirstResponder];
    [senha resignFirstResponder];
    
}

- (void)showAlert:(NSString *)title message:(NSString*) message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
