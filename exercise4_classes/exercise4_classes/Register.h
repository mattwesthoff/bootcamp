//
//  Register.h
//  exercise4_classes
//
//  Created by Matt Westhoff on 6/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Register : NSObject {
    @protected NSString* _name;
}

- (id) initWithName:(NSString*) name;
- (NSUInteger) getCharacterCount:(NSString *) name;
- (void) printName;

@end
