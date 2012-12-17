//
//  UsuarioService.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 08/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "ZPUsuarioService.h"
#import "ZPControleDAO.h"
#import "ZPPromocaoService.h"
#import "ZPPromocao.h"
@implementation ZPUsuarioService

-(void) initConfiguration: (ZPUsuario *) usuario {
    
    ZPPromocaoService *promocaoService = [[ZPPromocaoService alloc]init];
    [promocaoService clean];
    [promocaoService inserir:[usuario promocoes]];
    [promocaoService release];
    
    ZPControleDAO *controleDAO = [[ZPControleDAO alloc]init];
    [controleDAO clean];
    [controleDAO updateDataAtualizacao];
    [controleDAO release];

    
}

@end
