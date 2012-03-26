//
//  ExploreEventViewController.h
//  f2
//
//  Created by Meenal Tambe on 3/17/12.
//  Copyright (c) 2012 Fiesta. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <Parse/Parse.h>
#import "AddressAnnotation.h"
#import "MenuViewAppDelegate.h"

@interface ExploreEventViewController : UIViewController
{
	PFObject *queries[100];
	NSArray *array;
	PFObject *current;
}

@property double flag;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
