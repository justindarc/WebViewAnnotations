//
//  DSWebAnnotationView.h
//  WebViewAnnotations
//
//  Created by Justin D'Arcangelo on 7/4/11.
//  Copyright 2011 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface DSWebAnnotationView : UIView {
	UIButton *button;
}

@property (nonatomic) CGPoint position;
@property (strong, nonatomic) UIView *expandedView;
@property (strong, nonatomic) UIView *editingView;

@property (nonatomic, setter = setExpandable:) BOOL isExpandable;
@property (nonatomic, setter = setExpanded:) BOOL isExpanded;

@property (nonatomic, setter = setEditable:) BOOL isEditable;
@property (nonatomic, setter = setEditing:) BOOL isEditing;

@property (nonatomic, setter = setSelectable:) BOOL isSelectable;
@property (nonatomic, setter = setSelected:) BOOL isSelected;

- (id)initWithPosition:(CGPoint)position
				 title:(NSString *)title
		  expandedView:(UIView *)expandedView
		   editingView:(UIView *)editingView;

@end
