//
//  AddressAnnotation.h
//  f2
//
//  Created by Kabir Sikand on 3/18/12.
//  Copyright (c) 2012 Fiesta. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface AddressAnnotation : NSObject <MKAnnotation> {
		CLLocationCoordinate2D coordinate;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c;

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* subtitle;
@property (strong, nonatomic) MKAnnotationView *ann;

@end
