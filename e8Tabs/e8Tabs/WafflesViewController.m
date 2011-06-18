//
//  WafflesViewController.m
//  e8Tabs
//
//  Created by Matt Westhoff on 6/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WafflesViewController.h"

@implementation WafflesViewController

@synthesize txtData = _txtData;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [_txtData release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction) saveData {
    NSUserDefaults* settings = [NSUserDefaults standardUserDefaults];
    [settings setObject:self.txtData.text forKey:@"userData"];
    [settings synchronize];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSUserDefaults* settings = [NSUserDefaults standardUserDefaults];
    self.txtData.text = [settings stringForKey:@"userData"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.txtData = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;

}

@end
