//
//  ANPieLoader.h
//  PieLoadingBar
//
//  Created by Alex Nichol on 10/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ANPieAnimation.h"

typedef enum {
	ANPieLoaderStyleRounded,
	ANPieLoaderStyleSquare
} ANPieLoaderStyle;

@interface ANPieLoader : UIView {
	float progress;
	ANPieLoaderStyle style;
	CGFloat borderWidth;
	CGFloat borderPadding;
	CGColorRef borderColor;
	CGColorRef pieColor;
	
	ANPieAnimation * currentAnimation;
}

- (id)initWithFrame:(CGRect)frame style:(ANPieLoaderStyle)style;

- (float)progress;
- (void)setProgress:(float)progress;

- (CGFloat)borderWidth;
- (void)setBorderWidth:(CGFloat)border;
- (CGFloat)borderPadding;
- (void)setBorderPadding:(CGFloat)padding;

- (void)setBorderColor:(CGColorRef)color;
- (void)setPieColor:(CGColorRef)color;

- (void)moveToProgress:(float)newProgress duration:(NSTimeInterval)duration;
- (void)moveToProgress:(float)newProgress duration:(NSTimeInterval)duration callback:(ANPieAnimationCallback)callback;

@end
