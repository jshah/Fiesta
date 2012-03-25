//
//  ExploreEventViewController.m
//  f2
//
//  Created by Meenal Tambe on 3/17/12.
//  Copyright (c) 2012 Fiesta. All rights reserved.
//

#import "ExploreEventViewController.h"
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#define METERS_PER_MILE 1609.344

@implementation ExploreEventViewController
@synthesize mapView;
@synthesize flag;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
	mapView.delegate = self;
    [super viewDidLoad];
}


- (void)viewDidUnload
{
	[self setMapView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)dealloc
{
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
	
}

-(IBAction)SegueToEvent:(id)sender{
	MenuViewAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	[appDelegate setFieldValue:current];
	
	[self performSegueWithIdentifier:@"ViewEventFromExplore" sender:self];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(AddressAnnotation *)annotation {
		// Boilerplate pin annotation code
	
	static NSString *AnnotationViewID = @"annotationViewID";
	
    MKPinAnnotationView *pin = (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier: AnnotationViewID];
	if (pin == nil) {
        pin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
    } else {
        pin.annotation = annotation;
    }
	pin.annotation = annotation;
    
    pin.pinColor = MKPinAnnotationColorPurple;
    pin.canShowCallout = YES;
    pin.animatesDrop = YES;
	
	
		// now we'll add the right callout button
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	
	SEL passToSegue = @selector(SegueToEvent:);
	
	[rightButton addTarget:self action: passToSegue  forControlEvents:UIControlEventTouchUpInside];
	
		// customize this line to fit the structure of your code.  basically
		// you just need to find an integer value that matches your object in some way:
		// its index in your array of MKAnnotation items, or an id of some sort, etc
		// 
		// here I'll assume you have an annotation array that is a property of the current
		// class and we just want to store the index of this annotation.
		//NSInteger annotationValue = [self.annotations indexOfObject:annotation];
	
		// set the tag property of the button to the index
		//rightButton.tag = annotationValue;
	
		// tell the button what to do when it gets touched
	
    pin.rightCalloutAccessoryView = rightButton;
	
	NSLog(@"PIN: %@\n", pin);
	
    return pin;
}


- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view{
	PFQuery *query = [PFQuery queryWithClassName:@"FiestaEvent"];
	[query whereKey:@"Title" equalTo:[[view annotation] title]];
	NSArray *array = [query findObjects];
	current = [array objectAtIndex:0];
	
	NSLog(@"annotation title %@",[[view annotation] title]);
	
}

- (void)viewWillAppear:(BOOL)animated
{
	MenuViewAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	CLLocationCoordinate2D zoomLocation; //object for zooming
	PFObject *temporary;
	int i;
	i=0;
	while (i < [[appDelegate returnObjectArray] count]) {
	
		temporary = [[appDelegate returnObjectArray] objectAtIndex:i];
        NSLog(@"Temporary: %@", temporary);
        NSLog(@"%d", i);
	
		zoomLocation = [appDelegate getLocationFromAddressString:[temporary objectForKey:@"Address"]]; //Address for user typed in event
		AddressAnnotation *addAnnotation = [[AddressAnnotation alloc] initWithCoordinate:zoomLocation];
		
		addAnnotation.title = [temporary objectForKey:@"Title"];
		addAnnotation.subtitle = [temporary objectForKey:@"Description"];
	
			//	addAnnotation.ann.rightCalloutAccessoryView = rightButton;
			//	addAnnotation.ann.canShowCallout = YES;
			//	addAnnotation.ann.enabled = YES;
			//[mapView addAnnotation:addAnnotation]; //set pin
			//[mapView viewForAnnotation:addAnnotation];
		current = temporary;
		[mapView addAnnotation:addAnnotation];
		i++;
	}
	
	zoomLocation.latitude = 38.545;
	zoomLocation.longitude = -121.7394444;
	
	MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 3*METERS_PER_MILE, 3*METERS_PER_MILE); //zoomLocation, latitude,longitude length to show
	MKCoordinateRegion adjustedRegion = [mapView regionThatFits:viewRegion]; //sizing region to map
	
	[mapView setRegion:adjustedRegion animated:YES]; //set the map
}


- (IBAction)categories:(id)sender {
}
@end
