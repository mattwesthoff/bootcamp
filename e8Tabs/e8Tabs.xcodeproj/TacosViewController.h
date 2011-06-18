//
//  TacosView.h
//  e8Tabs
//
//  Created by Matt Westhoff on 6/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface TacosViewController : UIViewController <CLLocationManagerDelegate> {
    //CLLocationManager* _locationManager;
    //CLLocation* _startDistance;
    
    //IBOutlet UILabel *_lat, *_long, *_alt, *_vertAcc, *_horzAcc;
}

@property (nonatomic, retain) IBOutlet UILabel *Lat, *Long, *Alt, *VertAcc, *HorzAcc;
@property (nonatomic, retain) CLLocation* StartDistance;
@property (nonatomic, retain) CLLocationManager* LocationManager;

@end
