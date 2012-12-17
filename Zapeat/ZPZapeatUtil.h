//
//  ZapeatUtil.h
//  Zapeat
//
//  Created by Marcelo Magalhães on 08/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZPZapeatUtil : NSObject

+(int) hourBetweenDates : (NSDate*) date1 and: (NSDate*) date2;
+ (NSString *) md5  :(NSString*) input;
+(BOOL) isNetworkAvailable;
@end
