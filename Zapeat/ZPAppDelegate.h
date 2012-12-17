//
//  AppDelegate.h
//  Zapeat
//
//  Created by Marcelo Magalhães on 04/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(strong, nonatomic) NSString *databaseName;
@property(strong, nonatomic) NSString *databasePath;

@end
