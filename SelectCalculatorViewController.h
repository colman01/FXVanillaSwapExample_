//
//  SelectCalculatorViewController.h
//  QuantLibExample
//
//  Created by colman on 13.07.13.
//  Copyright (c) 2013 Striding Edge Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BondViewController.h"
#import "EquityOptionViewController.h"

#import "CallBond.h"
#import "DiscreteHedgingViewController.h"
#import "FittedBondCurveViewController.h"
#import "ForwardRateViewController.h"
#import "BermudanSwaptionViewController.h"
#import "ReplicationViewController.h"
#import "RepoViewController.h"
#import "SwapViewController.h"
#import "MarketMViewController.h"



@interface SelectCalculatorViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>  {
    
    IBOutlet UITabBarItem * tabBarItem;
    IBOutlet UITableView * tableView;
}

@property (nonatomic, retain) UITabBarItem * tabBarItem;

@property (nonatomic, retain) UITableView * tableView;

@property (strong, nonatomic) BondViewController *viewController;

@property (strong, nonatomic) EquityOptionViewController *eqViewController;


-(IBAction)showBond:(id)sender;

-(IBAction)showEquity:(id)sender;

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;



@end
