//
//  ANPieAnimation.h
//  PieLoadingBar
//
//  Created by Alex Nichol on 10/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ANPieLoader, ANPieAnimation;

typedef void (^ANPieAnimationCallback)(ANPieAnimation * animation);

@interface ANPieAnimation : NSObject {
	ANPieLoader * pie;
	NSDate * animationStart;
	NSTimeInterval duration;
	float start, end;
	NSTimer * timer;
	
	ANPieAnimationCallback callback;
}

@property (readonly) ANPieLoader * pie;
@property (nonatomic, copy) ANPieAnimationCallback callback;

- (id)initWithPie:(ANPieLoader *)aPie start:(float)start
			  end:(float)end duration:(NSTimeInterval)timeInterval;

- (float)progressForTime;
- (BOOL)isFinished;
- (void)startAnimation;
- (void)cancelAnimation;

@end
