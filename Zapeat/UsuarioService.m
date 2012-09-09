//
//  UsuarioService.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 08/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "UsuarioService.h"
#import "ControleDAO.h"
#import "PromocaoService.h"
#import "Promocao.h"
@implementation UsuarioService

-(void) initConfiguration: (Usuario *) usuario {
    
    PromocaoService *promocaoService = [[PromocaoService alloc]init];
    [promocaoService clean];
    [promocaoService inserir:[usuario promocoes]];
    
    ControleDAO *controleDAO = [[ControleDAO alloc]init];
    [controleDAO clean];
    [controleDAO updateDataAtualizacao];

    
}

@end
