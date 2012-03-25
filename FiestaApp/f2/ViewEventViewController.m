//
//  ViewEventViewController.m
//  f2
//
//  Created by Meenal Tambe on 3/13/12.
//  Copyright (c) 2012 University of California, Davis. All rights reserved.
//

#import "ViewEventViewController.h"
#import "CreateEventViewController.h"

@implementation ViewEventViewController
@synthesize titleBox;
@synthesize addressBox;
@synthesize descriptionBox;
@synthesize date;
@synthesize eventMapView;
@synthesize time;

#define METERS_PER_MILE 1609.44



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
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{	
    MenuViewAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	PFObject *container = [appDelegate getFieldValueAtPos];
		    
	NSLog(@"RetrieveEvent: %@", [appDelegate getFieldValueAtPos]);
    
	titleBox.text = [container objectForKey:@"Title"];
	descriptionBox.text = [container objectForKey:@"Description"];
	addressBox.text = [container objectForKey:@"Address"];
	date.text = [container objectForKey:@"Date"];
	time.text = [container objectForKey:@"Time"];
	
	
    
    NSLog(@"Event Should have loaded\n");    
    
    [super viewDidLoad];
}



- (void)viewDidUnload
{
	[self setEventMapView:nil];
	[self setAddressBox:nil];
	[self setDescriptionBox:nil];
	[self setDate:nil];
	[self setTime:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)viewWillAppear:(BOOL)animated
{
	
	MenuViewAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	PFObject *container = [appDelegate getFieldValueAtPos]; //container for most recent event
	CLLocationCoordinate2D zoomLocation; //object for zooming
	
	zoomLocation = [appDelegate getLocationFromAddressString:[container objectForKey:@"Address"]]; //Address for user typed in event
	AddressAnnotation *addAnnotation = [[AddressAnnotation alloc] initWithCoordinate:zoomLocation]; //Pin drop on mapView
	
	MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE); //zoomLocation, latitude,longitude length to show
	MKCoordinateRegion adjustedRegion = [eventMapView regionThatFits:viewRegion]; //sizing region to map
	
	[eventMapView setRegion:adjustedRegion animated:YES]; //set the map
	[eventMapView addAnnotation:addAnnotation]; //set pin
	
	
}

- (IBAction)rsvpButton:(id)sender {
    MenuViewAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    PFObject *container = [appDelegate getFieldValueAtPos];
    /*NSArray *temp;
    //NSMutableArray *eventArray;
    NSArray *eventArray;
    PFObject *gameScore;// = [PFObject objectWithClassName:@"login"];
    gameScore = [appDelegate getUserObjectId];
    NSLog(@"you are a nig kabir: %@", [appDelegate getUserObjectId]);
    //[gameScore setObject:[[appDelegate getUserObjectId] objectForKey:@"objectId"] forKey:@"objectId"];
    
    PFQuery *userQuery = [PFQuery queryWithClassName:@"login"];
    temp = [userQuery findObjects];    
    
    eventArray = [[temp objectAtIndex:0] objectForKey:@"MyFiestaEvents"];
   // [eventArray addObject:[container objectForKey:@"objectId"]];
    [gameScore setObject:eventArray forKey:@"MyFiestaEvents"];
    [gameScore saveInBackground];
    
    
    NSLog(@"Temp: %@", gameScore);*/
    
	NSLog(@"CETITLE: %@\n", [container objectForKey:@"Title"]);
	
    PFObject *rsvpEvent = [PFObject objectWithClassName:@"rsvpEvent"];
	[rsvpEvent setObject:[container objectForKey:@"Title"]  forKey:@"Title"];
    [rsvpEvent setObject:[container objectForKey:@"Address"]  forKey:@"Address"];
	[rsvpEvent setObject:[container objectForKey:@"Description"]  forKey:@"Description"];
	[rsvpEvent setObject:[container objectForKey:@"Date"]  forKey:@"Date"];
	[rsvpEvent setObject:[container objectForKey:@"Time"]  forKey:@"Time"];
	[rsvpEvent setObject:[container objectId]  forKey:@"EventId"];
	
	[rsvpEvent saveInBackground];
}
@end
