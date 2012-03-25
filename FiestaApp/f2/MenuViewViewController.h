//
//  MenuViewViewController.h
//  f2
//
//  Created by Meenal Tambe on 3/8/12.
//  Copyright (c) 2012 University of California, Davis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "MenuViewAppDelegate.h"

@interface MenuViewViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) PFObject *loginEvent;
- (IBAction)login:(id)sender;
- (IBAction)hidekeyboard:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *loginValid;

@end
