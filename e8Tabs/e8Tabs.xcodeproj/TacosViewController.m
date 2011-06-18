//
//  TacosView.m
//  e8Tabs
//
//  Created by Matt Westhoff on 6/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TacosViewController.h"


@implementation TacosViewController

@synthesize Lat = _lat, Long = _long, Alt = _alt, VertAcc = _vertAcc, HorzAcc = _horzAcc;
@synthesize StartDistance = _startDistance, LocationManager = _locationManager;
@synthesize Map = _map;

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
    [_lat release];
    [_long release];
    [_alt release];
    [_vertAcc release];
    [_horzAcc release];
    [_locationManager release];
    [_startDistance release];
    [_map release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CLLocationManager* locmgr = [[CLLocationManager alloc] init];
    self.LocationManager = locmgr;
    [locmgr release];
    
    self.LocationManager.delegate = self;
    self.LocationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.LocationManager startUpdatingLocation];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{    
    self.Lat.text = [NSString stringWithFormat:@"%g", newLocation.coordinate.latitude];
    self.Long.text = [NSString stringWithFormat:@"%g", newLocation.coordinate.longitude];
    self.Alt.text = [NSString stringWithFormat:@"%g", newLocation.altitude];
    self.VertAcc.text = [NSString stringWithFormat:@"%g", newLocation.verticalAccuracy];
    self.HorzAcc.text = [NSString stringWithFormat:@"%g", newLocation.horizontalAccuracy];
    
    //if ([self StartDistance] == nil) {
    //    [self setStartDistance:newLocation];
    //}
    
    if (self.StartDistance == nil) {
        self.StartDistance = newLocation;
    }
    
    CLLocationDistance dist = [newLocation distanceFromLocation:self.StartDistance];
    NSLog(@"%gm", dist);
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 500, 500);
    [self.Map setRegion:region animated:YES];
}

- (void) locationManager:(CLLocationManager*)manager didFailWithError:(NSError *)error
{
    if ([error code] == kCLErrorLocationUnknown){
        NSLog(@"location unknown!");
    }
    else if ([error code] == kCLErrorDenied) {
        NSLog(@"user denied");
    }
}

- (void)viewDidUnload
{
    self.Lat = nil;
    self.Long = nil;
    self.Alt = nil;
    self.VertAcc = nil;
    self.HorzAcc = nil;
    [self.LocationManager stopUpdatingLocation];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
