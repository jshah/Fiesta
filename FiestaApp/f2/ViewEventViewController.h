//
//  ViewEventViewController.h
//  f2
//
//  Created by Meenal Tambe on 3/13/12.
//  Copyright (c) 2012 Fiesta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MapKit/MapKit.h>
#import "AddressAnnotation.h"
#import "CreateEventViewController.h"

@interface ViewEventViewController : UIViewController

-(CLLocationCoordinate2D) getLocationFromAddressString:(NSString*) addressStr;

@property (weak, nonatomic) IBOutlet UITextView *titleBox;
@property (weak, nonatomic) IBOutlet UITextView *addressBox;
@property (weak, nonatomic) IBOutlet UITextView *descriptionBox;
@property (strong, nonatomic) IBOutlet UITextView *date;
@property (weak, nonatomic) IBOutlet MKMapView *eventMapView;
@property (strong, nonatomic) IBOutlet UITextView *time;
- (IBAction)rsvpButton:(id)sender;

@end
