//
//  BeesViewController.h
//  e8Tabs
//
//  Created by Matt Westhoff on 6/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>


@interface BeesViewController : UIViewController {
    SystemSoundID _shakeSoundId;
}

- (IBAction) playShake;
- (IBAction) vibrate;

@end
