//
//  Usuario.h
//  Zapeat
//
//  Created by Marcelo Magalhães on 04/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Usuario : NSObject

@property(nonatomic) long codigo;
@property(nonatomic,strong) NSString *login;
@property(nonatomic,strong) NSString *senha;
@property(nonatomic,strong) NSMutableArray *promocoes;

+ (Usuario *) init : (NSDictionary *) dicionario;


@end
