//
//  CoreLocationController.h
//  Zapeat
//
//  Created by Marcelo Magalhães on 08/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol CoreLocationControllerDelegate
@required
- (void)locationUpdate:(CLLocation *)location; // Our location updates are sent here
- (void)locationError:(NSError *)error; // Any errors are sent here
@end

@interface ZPCoreLocationController : NSObject <CLLocationManagerDelegate> {
    
    CLLocationManager *locMgr;
	id delegate;
    
}
@property (nonatomic, retain) CLLocationManager *locMgr;
@property (nonatomic, assign) id delegate;


@end
