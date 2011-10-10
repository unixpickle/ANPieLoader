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
	[loadingBar setProgress:0];
	[loadingBar setBorderWidth:4];
	[loadingBar setBorderPadding:4];
	[loadingBar setProgress:0];
	[self.view addSubview:loadingBar];
	[self addProgress];
}

- (void)addProgress {
	static BOOL state = NO;
	if (!state) {
		state = YES;
		[loadingBar moveToProgress:1 duration:3 callback:^(ANPieAnimation * animation) {
			[self addProgress];
		}];
	} else {
		state = NO;
		[loadingBar moveToProgress:0 duration:3 callback:^(ANPieAnimation * animation) {
			[self addProgress];
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
