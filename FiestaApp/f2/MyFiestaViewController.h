//
//  MyFiestaViewController.h
//  f2
//
//  Created by Meenal Tambe on 3/20/12.
//  Copyright (c) 2012 University of California, Davis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuViewAppDelegate.h"

@interface MyFiestaViewController : UIViewController{
	NSArray *rsvpEvents;
}
@property (strong, nonatomic) IBOutlet UITableView *eventList;

@end
