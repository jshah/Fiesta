//
//  MenuViewAppDelegate.m
//  f2
//
//  Created by Meenal Tambe on 3/8/12.
//  Copyright (c) 2012 Fiesta. All rights reserved.
//

#import "MenuViewAppDelegate.h"
#import <Parse/Parse.h>

@implementation MenuViewAppDelegate

@synthesize window = _window;

/*-(void) setUserObjectId :(NSString *)input{
    user = [PFObject user.objectId = input];
    
} */


-(PFObject *) getUserObjectId{
    return user;
}

- (void) setFieldValue:(PFObject *)newVal
{
	container = newVal;
}

- (PFObject *) getFieldValueAtPos
{
	return container;
}

- (NSArray *) returnrsvpEventsArray{
	
	PFQuery *query = [PFQuery queryWithClassName:@"rsvpEvent"];
	rsvpEvents = [query findObjects];
	
	NSLog(@"%@", rsvpEvents);
	
	return rsvpEvents;
}

- (NSArray *) returnObjectArray
{
	PFQuery *query = [PFQuery queryWithClassName:@"FiestaEvent"];
	objectsFromParse = [query findObjects];
	return objectsFromParse;
}

- (void) insertObject
{
    PFQuery *query = [PFQuery queryWithClassName:@"FiestaEvent"];
	objectsFromParse = [query findObjects];
}

-(CLLocationCoordinate2D ) getLocationFromAddressString:(NSString*) addressStr 
{
    NSString *urlStr = [NSString stringWithFormat:@"http://maps.google.com/maps/geo?q=%@&output=csv", 
						[addressStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSString *locationStr = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlStr]];
    NSArray *items = [locationStr componentsSeparatedByString:@","];
	
    double lat = 0.0;
    double longitude = 0.0;
	
    if([items count] >= 4 && [[items objectAtIndex:0] isEqualToString:@"200"])
	{
        lat = [[items objectAtIndex:2] doubleValue];
        longitude = [[items objectAtIndex:3] doubleValue];
    }
    else {
        NSLog(@"Address, %@ not found: Error %@",addressStr, [items objectAtIndex:0]);
    }
    CLLocationCoordinate2D location;
    location.latitude = lat;
    location.longitude = longitude;
	
    return location;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //Parse stuff
	MenuViewAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	[Parse setApplicationId:@"zG191aqjKDCHEXU6BaEYAgbZ7WLLX8V5cZi7RlvO" 
                  clientKey:@"PfbHHSzfbLVVwCeLIX7Wl8ja2uKc2GURUT2HZAWy"];
	
    PFQuery *query = [PFQuery queryWithClassName:@"FiestaEvent"];
	objectsFromParse = [query findObjects];
    
    return YES;
}


							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}



@end
