//
//  ControleService.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 08/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "ZPControleService.h"
#import "ZPControleDAO.h"
@implementation ZPControleService

-(void) clean{
    
    ZPControleDAO *dao = [[ZPControleDAO alloc]init];
    [dao clean];
    [dao release];
    
}

-(NSDate *) getUltimaDataAtualizacao {
    
    ZPControleDAO *dao = [[ZPControleDAO alloc]init];
    NSDate *data = [dao getUltimaDataAtualizacao];
    [dao release];
    return data;
    
}

-(void) updateDataATualizacao {
    
    ZPControleDAO *dao = [[ZPControleDAO alloc]init];
    [dao updateDataAtualizacao];
    [dao release];
}

@end
