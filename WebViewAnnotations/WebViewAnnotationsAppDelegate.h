//
//  WebViewAnnotationsAppDelegate.h
//  WebViewAnnotations
//
//  Created by Justin D'Arcangelo on 7/4/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewAnnotationsViewController.h"

@class WebViewAnnotationsViewController;

@interface WebViewAnnotationsAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) WebViewAnnotationsViewController *viewController;

@end
