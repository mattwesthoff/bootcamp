//
//  SwitchViewController.m
//  e7RootViews
//
//  Created by Matt Westhoff on 6/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SwitchViewController.h"
#import "BadNewsViewController.h"
#import "GoodNewsViewController.h"


@implementation SwitchViewController

@synthesize BadNewsViewController = _badNewsViewController;
@synthesize GoodNewsViewController = _goodNewsViewController;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization.
 }
 return self;
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	
	BadNewsViewController *badController = [[BadNewsViewController alloc] initWithNibName:@"BadNewsView" bundle:nil];
	self.BadNewsViewController = badController;
	//[self.view insertSubview:badController.view atIndex:0];
	[badController release];
	
	[super viewDidLoad];
}

-(IBAction) switchView:(id)sender
{
	if (self.GoodNewsViewController.view.superview == nil) {
		if (self.GoodNewsViewController == nil) {
			GoodNewsViewController *goodController = [[GoodNewsViewController alloc] initWithNibName:@"GoodNewsView" bundle:nil];
			self.GoodNewsViewController = goodController;
			[goodController release];
		}
		
        [self.BadNewsViewController.view removeFromSuperview];
        [self.view insertSubview:self.GoodNewsViewController.view atIndex:0];
        
    }
    else {
        if (self.BadNewsViewController == nil) {
            BadNewsViewController *badController = [[BadNewsViewController alloc] initWithNibName:@"BadNewsView" bundle:nil];
            self.BadNewsViewController = badController;
            [badController release];
        }
		
        [self.GoodNewsViewController.view removeFromSuperview];
        [self.view insertSubview:self.BadNewsViewController.view atIndex:0];
        
    }
    
}

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[self.BadNewsViewController release];
	[self.GoodNewsViewController release];
    [super dealloc];
}


@end