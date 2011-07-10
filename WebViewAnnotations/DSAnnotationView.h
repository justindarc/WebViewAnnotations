//
//  DSAnnotationView.h
//  WebViewAnnotations
//
//  Created by Justin D'Arcangelo on 7/4/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DSAnnotationView : UIView {
	UIButton *button;
}

@property (nonatomic) CGPoint position;
@property (strong, nonatomic) UIView *contentView;

- (void)toggleContentView;

- (id)initWithPosition:(CGPoint)position title:(NSString *)title contentView:(UIView *)contentView;

@end
