//
//  MenuViewAppDelegate.h
//  f2
//
//  Created by Meenal Tambe on 3/8/12.
//  Copyright (c) 2012 University of California, Davis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <Parse/Parse.h>


@interface MenuViewAppDelegate : UIResponder <UIApplicationDelegate>
{
	PFObject *container;
	NSArray *objectsFromParse;
    PFObject *user;
	NSArray *rsvpEvents;
}


- (PFObject *) getFieldValueAtPos;
- (void) setFieldValue:(PFObject *)newVal;
- (NSArray *) returnObjectArray;
- (void) insertObject;
- (PFObject *) getUserObjectId;
- (void) setUserObjectId :(NSString *) input;
- (NSArray *) returnrsvpEventsArray;

-(CLLocationCoordinate2D) getLocationFromAddressString:(NSString*) addressStr;

@property (strong, nonatomic) UIWindow *window;

@end
