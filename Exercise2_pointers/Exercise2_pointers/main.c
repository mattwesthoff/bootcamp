//
//  main.c
//  Exercise2_pointers
//
//  Created by Matt Westhoff on 6/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#include <stdio.h>

int main (int argc, const char * argv[])
{
    // insert code here...
 
    int *v_ptr;
    int v = 0;
    
    v_ptr = &v;
    
    for (int x = 0; x < 10; x++) {
        (*v_ptr)++;
    }
    
    printf("counter = %d", v);
    
    return 0;
}
