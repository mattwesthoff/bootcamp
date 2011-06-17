//
//  exercise5_viewmanagementViewController.m
//  exercise5_viewmanagement
//
//  Created by Matt Westhoff on 6/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "exercise5_viewmanagementViewController.h"

@implementation exercise5_viewmanagementViewController

@synthesize CountLabel;
@synthesize String;
@synthesize MutableString;
@synthesize IVarStorage;

- (void)dealloc
{
    [IVarStorage release];
    [MutableString release];
    [String release];
    [super dealloc];
}

- (void) didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //using self. here is super important.  it's the difference between using the autoprop and using the member.
    //This is also why the count starts at 2
    //using the prop does a retain on what's passed in
    
    //if you want the count to be one, do:
    /*
        NSMutableString* temp = [[NSMutableString alloc] initWithString:@"a string"];
        self.MutableString = temp;
        [temp release];
     */
    
    //another great practice is to have the protected variables start with _, and then use 
    //@synthesize MutableString = _mutableString;
    
    
    self.MutableString = [[NSMutableString alloc] initWithString:@"a string"];
    self.String = [[NSString alloc] initWithString:@"another string"];
    self.IVarStorage = [[NSMutableArray alloc] initWithCapacity:10];
    [self updateLabel: [MutableString retainCount]];
}

- (IBAction) retainButtonPressed
{
    [IVarStorage addObject:MutableString];
    [self updateLabel: [MutableString retainCount]];
}

- (IBAction) releaseButtonPressed
{
    if ([IVarStorage count] > 0){
        [IVarStorage removeLastObject];
    }
    else {
        UIActionSheet* aSheet = [[UIActionSheet alloc] 
                                 initWithTitle:@"Warning" 
                                 delegate:self 
                                 cancelButtonTitle:@"Don't do it!" 
                                 destructiveButtonTitle:@"Do IT!" 
                                 otherButtonTitles:nil];
        [aSheet showInView:self.view];
        [aSheet release];
    }
    
    [self updateLabel:[MutableString retainCount]];
}

- (IBAction) resetButtonPressed {
    [self.IVarStorage removeAllObjects];
    [self updateLabel: [MutableString retainCount]];
}

- (void) updateLabel:(NSUInteger) count {
    self.CountLabel.text = [NSString stringWithFormat:@"%d",count];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.CountLabel = nil;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0){
        NSLog(@"On second thought, I'd better not!");
    }
    else if (buttonIndex == 1) {
        NSLog(@"Excellent Choice!");
    }
}

@end
