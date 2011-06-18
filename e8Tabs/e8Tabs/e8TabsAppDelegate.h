//
//  e8TabsAppDelegate.h
//  e8Tabs
//
//  Created by Matt Westhoff on 6/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface e8TabsAppDelegate : NSObject <UIApplicationDelegate> {
    UITabBarController* _rootController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController* RootController;

@end
