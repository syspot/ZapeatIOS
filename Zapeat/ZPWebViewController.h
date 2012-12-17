//
//  WebViewController.h
//  Zapeat
//
//  Created by Marcelo Magalhães on 07/09/12.
//  Copyright (c) 2012 TopSys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZPCoreLocationController.h"
#import "ZPPromocao.h"
@interface ZPWebViewController : UIViewController  <CoreLocationControllerDelegate,UIWebViewDelegate> {
    ZPCoreLocationController *CLController;
    UIActivityIndicatorView *loadingIndicator;
}

- (void)showAlert:(ZPPromocao *)promocao;

@property(nonatomic,retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) ZPCoreLocationController *CLController;

@end
