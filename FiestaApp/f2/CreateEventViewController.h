//
//  CreateEventViewController.h
//  f2
//
//  Created by Meenal Tambe on 3/13/12.
//  Copyright (c) 2012 University of California, Davis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "ViewEventViewController.h"
#import "MenuViewAppDelegate.h"

@interface CreateEventViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *title;
@property (strong, nonatomic) IBOutlet UITextField *address;
@property (strong, nonatomic) IBOutlet UITextView *description;
@property (strong, nonatomic) IBOutlet UITextField *date;
@property (strong, nonatomic) IBOutlet UITextField *time;
@property (strong, nonatomic) PFObject *currentEvent;
	//- (IBAction)time:(id)sender;
- (IBAction)hidekeyboard:(id)sender;
- (IBAction)store:(id)sender;

@property double flag;
@end
