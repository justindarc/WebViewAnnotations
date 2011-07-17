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
@synthesize expandedView = _expandedView;
@synthesize editingView = _editingView;
@synthesize isExpandable = _isExpandable;
@synthesize isExpanded = _isExpanded;
@synthesize isEditable = _isEditable;
@synthesize isEditing = _isEditing;
@synthesize isSelectable = _isSelectable;
@synthesize isSelected = _isSelected;

- (void)didTapButton:(id)sender {
	if (_isEditable) {
		if (_isSelectable) {
			if (_isSelected) {
				if (_isEditing) {
					[self setEditing:NO];
				} else {
					[self setEditing:YES];
				}
			} else {
				[self setSelected:YES];
			}
		} else {
			if (_isEditing) {
				[self setEditing:NO];
			} else {
				[self setEditing:YES];
			}
		}
	} else if (_isExpandable) {
		if (_isExpanded) {
			[self setExpanded:NO];
		} else {
			[self setExpanded:YES];
		}
	}
}

- (void)setExpandable:(BOOL)isExpandable {
	if (_isExpandable != isExpandable) {
		if (!_isExpandable) {
			[self setExpanded:NO];
		}
		
		_isExpandable = isExpandable;
	}
}

- (void)setExpanded:(BOOL)isExpanded {
	if (_isExpandable && _isExpanded != isExpanded) {
		_isExpanded = isExpanded;
		
		if (_isExpanded) {
			[self setEditing:NO];
			
			_expandedView.alpha = 0;
			_expandedView.hidden = NO;
			
			[UIView animateWithDuration:0.2 animations:^(void) {
				_expandedView.alpha = 1;
			}];
		} else {		
			[UIView animateWithDuration:0.2
							 animations:^(void) {
								 _expandedView.alpha = 0;
							 }
							 completion:^(BOOL finished) {
								 _expandedView.hidden = YES;
							 }];
		}
	}
}

- (void)setEditable:(BOOL)isEditable {
	if (_isEditable != isEditable) {
		if (!_isEditable) {
			[self setEditing:NO];
		}
		
		_isEditable = isEditable;
	}
}

- (void)setEditing:(BOOL)isEditing {
	if (_isEditing && _isEditing != isEditing) {
		_isEditing = isEditing;
		
		if (_isEditing) {
			[self setExpanded:NO];
			
			_editingView.alpha = 0;
			_editingView.hidden = NO;
			
			[UIView animateWithDuration:0.2 animations:^(void) {
				_editingView.alpha = 1;
			}];
		} else {
			[UIView animateWithDuration:0.2
							 animations:^(void) {
								 _editingView.alpha = 0;
							 }
							 completion:^(BOOL finished) {
								 _editingView.hidden = YES;
							 }];
		}
	}
}

- (void)setSelectable:(BOOL)isSelectable {
	if (_isSelectable != isSelectable) {
		if (!_isSelectable) {
			[self setSelected:NO];
		}
		
		_isSelectable = isSelectable;
	}
}

- (void)setSelected:(BOOL)isSelected {
	if (_isEditable && _isSelected != isSelected) {
		_isSelected = isSelected;
		
		if (_isSelected) {
			// TODO: Animate selecting
		} else {
			// TODO: Animate de-selecting
		}
	}
}

- (id)initWithPosition:(CGPoint)position
				 title:(NSString *)title
		  expandedView:(UIView *)expandedView
		   editingView:(UIView *)editingView {
	
	if ((self = [super initWithFrame:CGRectMake(0, 0, 40, 40)])) {
		_position = position;
		
		_isExpandable = (expandedView != nil);
		_isExpanded = NO;
		
		_isEditable = (editingView != nil);
		_isEditing = NO;
		
		_isSelectable = (editingView != nil);
		_isSelected = NO;
		
		button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		button.frame = CGRectMake(0, 0, 40, 40);
		[button setTitle:title forState:UIControlStateNormal];
		[button addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
		
		[self addSubview:button];
		
		_expandedView = expandedView;
		_expandedView.frame = CGRectMake(40, 0, _expandedView.frame.size.width, _expandedView.frame.size.height);
		_expandedView.hidden = YES;
		
		[_expandedView.layer setCornerRadius:12.0];
		[_expandedView.layer setMasksToBounds:YES];
		
		[self addSubview:_expandedView];
		
		_editingView = editingView;
		_editingView.frame = CGRectMake(40, 0, _editingView.frame.size.width, _editingView.frame.size.height);
		_editingView.hidden = YES;
		
		[_editingView.layer setCornerRadius:12.0];
		[_editingView.layer setMasksToBounds:YES];
		
		[self addSubview:_editingView];
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
