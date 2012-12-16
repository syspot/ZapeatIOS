//
//  LoginController.h
//  Zapeat
//
//  Created by Marcelo Magalhães on 04/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SemConexaoController : UIViewController

@property(nonatomic,strong) UITextField *login;
@property(nonatomic,strong) UITextField *senha;

- (IBAction)tentarNovamente:(id)sender;

@end
