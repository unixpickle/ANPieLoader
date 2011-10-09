//
//  PieLoadingBarAppDelegate.h
//  PieLoadingBar
//
//  Created by Alex Nichol on 10/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PieLoadingBarViewController;

@interface PieLoadingBarAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PieLoadingBarViewController *viewController;

@end
