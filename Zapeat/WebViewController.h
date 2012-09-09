//
//  WebViewController.h
//  Zapeat
//
//  Created by Marcelo Magalhães on 07/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreLocationController.h"
#import "Promocao.h"
@interface WebViewController : UIViewController  <CoreLocationControllerDelegate> {
    CoreLocationController *CLController;
}

- (void)showAlert:(Promocao *)promocao;

@property(nonatomic,retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) CoreLocationController *CLController;

@end
