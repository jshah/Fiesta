//
//  AddressAnnotation.m
//  f2
//
//  Created by Kabir Sikand on 3/18/12.
//  Copyright (c) 2012 Fiesta. All rights reserved.
//

#import "AddressAnnotation.h"

@implementation AddressAnnotation
@synthesize coordinate, title, subtitle, ann;

- (NSString *)subtitle{
	return subtitle;
}

- (NSString *)title{
	return title;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c{
	coordinate=c;
	return self;
}

@end
