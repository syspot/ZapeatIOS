//
//  PromocaoDAO.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 07/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "PromocaoDAO.h"
#import "Promocao.h"
#import "DBUtil.h"
#import "FMDatabase.h"


@implementation PromocaoDAO

-(BOOL) inserir:(NSMutableArray *) promocoes {
    
    bool retorno = true;
    
    FMDatabase *conexao = [DBUtil getConnection];
    
    [conexao beginTransaction];
    
    for(Promocao *item in promocoes) {

            retorno= [conexao executeUpdate:@"INSERT OR IGNORE INTO PROMOCOES(CODIGO,DESCRICAO,LOCALIDADE,LATITUDE,LONGITUDE,PRECO_ORIGINAL,PRECO_PROMOCIONAL,INICIO,FIM) VALUES(?,?,?,?,?,?,?,?,?);",[NSNumber numberWithLong:item.codigo],[NSString stringWithString:item.descricao],
                      [NSString stringWithString:item.localidade],[NSNumber numberWithDouble:item.latitude],
                                                      [NSNumber numberWithDouble:item.longitude],[NSString stringWithString:item.precoOriginal],[NSString stringWithString:item.precoPromocional],[NSString stringWithString:item.inicio],[NSString stringWithString:item.fim]];
     
     }
    
    

    [conexao commit];
    
    [DBUtil closeConnection:conexao];

    return retorno;
    
}

-(NSMutableArray *) getPromocoes {
    
    NSMutableArray *promocoes = [[NSMutableArray alloc]init];
    
    FMDatabase *conexao = [DBUtil getConnection];
    
    FMResultSet *rs = [conexao executeQuery:@"SELECT * FROM promocoes where (inicio is null or strftime('%s','now') - strftime('%s',inicio) > 0) and (fim is null or  strftime('%s','now') - strftime('%s',fim) < 0) "];
    
    while([rs next]) {
        
        Promocao *promocao = [[Promocao alloc]init];
        promocao.codigo = [rs longForColumn:@"codigo"];
        promocao.descricao = [rs stringForColumn:@"descricao"];
        promocao.localidade = [rs stringForColumn:@"localidade"];
        promocao.latitude = [rs doubleForColumn:@"latitude"];
        promocao.longitude = [rs doubleForColumn:@"longitude"];
        promocao.precoOriginal = [rs stringForColumn:@"preco_original"];
        promocao.precoPromocional = [rs stringForColumn:@"preco_promocional"];
        promocao.inicio = [rs stringForColumn:@"inicio"];
        promocao.fim = [rs stringForColumn:@"fim"];
        promocao.notificada = [rs intForColumn:@"notificada"];
        
        [promocoes addObject:promocao];
        
        [promocao release];
        
    }
    
    [DBUtil closeConnection:conexao];
    
    return promocoes;
    
}

-(void) markAsNotified:(Promocao*) promocao {
    
    FMDatabase *conexao = [DBUtil getConnection];
        
    [conexao executeUpdate:@"UPDATE PROMOCOES SET NOTIFICADA = 1 WHERE CODIGO = ?;",[NSNumber numberWithLong:promocao.codigo]];
    
    [DBUtil closeConnection:conexao];
    
}

-(void) clean {
   
    FMDatabase *conexao = [DBUtil getConnection];
    
    [conexao beginTransaction];
    
    [conexao executeUpdate:@"DELETE FROM PROMOCOES;"];
    
    [conexao commit];
    
    [DBUtil closeConnection:conexao];
    
}
 
@end
