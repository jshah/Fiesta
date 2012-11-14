//
//  Button_FunAppDelegate.h
//  Button Fun
//
//  Created by Kabir Sikand on 1/30/12.
//  Copyright 2012 UC Davis. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Button_FunViewController;

@interface Button_FunAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet Button_FunViewController *viewController;

@end
