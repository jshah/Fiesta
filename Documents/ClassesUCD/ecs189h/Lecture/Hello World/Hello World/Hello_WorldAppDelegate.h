//
//  Hello_WorldAppDelegate.h
//  Hello World
//
//  Created by Kabir Sikand on 1/30/12.
//  Copyright 2012 UC Davis. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Hello_WorldViewController;

@interface Hello_WorldAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Hello_WorldViewController *viewController;

@end
