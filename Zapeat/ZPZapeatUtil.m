//
//  ZapeatUtil.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 08/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "ZPZapeatUtil.h"
#import <CommonCrypto/CommonDigest.h> 
#import "Reachability.h"
@implementation ZPZapeatUtil

+(int) hourBetweenDates : (NSDate*) date1 and: (NSDate*) date2 {
    NSTimeInterval distanceBetweenDates = [date2 timeIntervalSinceDate:date1];
    double secondsInAnHour = 3600;
   int hoursBetweenDates = distanceBetweenDates / secondsInAnHour;
    return hoursBetweenDates;

}

+ (NSString *) md5  :(NSString*) input {
    
    const char *cStr = [input UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+(BOOL) isNetworkAvailable {
    
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    
    NetworkStatus status = [reach currentReachabilityStatus];
    
    if(status == NotReachable) {
        
        return NO;
        
    }
    
    return YES;
    
}

@end
