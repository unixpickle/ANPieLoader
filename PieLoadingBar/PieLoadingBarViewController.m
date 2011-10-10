//
//  PieLoadingBarViewController.m
//  PieLoadingBar
//
//  Created by Alex Nichol on 10/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PieLoadingBarViewController.h"

@implementation PieLoadingBarViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	loadingBar = [(ANPieLoader *)[ANPieLoader alloc] initWithFrame:CGRectMake(10, 10, 300, 300)
															 style:ANPieLoaderStyleRounded];
	[loadingBar setBorderWidth:4];
	[loadingBar setBorderPadding:3];
	[loadingBar setProgress:0.83];
	[self.view addSubview:loadingBar];
	// [self addProgress];
}

- (void)addProgress {
	static BOOL state = NO;
	// go the other direction after waiting 0.5 seconds
	if (!state) {
		state = YES;
		[loadingBar moveToProgress:1 duration:3 callback:^(ANPieAnimation * animation) {
			[self performSelector:@selector(addProgress) withObject:nil afterDelay:0.5];
		}];
	} else {
		state = NO;
		[loadingBar moveToProgress:0 duration:3 callback:^(ANPieAnimation * animation) {
			[self performSelector:@selector(addProgress) withObject:nil afterDelay:0.5];
		}];
	}
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark Memory

- (void)dealloc {
	[loadingBar release];
	[loadingTimer invalidate];
	[super dealloc];
}

@end
