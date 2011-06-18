//
//  e7RootViewsAppDelegate.h
//  e7RootViews
//
//  Created by Matt Westhoff on 6/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwitchViewController.h"

@interface e7RootViewsAppDelegate : NSObject <UIApplicationDelegate> {
    SwitchViewController* _switchViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet SwitchViewController* SwitchViewController;

@end
