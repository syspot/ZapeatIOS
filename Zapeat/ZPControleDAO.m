//
//  ControleDAO.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 08/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "ZPControleDAO.h"
#import "FMDatabase.h"
#import "ZPDBUtil.h"
@implementation ZPControleDAO

-(void) clean{
    
    FMDatabase *conexao = [ZPDBUtil getConnection];
    
    [conexao executeUpdate:@"DELETE FROM CONTROLE;"];
    
    [ZPDBUtil closeConnection:conexao];
    
}

-(NSDate *) getUltimaDataAtualizacao{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    FMDatabase *conexao = [ZPDBUtil getConnection];
    
    NSDate *date = nil;
    
    FMResultSet *rs = [conexao executeQuery:@"SELECT DATA FROM CONTROLE"];
    
    NSString *data = nil;
    
    if([rs next]) {
        
        data = [rs stringForColumn:@"data"];
        
    }
    
    if(data!=nil) {
        
        date = [dateFormatter dateFromString:data];
        
    }
    
    [dateFormatter release];
    
    [ZPDBUtil closeConnection:conexao];
    
    return date;
    
}

-(void) updateDataAtualizacao {
    
    FMDatabase *conexao = [ZPDBUtil getConnection];
    
    NSDateFormatter *dateFormatter =    [[NSDateFormatter alloc] init];

    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *now = [dateFormatter stringFromDate:[NSDate date]];
    
    [dateFormatter release];
    
    if([self getUltimaDataAtualizacao]==nil) {
        
     [conexao executeUpdate:@"INSERT INTO CONTROLE VALUES(?);",[NSString stringWithString:now]];
        
    } else {
    
     [conexao executeUpdate:@"UPDATE CONTROLE SET DATA = ?;",[NSString stringWithString:now]];
        
    }
    
    [ZPDBUtil closeConnection:conexao];
    
}

@end
