//
//  exercise4_classesAppDelegate.h
//  exercise4_classes
//
//  Created by Matt Westhoff on 6/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class exercise4_classesViewController;

@interface exercise4_classesAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet exercise4_classesViewController *viewController;

@end
