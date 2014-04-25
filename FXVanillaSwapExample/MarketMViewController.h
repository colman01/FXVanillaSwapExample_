//
//  MarketMViewController.h
//  QuantLibExample
//
//  Created by colman on 15.07.13.
//  Copyright (c) 2013 Striding Edge Technologies. All rights reserved.
//

#import "ViewController.h"
#import "MarketModels.h"

@interface MarketMViewController : ViewController {
    MarketModels * market;
}

-(IBAction)btnCalc:(id)sender;
-(IBAction)quitCalc:(id)sender;

@end
