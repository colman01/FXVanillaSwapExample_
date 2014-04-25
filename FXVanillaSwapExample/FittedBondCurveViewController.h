//
//  FittedBondCurveViewController.h
//  QuantLibExample
//
//  Created by colman on 15.07.13.
//  Copyright (c) 2013 Striding Edge Technologies. All rights reserved.
//

#import "ViewController.h"
#import "FittedBondCurve.h"

@interface FittedBondCurveViewController : ViewController {
    FittedBondCurve * fittedBond;
}


-(IBAction)calculateBondCurve:(id)sender;

@end
