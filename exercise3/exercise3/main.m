//
//  main.m
//  exercise3
//
//  Created by Matt Westhoff on 6/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects: @"first", @"second", @"third", nil];
    
    [array removeLastObject];
    
    int arrayLength = (int) [array count];
    
    for (int c = 0; c < arrayLength; ++c) {
        NSLog(@"array[%d] = %@", c, [array objectAtIndex:c]);
    }

    NSLog(@"array[1] = %@", [array objectAtIndex:1]);
    
    [array release];

    [pool drain];
    return 0;
}

