//
//  ANPieAnimation.m
//  PieLoadingBar
//
//  Created by Alex Nichol on 10/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ANPieAnimation.h"
#import "ANPieLoader.h"

@interface ANPieAnimation (Private)

- (void)timerTick;

@end

@implementation ANPieAnimation

@synthesize callback;

- (id)initWithPie:(ANPieLoader *)aPie start:(float)_start
			  end:(float)_end duration:(NSTimeInterval)timeInterval {
	if ((self = [super init])) {
		self.pie = aPie;
		animationStart = [NSDate date];
		duration = timeInterval;
		start = _start;
		end = _end;
	}
	return self;
}

- (float)progressForTime {
	NSDate * date = [NSDate date];
	NSTimeInterval interval = [date timeIntervalSinceDate:animationStart];
	if (interval > duration) return NAN;
	float difference = end - start;
	return start + (difference * (interval / duration));
}

- (BOOL)isFinished {
    NSTimeInterval interval;
    @autoreleasepool {
        NSDate * date = [NSDate date];
        interval = [date timeIntervalSinceDate:animationStart];
    }
	if (interval > duration) return YES;
	return NO;
}

- (void)cancelAnimation {
	[timer invalidate];
	timer = nil;
}

- (void)startAnimation {
	if (!timer) {
		timer = [NSTimer scheduledTimerWithTimeInterval:(1.0f / 30.0f)
												 target:self
											   selector:@selector(timerTick)
											   userInfo:nil repeats:YES];
	}
}

#pragma mark Private

- (void)timerTick {
    ANPieLoader * pie = self.pie;
	if ([self isFinished]) {
		[pie setProgress:end];
		if (self.callback) self.callback(self);
		[self cancelAnimation];
	} else [pie setProgress:[self progressForTime]];
}

- (void)dealloc {
	self.callback = nil;
	[self cancelAnimation];
}

@end
