//
//  PromocaoDAO.h
//  Zapeat
//
//  Created by Marcelo Magalhães on 07/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZPPromocao.h"
#import "FMResultSet.h"
@interface ZPPromocaoDAO : NSObject

-(BOOL) inserir:(NSMutableArray *) promocoes;

-(NSMutableArray *) getPromocoes;

-(void) markAsNotified:(ZPPromocao*) promocao;

-(void) clean;


@end
