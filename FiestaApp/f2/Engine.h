//
//  Engine.h
//  f2
//
//  Created by Meenal Tambe on 3/17/12.
//  Copyright (c) 2012 University of California, Davis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Engine : NSObject
{
	PFObject *container[100];
}

+ (Engine *) sharedInstance;

- (PFObject *) getFieldValueAtPos:(NSUInteger)x;
- (void) setFieldValueAtPos:(NSUInteger)x ToValue:(PFObject *)newVal;

@end
