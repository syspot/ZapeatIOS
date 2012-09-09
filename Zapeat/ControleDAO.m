//
//  ControleDAO.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 08/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "ControleDAO.h"
#import "FMDatabase.h"
#import "DBUtil.h"
@implementation ControleDAO

-(void) clean{
    
    FMDatabase *conexao = [DBUtil getConnection];
    
    [conexao executeUpdate:@"DELETE FROM CONTROLE;"];
    
    [DBUtil closeConnection:conexao];
    
}

-(NSDate *) getUltimaDataAtualizacao{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    FMDatabase *conexao = [DBUtil getConnection];
    
    NSDate *date = nil;
    
    FMResultSet *rs = [conexao executeQuery:@"SELECT DATA FROM CONTROLE"];
    
    NSString *data = nil;
    
    if([rs next]) {
        
        data = [rs stringForColumn:@"data"];
        
    }
    
    if(data!=nil) {
        
        date = [dateFormatter dateFromString:data];
        
    }
    
    [DBUtil closeConnection:conexao];
    
    return date;
    
}

-(void) updateDataAtualizacao {
    
    FMDatabase *conexao = [DBUtil getConnection];
    
    NSDateFormatter *dateFormatter =    [[NSDateFormatter alloc] init];

    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *now = [dateFormatter stringFromDate:[NSDate date]];
    
    bool foi = false;
    
    if([self getUltimaDataAtualizacao]==nil) {
        
     foi=   [conexao executeUpdate:@"INSERT INTO CONTROLE VALUES(?);",[NSString stringWithString:now]];
        
    } else {
    
     foi=        [conexao executeUpdate:@"UPDATE CONTROLE SET DATA = ?;",[NSString stringWithString:now]];
        
    }

    
    [DBUtil closeConnection:conexao];
    
}

@end
