//
//  Selection.h
//  QuantLibExample
//
//  Created by colman on 13.07.13.
//  Copyright (c) 2013 Striding Edge Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BondViewController.h"

@interface Selection : UINavigationController {

    UITabBar * tabBar;
    

}


@property(nonatomic, retain) UITabBar * tabBar;

@property(nonatomic, retain) BondViewController * bondVC;

@end
