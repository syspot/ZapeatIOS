//
//  PromocaoService.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 08/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "PromocaoService.h"
#import "Promocao.h"
#import "PromocaoDAO.h"
@implementation PromocaoService

-(void) clean {
    
    PromocaoDAO  *dao = [[PromocaoDAO alloc]init];
    [dao clean];
    [dao release];
}

-(void) inserir :(NSMutableArray *) promocoes {
    PromocaoDAO  *dao = [[PromocaoDAO alloc]init];
    [dao inserir:promocoes];
    [dao release];
}

-(NSMutableArray *) getPromocoes {
    
    PromocaoDAO  *dao = [[PromocaoDAO alloc]init];
    NSMutableArray *promocoes = [dao getPromocoes];
    [dao release];
    return promocoes;
    
}

-(void) markAsNotified:(Promocao*) promocao {
    
    PromocaoDAO  *dao = [[PromocaoDAO alloc]init];
    [dao markAsNotified:promocao];
    [dao release];
    
}

@end
