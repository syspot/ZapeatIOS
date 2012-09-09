//
//  ZapeatUtil.m
//  Zapeat
//
//  Created by Marcelo Magalhães on 08/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import "ZapeatUtil.h"

@implementation ZapeatUtil

+(int) hourBetweenDates : (NSDate*) date1 and: (NSDate*) date2 {
    NSTimeInterval distanceBetweenDates = [date2 timeIntervalSinceDate:date1];
    double secondsInAnHour = 3600;
   int hoursBetweenDates = distanceBetweenDates / secondsInAnHour;
    return hoursBetweenDates;

}
@end
