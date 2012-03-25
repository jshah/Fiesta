//
//  MyFiestaViewController.m
//  f2
//
//  Created by Meenal Tambe on 3/20/12.
//  Copyright (c) 2012 Fiesta. All rights reserved.
//

#import "MyFiestaViewController.h"

@implementation MyFiestaViewController
@synthesize eventList;

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
	
	
    [super viewDidLoad];
}



	//*************************************
	//Table View Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return rsvpEvents.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
		//int arrcnt = [self.harvestRecipeList count];
    return rsvpEvents.count;
		//NSLog(@"%@", self.harvestRecipeList);
		//return self.harvestRecipeList.count;
} 

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	/* [tableView deselectRowAtIndexPath:indexPath animated:YES];
	 
	 if ([[harvestRecipeList objectAtIndex:indexPath.row] isEqual:@"Ice Cream"])
	 { 
	 NSLog(@"%@", [harvestRecipeList objectAtIndex:indexPath.row]);
	 //  ViewController *mainview = [[ViewController alloc] initWithNibName:@"cali" bundle:nil]; 
	 //  [self.navigationController pushViewController:cali animated:YES];
	 
	 } */
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"EventCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
		// Set up the cell...
    NSLog(@"%s Before", __PRETTY_FUNCTION__);
    NSString *cellValue = [[rsvpEvents objectAtIndex:indexPath.row] objectForKey:@"Title"];
    NSLog(@"%s After", __PRETTY_FUNCTION__);
    cell.textLabel.text = cellValue;
    
    return cell;
} 
	//End Table View Methods
	//***************************************



- (void)viewDidUnload
{
	[self setEventList:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
