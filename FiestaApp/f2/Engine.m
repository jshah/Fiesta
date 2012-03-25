//
//  Engine.m
//  f2
//
//  Created by Meenal Tambe on 3/17/12.
//  Copyright (c) 2012 University of California, Davis. All rights reserved.
//

#import "Engine.h"

@implementation Engine

static Engine *_sharedInstance;

- (id) init
{
	if (self == [super init])
	{
		// custom initialization
	}
	return self;
}

+ (Engine *) sharedInstance
{
	if (!_sharedInstance)
	{
		_sharedInstance = [[Engine alloc] init];
	}
    
	return _sharedInstance;
}

- (void) setFieldValueAtPos:(NSUInteger)x ToValue:(PFObject *)newVal
{
	container[x] = newVal;
}


- (PFObject *) getFieldValue:(NSUInteger)x
{
    return container[x];
}



@end
