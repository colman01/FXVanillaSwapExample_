//
//  AppDelegate.h
//  FXVanillaSwapExample
//
//  Created by Philip Barnes on 11/06/2012.
//  Copyright (c) 2012 Striding Edge Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Selection.h"
#import "BondViewController.h"

//@class ViewController;
//@class EquityOptionViewController;
//@class BondViewController;
@class Selection;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//@property (strong, nonatomic) ViewController *viewController;
//@property (strong, nonatomic) EquityOptionViewController *viewController;
@property (strong, nonatomic) BondViewController *viewController;
@property (strong, nonatomic) Selection *navController;

@end


// Override point for customization after application launch.
//    self.viewController = [[EquityOptionViewController alloc] initWithNibName:@"EquityOption" bundle:nil];
//   self.viewController = [[BondViewController alloc] initWithNibName:@"BondResult" bundle:nil];
// Nav
//    self.viewController = [[Selection alloc] initWithNibName:@"Select" bundle:nil];
//    self.window.rootViewController = self.viewController;
//    [self.window makeKeyAndVisible];

//    [[self window] setRootViewController:[[UINavigationController alloc] initWithRootViewController:self.navController]];

//  Bond VC
//    UIViewController *rootController=[[BondViewController  alloc] initWithNibName:@"BondResult" bundle:nil];