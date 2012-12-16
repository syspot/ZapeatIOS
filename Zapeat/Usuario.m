//
//  Usuario.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 04/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "Usuario.h"
#import "Promocao.h"
@implementation Usuario

@synthesize login,senha,promocoes,codigo,token;

+ (Usuario *) init : (NSDictionary *) dicionario{
    
    Usuario * user = [[Usuario alloc]init];
    
    [user setCodigo:[[dicionario objectForKey:@"id"] longValue]];
    
    [user setToken:[dicionario objectForKey:@"token"]];
    
    NSArray *itens = (NSArray *)[dicionario objectForKey:@"promocoes"];

    NSMutableArray *promocoesDia = [[NSMutableArray alloc]init];

    for(id item in itens) {
        
        [promocoesDia addObject: [Promocao init:item]];

    }
    
    [user setPromocoes:promocoesDia];
    
    [promocoesDia release];
    
    return user;
}


@end
