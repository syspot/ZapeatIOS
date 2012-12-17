//
//  Promocao.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 04/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "ZPPromocao.h"
#import <CoreLocation/CLLocation.h>
@implementation ZPPromocao

@synthesize descricao,latitude,localidade,longitude,precoOriginal,precoPromocional,codigo,notificada,inicio,fim;

+(ZPPromocao *) init :(NSDictionary *) dicionario {
    
    ZPPromocao * promocao = [[ZPPromocao alloc] init];
    
    [promocao setDescricao:        [dicionario objectForKey:@"descricao"]];
    [promocao setPrecoOriginal:    [dicionario objectForKey:@"precoOriginal"]];
    [promocao setPrecoPromocional: [dicionario objectForKey:@"precoPromocional"]];
    [promocao setLocalidade:       [dicionario objectForKey:@"localidade"]];
    [promocao setInicio:           [dicionario objectForKey:@"dataInicial"]];
    [promocao setFim:              [dicionario objectForKey:@"dataFinal"]];
    [promocao setCodigo:           [[dicionario objectForKey:@"idPromocao"] longValue]];
    [promocao setLatitude:         [[dicionario objectForKey:@"latitude"] doubleValue]];
    [promocao setLongitude:        [[dicionario objectForKey:@"longitude"] doubleValue]];

    return promocao;
    
}

-(double)distancia:(double)lat longitude:(double)longi {
    
    CLLocation *localizacaoDesejada = [[CLLocation alloc] initWithLatitude: lat longitude:longi];
    
    CLLocation *localizacaoAtual = [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
    
    CLLocationDistance distancia = [localizacaoAtual distanceFromLocation:localizacaoDesejada];
    
    [localizacaoAtual release];
    
    [localizacaoDesejada release];
    
    return distancia;
}

@end
