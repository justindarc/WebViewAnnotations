//
//  DSWebView.h
//  WebViewAnnotations
//
//  Created by Justin D'Arcangelo on 7/4/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DSWebAnnotationView.h"

@protocol DSWebViewDataSource;

@interface DSWebView : UIWebView {
	NSArray *annotations;
	CGPoint offset;
	CGFloat scale;
	BOOL didLoadAnnotationData;
}

@property (strong, nonatomic) IBOutlet id<DSWebViewDataSource> dataSource;

@property (strong, nonatomic, readonly, getter = scrollView) UIScrollView *scrollView;

- (void)reloadAnnotationData;

@end

@protocol DSWebViewDataSource <NSObject>

- (NSUInteger)numberOfAnnotationsInWebView:(DSWebView *)webView;
- (DSWebAnnotationView *)webView:(DSWebView *)webView annotationForIndex:(NSUInteger)index;

@end
