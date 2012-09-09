//
//  LoginController.h
//  Zapeat
//
//  Created by Marcelo Magalhães on 04/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginController : UIViewController {
    
    IBOutlet UITextField *login;
    IBOutlet UITextField *senha;
    
}

@property(nonatomic,strong) UITextField *login;
@property(nonatomic,strong) UITextField *senha;

-(IBAction)logar:(id)sender;

-(IBAction)clickOut:(id)sender;

-(IBAction)clickBackground:(id)sender;

- (void)showAlert:(NSString *)title message:(NSString*) message;

@end
