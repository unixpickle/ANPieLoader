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
	loadingBar = [(ANPieLoader *)[ANPieLoader alloc] initWithFrame:CGRectMake(10, 100, 300, 300)
															 style:ANPieLoaderStyleRounded];
	[loadingBar setBorderWidth:4];
	[loadingBar setBorderPadding:3];
	[loadingBar setProgress:0.5];
	[self.view addSubview:loadingBar];
}

- (IBAction)setProgress:(UISlider *)sender {
    loadingBar.progress = sender.value;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
