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
@synthesize GestureRecognizer = _gestureRecognizer;

- (void)viewDidLoad {
	
    BadNewsViewController *badController = [[BadNewsViewController alloc] initWithNibName:@"BadNewsViewController" bundle:nil];
	self.BadNewsViewController = badController;
    
	[self.view insertSubview:badController.view atIndex:0];
	[badController release];
    
    UISwipeGestureRecognizer* gr = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(switchView:)];
    self.GestureRecognizer = gr;
    [gr release];
    
    self.GestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    //This is really annoying on the simulator, alt-shift does it
    //self.GestureRecognizer.numberOfTouchesRequired = 2;

    [self.view addGestureRecognizer:self.GestureRecognizer];

	[super viewDidLoad];
}

-(IBAction) switchView:(id)sender
{
    //This determines which view needs to be displayed
    //superview is only set if the view is onscreen
	if (self.GoodNewsViewController.view.superview == nil) {
		if (self.GoodNewsViewController == nil) {
			GoodNewsViewController *goodController = [[GoodNewsViewController alloc] 
                                                      initWithNibName:@"GoodNewsViewController" bundle:nil];
			self.GoodNewsViewController = goodController;
			[goodController release];
		}
        
        [self animateViewChange:self.GoodNewsViewController.view andHideView:self.BadNewsViewController.view withTransition:UIViewAnimationTransitionCurlUp];
        self.GestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    }
    else {
        if (self.BadNewsViewController == nil) {
            BadNewsViewController *badController = [[BadNewsViewController alloc] 
                                                    initWithNibName:@"BadNewsViewController" bundle:nil];
            self.BadNewsViewController = badController;
            [badController release];
        }
        
        [self animateViewChange:self.BadNewsViewController.view andHideView:self.GoodNewsViewController.view withTransition:UIViewAnimationTransitionCurlDown];
        self.GestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    }
    
}

- (void) animateViewChange:(UIView*)viewToShow andHideView:(UIView*)viewToHide withTransition:(UIViewAnimationTransition) transition{
    [UIView beginAnimations:@"View Curl" context:nil];
    
    [viewToHide removeFromSuperview];
    [self.view insertSubview:viewToShow atIndex:0];
    
    [UIView setAnimationDuration:1.00];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [UIView commitAnimations];
}

 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
     return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
 }

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    //here is where I would fix the view that isn't shown
    //This determines which view needs to be displayed
    //superview is only set if the view is onscreen
	if (self.GoodNewsViewController.view.superview == nil)
    {
        //rotate goodnews
    } 
    else
    {
        //rotate badnews
    }
}

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