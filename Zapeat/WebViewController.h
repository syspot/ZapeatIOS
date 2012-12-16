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
@interface WebViewController : UIViewController  <CoreLocationControllerDelegate,UIWebViewDelegate> {
    CoreLocationController *CLController;
    UIActivityIndicatorView *loadingIndicator;
}

- (void)showAlert:(Promocao *)promocao;

@property(nonatomic,retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) CoreLocationController *CLController;

@end
