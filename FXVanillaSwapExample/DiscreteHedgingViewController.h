//
//  DiscreteHedgingViewController.h
//  QuantLibExample
//
//  Created by colman on 15.07.13.
//  Copyright (c) 2013 Striding Edge Technologies. All rights reserved.
//

#import "ViewController.h"
#import "DiscreteHedging.h"

@interface DiscreteHedgingViewController : ViewController {
    DiscreteHedging * discreteHedging;
    
    IBOutlet UIScrollView * scrollResutls;
}

@property IBOutlet UIScrollView * scrollResults;

-(IBAction)calculateHedge:(id)sender;

-(IBAction)quitCalc_:(id)sender;


@end
