//
//  PieLoadingBarViewController.h
//  PieLoadingBar
//
//  Created by Alex Nichol on 10/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ANPieLoader.h"

@interface PieLoadingBarViewController : UIViewController {
	NSTimer * loadingTimer;
	ANPieLoader * loadingBar;
}

- (void)addProgress;

@end
