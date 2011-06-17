//
//  exercise5_viewmanagementAppDelegate.h
//  exercise5_viewmanagement
//
//  Created by Matt Westhoff on 6/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class exercise5_viewmanagementViewController;

@interface exercise5_viewmanagementAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet exercise5_viewmanagementViewController *viewController;

@end
