//
//  SwitchViewController.h
//  e7RootViews
//
//  Created by Matt Westhoff on 6/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BadNewsViewController;
@class GoodNewsViewController;

@interface SwitchViewController : UIViewController {
    BadNewsViewController* _badNewsViewController;
    GoodNewsViewController* _goodNewsViewController;
}

@property (nonatomic, retain) BadNewsViewController* BadNewsViewController;
@property (nonatomic, retain) GoodNewsViewController* GoodNewsViewController;

- (IBAction) switchView:(id)sender;

@end
