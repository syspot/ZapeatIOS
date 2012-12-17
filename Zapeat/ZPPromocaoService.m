//
//  PromocaoService.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 08/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "ZPPromocaoService.h"
#import "ZPPromocao.h"
#import "ZPPromocaoDAO.h"
@implementation ZPPromocaoService

-(void) clean {
    
    ZPPromocaoDAO  *dao = [[ZPPromocaoDAO alloc]init];
    [dao clean];
    [dao release];
}

-(void) inserir :(NSMutableArray *) promocoes {
    ZPPromocaoDAO  *dao = [[ZPPromocaoDAO alloc]init];
    [dao inserir:promocoes];
    [dao release];
}

-(NSMutableArray *) getPromocoes {
    
    ZPPromocaoDAO  *dao = [[ZPPromocaoDAO alloc]init];
    NSMutableArray *promocoes = [dao getPromocoes];
    [dao release];
    return promocoes;
    
}

-(void) markAsNotified:(ZPPromocao*) promocao {
    
    ZPPromocaoDAO  *dao = [[ZPPromocaoDAO alloc]init];
    [dao markAsNotified:promocao];
    [dao release];
    
}

@end
