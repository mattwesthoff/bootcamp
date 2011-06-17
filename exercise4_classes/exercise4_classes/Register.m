//
//  Register.m
//  exercise4_classes
//
//  Created by Matt Westhoff on 6/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Register.h"


@implementation Register
- (id) initWithName:(NSString*) name {
    if (self == [super init]) {
        _name = name;
    }
    return self;
}

- (NSUInteger) getCharacterCount:(NSString *) name {
    return [name length];
}

- (void) printName {
    NSLog(@"Name = %@", _name);
}

- (void) dealloc
{
    [_name release];
    [super dealloc];
}
@end
