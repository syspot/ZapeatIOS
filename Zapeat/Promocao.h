//
//  Promocao.h
//  Zapeat
//
//  Created by Marcelo Magalhães on 04/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Promocao : NSObject

@property(nonatomic,strong) NSString *localidade;
@property(nonatomic,strong) NSString *descricao;
@property(nonatomic,strong) NSString *precoOriginal;
@property(nonatomic,strong) NSString *precoPromocional;
@property(nonatomic) double latitude;
@property(nonatomic) double longitude;
@property(nonatomic) long codigo;
@property(nonatomic) int notificada;

+ (Promocao *) init : (NSDictionary *) dicionario;

- (double) distancia: (double) latitude longitude: (double) longitude;

@end
