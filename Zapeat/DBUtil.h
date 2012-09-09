//
//  DBUtil.h
//  Zapeat
//
//  Created by Marcelo Magalhães on 07/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DBUtil : NSObject

+(FMDatabase *) getConnection;

+(void) closeConnection:(FMDatabase *)conexao;

@end
