//
//  DSWebView.h
//  WebViewAnnotations
//
//  Created by Justin D'Arcangelo on 7/4/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "DSAnnotationView.h"

@protocol DSWebViewDataSource;
@protocol DSWebViewDelegate;

@interface DSWebView : UIWebView <UIGestureRecognizerDelegate> {
	NSArray *annotations;
	CGPoint offset;
	CGFloat scale;
	BOOL didLoadAnnotationData;
}

@property (strong, nonatomic) IBOutlet id<DSWebViewDataSource> dataSource;
@property (strong, nonatomic) IBOutlet id<DSWebViewDelegate> annotationDelegate;

@property (strong, nonatomic, readonly, getter = scrollView) UIScrollView *scrollView;
@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRecognizer;

- (void)reloadAnnotationData;
- (void)didTapWithGestureRecognizer:(UITapGestureRecognizer *)tapGestureRecognizer;

@end

@protocol DSWebViewDataSource <NSObject>

- (NSUInteger)numberOfAnnotationsInWebView:(DSWebView *)webView;
- (DSAnnotationView *)webView:(DSWebView *)webView annotationForIndex:(NSUInteger)index;

@end

@protocol DSWebViewDelegate <NSObject>

- (void)didReceiveTapAtAnnotationPosition:(CGPoint)position;

@end
