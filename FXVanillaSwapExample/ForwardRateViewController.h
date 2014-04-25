//
//  ForwardRateViewController.h
//  QuantLibExample
//
//  Created by colman on 15.07.13.
//  Copyright (c) 2013 Striding Edge Technologies. All rights reserved.
//

#import "ViewController.h"
#import "ForwardRate.h"

@interface ForwardRateViewController : ViewController {
    ForwardRate * forwardRate;
}

-(IBAction)calculateForward:(id)sender;

@end
