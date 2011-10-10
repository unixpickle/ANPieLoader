//
//  ANPieLoader.m
//  PieLoadingBar
//
//  Created by Alex Nichol on 10/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ANPieLoader.h"

@implementation ANPieLoader

- (id)initWithFrame:(CGRect)frame style:(ANPieLoaderStyle)aStyle {
	if (frame.size.width != frame.size.height) {
		frame.size.width = frame.size.height;
	}
	if ((self = [super initWithFrame:frame])) {
		self.backgroundColor = [UIColor clearColor];
		style = aStyle;
		borderWidth = 3;
		borderPadding = 3;
		const CGFloat components[4] = {229.0f / 255.0f, 232.0f / 255.0f, 237.0f / 255.0f, 1};
		CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
		CGColorRef mainColor = CGColorCreate(space, components);
		borderColor = mainColor;
		pieColor = CGColorRetain(mainColor);
	}
	return self;
}

- (void)setFrame:(CGRect)frame {
	if (frame.size.width != frame.size.height) {
		frame.size.width = frame.size.height;
	}
	[super setFrame:frame];
}

#pragma mark Properties

- (float)progress {
	return progress;
}

- (void)setProgress:(float)_progress {
	progress = _progress;
	[self setNeedsDisplay];
}

- (CGFloat)borderWidth {
	return borderWidth;
}

- (void)setBorderWidth:(CGFloat)border {
	borderWidth = border;
	[self setNeedsDisplay];
}

- (CGFloat)borderPadding {
	return borderPadding;
}

- (void)setBorderPadding:(CGFloat)padding {
	borderPadding = padding;
	[self setNeedsDisplay];
}

- (void)setBorderColor:(CGColorRef)color {
	if (borderColor) {
		CGColorRelease(borderColor);
	}
	if (color) {
		borderColor = CGColorRetain(color);
	}
	[self setNeedsDisplay];
}

- (void)setPieColor:(CGColorRef)color {
	if (pieColor) {
		CGColorRelease(pieColor);
	}
	if (color) {
		pieColor = CGColorRetain(color);
	}
	[self setNeedsDisplay];
}

#pragma mark Animation

- (void)moveToProgress:(float)newProgress duration:(NSTimeInterval)duration {
	ANPieAnimation * animation = [[ANPieAnimation alloc] initWithPie:self start:[self progress] end:newProgress
															duration:duration];
	if (currentAnimation) {
		[currentAnimation cancelAnimation];
		[currentAnimation release];
	}
	currentAnimation = animation;
	[currentAnimation startAnimation];
}

- (void)moveToProgress:(float)newProgress duration:(NSTimeInterval)duration callback:(ANPieAnimationCallback)callback {
	ANPieAnimation * animation = [[ANPieAnimation alloc] initWithPie:self start:[self progress] end:newProgress
															duration:duration];
	animation.callback = callback;
	if (currentAnimation) {
		[currentAnimation cancelAnimation];
		[currentAnimation release];
	}
	currentAnimation = animation;
	[currentAnimation startAnimation];
}

#pragma mark Drawing

- (void)drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
	if (context == NULL) return;
	// draw the border
	if (borderColor) {
		CGContextSetStrokeColorWithColor(context, borderColor);
	}
	CGContextSetLineCap(context, kCGLineCapSquare);
	CGContextSetLineWidth(context, borderWidth);
	if (borderWidth > 0) {
		CGFloat borderOffset = borderWidth / 2;
		CGRect borderRect = CGRectMake(borderOffset, borderOffset,
									   self.frame.size.width - borderOffset * 2,
									   self.frame.size.height - borderOffset * 2);
		if (style == ANPieLoaderStyleSquare) {
			CGContextBeginPath(context);
			CGContextAddRect(context, borderRect);
		} else {
			
			CGContextBeginPath(context);
			CGContextAddEllipseInRect(context, borderRect);
		}
		CGContextStrokePath(context);
	}
	// clip to correct pie bounds
	CGContextSaveGState(context);
	CGRect inset = CGRectMake(borderWidth + borderPadding, borderWidth + borderPadding,
							  self.frame.size.width - (borderWidth + borderPadding) * 2,
							  self.frame.size.height - (borderWidth + borderPadding) * 2);
	if (style == ANPieLoaderStyleRounded) {
		CGContextBeginPath(context);
		CGContextAddEllipseInRect(context, inset);
		CGContextClip(context);
	} else {
		CGContextBeginPath(context);
		CGContextAddRect(context, inset);
		CGContextClip(context);
	}
	
	// draw the pie
	CGFloat angle = (progress * 360);
	if (angle < 0) angle = 0;
	else if (angle > 360) angle = 360;
	double radians = (360 - angle + 90) * (M_PI / 180);
	CGFloat xPoint = (CGFloat)cos(radians);
	CGFloat yPoint = (CGFloat)sin(radians);
	CGPoint boxPoint = CGPointZero;
	
	CGFloat factor;
	if (abs(xPoint) > abs(yPoint)) {
		factor = abs((inset.size.width / 2) / xPoint);
	} else {
		factor = abs((inset.size.height / 2) / yPoint);
	}
	
	boxPoint = CGPointMake((self.frame.size.width / 2) + (xPoint * factor),
						   ((self.frame.size.height / 2) - (yPoint * factor)));
	
	// create and stroke a path
	if (pieColor) CGContextSetFillColorWithColor(context, pieColor);
	CGContextBeginPath(context);
	
	CGContextMoveToPoint(context, self.frame.size.width / 2, self.frame.size.height / 2);
	CGContextAddLineToPoint(context, self.frame.size.width / 2, inset.origin.y);
		
	if (angle > 45) {
		CGContextAddLineToPoint(context, inset.origin.x + inset.size.width,
								inset.origin.y);
	}
	if (angle > 135) {
		CGContextAddLineToPoint(context, inset.origin.x + inset.size.width,
								inset.origin.y + inset.size.height);
	}
	if (angle > 225) {
		CGContextAddLineToPoint(context, inset.origin.x,
								inset.origin.y + inset.size.height);
	}
	if (angle > 315) {
		CGContextAddLineToPoint(context, inset.origin.x, inset.origin.y);
	}
	
	
	CGContextAddLineToPoint(context, boxPoint.x, boxPoint.y);
	
	CGContextClosePath(context);
	CGContextFillPath(context);
	
	CGContextRestoreGState(context);
}

- (void)dealloc {
	[currentAnimation cancelAnimation];
	[currentAnimation release];
	[self setPieColor:NULL];
	[self setBorderColor:NULL];
	[super dealloc];
}

@end
