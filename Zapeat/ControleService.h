//
//  ControleService.h
//  Zapeat
//
//  Created by Marcelo Magalhães on 08/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ControleService : NSObject

-(void) clean;

-(NSDate *) getUltimaDataAtualizacao;

-(void) updateDataATualizacao;

@end
