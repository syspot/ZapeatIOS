//
//  DBUtil.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 07/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "ZPDBUtil.h"
#import "FMDatabase.h"
#import "ZPAppDelegate.h"

@implementation ZPDBUtil

+(FMDatabase *) getConnection {
    
    NSString *databasePath = [(ZPAppDelegate *)[[UIApplication sharedApplication] delegate] databasePath];
    FMDatabase *db = [FMDatabase databaseWithPath:databasePath];
    [db open];
    return db;

    
}
             
+(void) closeConnection:(FMDatabase *)conexao {

    if(conexao!=nil) {
        [conexao close];
    }
}


@end
