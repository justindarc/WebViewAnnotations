//
//  WebViewAnnotationsViewController.h
//  WebViewAnnotations
//
//  Created by Justin D'Arcangelo on 7/4/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DSWebView.h"

#define kDocumentFileName	@"Test"
#define kDocumentFileType	@"pdf"

@interface WebViewAnnotationsViewController : UIViewController <UIWebViewDelegate, DSWebViewDataSource>

@property (strong, nonatomic) IBOutlet DSWebView *webView;

@property (strong, nonatomic) NSArray *annotations;

@end
