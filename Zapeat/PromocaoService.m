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
}

-(void) inserir :(NSMutableArray *) promocoes {
    PromocaoDAO  *dao = [[PromocaoDAO alloc]init];
    [dao inserir:promocoes];
    
}

-(NSMutableArray *) getPromocoes {
    
    PromocaoDAO  *dao = [[PromocaoDAO alloc]init];
    NSMutableArray *promocoes = [dao getPromocoes];
    return promocoes;
    
}

-(void) markAsNotified:(Promocao*) promocao {
    
        PromocaoDAO  *dao = [[PromocaoDAO alloc]init];
        [dao markAsNotified:promocao];
    
}

@end
