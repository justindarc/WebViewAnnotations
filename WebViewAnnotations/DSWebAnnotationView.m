//
//  DSWebAnnotationView.m
//  WebViewAnnotations
//
//  Created by Justin D'Arcangelo on 7/4/11.
//  Copyright 2011 None. All rights reserved.
//

#import "DSWebAnnotationView.h"

@implementation DSWebAnnotationView

@synthesize position = _position;
@synthesize contentView = _contentView;

- (void)toggleContentView {
	if (_contentView.hidden) {
		_contentView.alpha = 0;
		_contentView.hidden = NO;
		
		[UIView animateWithDuration:0.2 animations:^(void) {
			_contentView.alpha = 1;
		}];
	} else {		
		[UIView animateWithDuration:0.2
						 animations:^(void) {
							 _contentView.alpha = 0;
						 }
						 completion:^(BOOL finished) {
							 _contentView.hidden = YES;
						 }];
	}
}

- (id)initWithPosition:(CGPoint)position title:(NSString *)title contentView:(UIView *)contentView {
	if ((self = [super initWithFrame:CGRectMake(0, 0, 40, 40)])) {
		_position = position;
		
		button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		button.frame = CGRectMake(0, 0, 40, 40);
		[button setTitle:title forState:UIControlStateNormal];
		[button addTarget:self action:@selector(toggleContentView) forControlEvents:UIControlEventTouchUpInside];
		
		[self addSubview:button];
		
		_contentView = contentView;
		_contentView.frame = CGRectMake(40, 0, _contentView.frame.size.width, _contentView.frame.size.height);
		_contentView.hidden = YES;
		
		[self addSubview:_contentView];
	}
	
	return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
