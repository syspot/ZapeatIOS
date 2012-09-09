//
//  ControleService.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 08/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "ControleService.h"
#import "ControleDAO.h"
@implementation ControleService

-(void) clean{
    
    ControleDAO *dao = [[ControleDAO alloc]init];
    [dao clean];
    
}

-(NSDate *) getUltimaDataAtualizacao {
    
    ControleDAO *dao = [[ControleDAO alloc]init];
    NSDate *data = [dao getUltimaDataAtualizacao];
    return data;
    
}

-(void) updateDataATualizacao {
    
    ControleDAO *dao = [[ControleDAO alloc]init];
    [dao updateDataAtualizacao];
}

@end
