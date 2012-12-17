//
//  PromocaoService.h
//  Zapeat
//
//  Created by Marcelo Magalhães on 08/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZPPromocao.h"
#import "ZPPromocaoDAO.h"

@interface ZPPromocaoService : NSObject

-(void) clean;

-(void) inserir :(NSMutableArray *) promocoes;

-(NSMutableArray *) getPromocoes;

-(void) markAsNotified:(ZPPromocao*) promocao;

@end
