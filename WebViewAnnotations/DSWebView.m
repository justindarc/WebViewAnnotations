//
//  DSWebView.m
//  WebViewAnnotations
//
//  Created by Justin D'Arcangelo on 7/4/11.
//  Copyright 2011 None. All rights reserved.
//

#import "DSWebView.h"

@implementation DSWebView

@synthesize dataSource = _dataSource;
@synthesize annotationDelegate = _annotationDelegate;
@synthesize scrollView = _scrollView;
@synthesize tapGestureRecognizer = _tapGestureRecognizer;
@synthesize isEditable = _isEditable;

- (UIScrollView *)scrollView {
	if (_scrollView != nil) {
		return _scrollView;
	}
	
	for (id subview in self.subviews) {
		if ([[subview class] isSubclassOfClass:[UIScrollView class]]) {
			_scrollView = subview;
			break;
		}
	}
	
	return _scrollView;
}

- (void)reloadAnnotationData {
	NSUInteger count = (_dataSource != nil) ? [_dataSource numberOfAnnotationsInWebView:self] : 0;
	NSMutableArray *annotationList = [NSMutableArray arrayWithCapacity:count];
	
	for (DSWebAnnotationView *annotation in annotations) {
		[annotation removeFromSuperview];
	}
	
	for (NSUInteger index = 0; index < count; index++) {
		DSWebAnnotationView *annotation = [_dataSource webView:self annotationForIndex:index];
		[annotationList addObject:annotation];
		
		// Add the annotation as a subview.
		[[self scrollView] addSubview:annotation];
	}
	
	annotations = [[NSArray alloc] initWithArray:annotationList];
	
	didLoadAnnotationData = YES;
	
	[self layoutSubviews];
}

- (void)didTapWithGestureRecognizer:(UITapGestureRecognizer *)tapGestureRecognizer {
	CGPoint position = [tapGestureRecognizer locationInView:self];
	
	position.x = (position.x + offset.x) / scale;
	position.y = (position.y + offset.y) / scale;
	
	[_annotationDelegate didReceiveTapAtAnnotationPosition:position];
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		_tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapWithGestureRecognizer:)];
		_tapGestureRecognizer.delegate = self;
		
		[self addGestureRecognizer:_tapGestureRecognizer];
		
		didLoadAnnotationData = NO;
    }
	
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super initWithCoder:decoder])) {
		_tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapWithGestureRecognizer:)];
		_tapGestureRecognizer.delegate = self;
		
		[self addGestureRecognizer:_tapGestureRecognizer];
		
		didLoadAnnotationData = NO;
    }
	
    return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	if (!didLoadAnnotationData) {
		[self reloadAnnotationData];
	}
	
	UIScrollView *scrollView = [self scrollView];
	
	offset = scrollView.contentOffset;
	scale = scrollView.zoomScale / scrollView.minimumZoomScale;
	
	for (DSWebAnnotationView *annotation in annotations) {
		
		// Calculate the new frame for the annotation view based on the
		// annotation's position and the web view's offset and scale.
		CGFloat width = annotation.frame.size.width;
		CGFloat height = annotation.frame.size.height;
		CGFloat x = (annotation.position.x * scale) - (width / 2);
		CGFloat y = (annotation.position.y * scale) - (height / 2);
		
		annotation.frame = CGRectMake(x, y, width, height);
	}
}

#pragma mark - Gesture recognizer delegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
	return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
	BOOL doesIntersectAnnotation = NO;
	
	for (DSWebAnnotationView *annotation in annotations) {
		if (CGRectContainsPoint(annotation.bounds, [touch locationInView:annotation])) {
			doesIntersectAnnotation = YES;
			break;
		}
	}
	
    return !doesIntersectAnnotation;
}

@end
