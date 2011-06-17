//
//  exercise5_viewmanagementViewController.h
//  exercise5_viewmanagement
//
//  Created by Matt Westhoff on 6/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface exercise5_viewmanagementViewController : UIViewController <UIActionSheetDelegate> {
    IBOutlet UILabel* CountLabel;
    NSString* String;
    NSMutableString* MutableString;
    NSMutableArray* IVarStorage;
}

@property (nonatomic, retain) IBOutlet UILabel* CountLabel;
@property (nonatomic, retain) NSString* String;
@property (nonatomic, retain) NSMutableString* MutableString;
@property (nonatomic, retain) NSMutableArray* IVarStorage;

- (IBAction) retainButtonPressed;
- (IBAction) releaseButtonPressed;
- (IBAction) resetButtonPressed;
- (void) updateLabel: (NSUInteger) count;

@end