//
//  MenuViewViewController.m
//  f2
//
//  Created by Meenal Tambe on 3/8/12.
//  Copyright (c) 2012 Fiesta. All rights reserved.
//

#import "MenuViewViewController.h"

@implementation MenuViewViewController
@synthesize loginValid;
@synthesize username;
@synthesize password;
@synthesize loginEvent;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setUsername:nil];
    [self setPassword:nil];
    [self setLoginValid:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   // CreateEventViewController* theDataObject = [self theAppDataObject];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)login:(id)sender {

    
}



- (IBAction)hidekeyboard:(id)sender {
    [self.username resignFirstResponder];
    [self.password resignFirstResponder];
    
   /* PFQuery *query = [PFQuery queryWithClassName:@"login"];
    [query whereKey:@"username" equalTo:username.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            [query whereKey: @"password" equalTo:password.text];
            [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
                if (!error) {
                    // The find succeeded.
                    [self.view sendSubviewToBack:loginValid];
                    
                    MenuViewAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
                    [delegate setUserObjectId:@"hHNKeuyIym"];
                } else {
                    // Log details of the failure
                    NSLog(@"Error: password is incorrect");
                    
                }
            }];
        } else {
            // Log details of the failure
            NSLog(@"Error: username is invalid");
            
        }
    }];*/
    
}

-(IBAction)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    /*loginEvent = [PFObject objectWithClassName: @"login"];
    [loginEvent setObject: self.username.text forKey: @"Username"];
    [loginEvent setObject: self.password.text forKey: @"Password"];
    [loginEvent saveInBackground];*/
    // [currentEvent saveEventually];
    
    /*NSLog(@"%@", loginEvent.objectId);
    
    if([segue.identifier isEqualToString:@"LoginSuccess"]) {
        MenuViewViewController *eventPage = [segue destinationViewController];
        eventPage.loginEvent.objectId = self.loginEvent.objectId;
    }*/
    
}
@end
