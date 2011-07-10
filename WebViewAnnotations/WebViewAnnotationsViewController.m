//
//  WebViewAnnotationsViewController.m
//  WebViewAnnotations
//
//  Created by Justin D'Arcangelo on 7/4/11.
//  Copyright 2011 None. All rights reserved.
//

#import "WebViewAnnotationsViewController.h"

@implementation WebViewAnnotationsViewController

@synthesize webView = _webView;
@synthesize annotations = _annotations;

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
	[super viewDidLoad];
	
    NSString *path = [[NSBundle mainBundle] pathForResource:kDocumentFileName ofType:kDocumentFileType];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
    [_webView loadRequest:request];
	
	_annotations = [[NSMutableArray alloc] init];
}

- (void)viewDidUnload {
	[super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	
    // Return YES for supported orientations
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
	} else {
	    return YES;
	}
}

#pragma mark - UIWebViewDelegate

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
	
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {
	
	return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
	
}

#pragma mark - DSWebViewDataSource

- (NSUInteger)numberOfAnnotationsInWebView:(DSWebView *)webView {
	return [_annotations count];
}

- (DSAnnotationView *)webView:(DSWebView *)webView annotationForIndex:(NSUInteger)index {
	return [_annotations objectAtIndex:index];
}

#pragma mark - DSWebViewDelegate

- (void)didReceiveTapAtAnnotationPosition:(CGPoint)position {	
	NSString *title = [NSString stringWithFormat:@"%d", [_annotations count] + 1];
	UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, 100)];
	contentView.backgroundColor = [UIColor blackColor];
	
	DSAnnotationView *annotation = [[DSAnnotationView alloc] initWithPosition:position
																		title:title
																  contentView:contentView];
	[_annotations addObject:annotation];
	[_webView reloadAnnotationData];
}

@end
