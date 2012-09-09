//
//  PromocaoDAO.h
//  Zapeat
//
//  Created by Marcelo Magalhães on 07/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Promocao.h"
#import "FMResultSet.h"
@interface PromocaoDAO : NSObject

-(BOOL) inserir:(NSMutableArray *) promocoes;

-(NSMutableArray *) getPromocoes;

-(void) markAsNotified:(Promocao*) promocao;

-(void) clean;


@end
