//
//  FittedBondCurveViewController.m
//  QuantLibExample
//
//  Created by colman on 15.07.13.
//  Copyright (c) 2013 Striding Edge Technologies. All rights reserved.
//

#import "FittedBondCurveViewController.h"

@interface FittedBondCurveViewController ()

@end

@implementation FittedBondCurveViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        fittedBond = [[FittedBondCurve alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

NSThread * thread_bondCurve ;
-(IBAction)calculateBondCurve:(id)sender {
    
//    NSThread * thread_2 ;
//    -(void) calcHit_ {
//        thread_2 = [[NSThread alloc] initWithTarget:self selector:@selector(dowhat) object:nil];
//        [thread_2 start];
//    }
//
//    -(void) dowhat {
//        if (![[NSThread currentThread]  isCancelled]) {
//            [self calculate];
//        }
//    }
//
//    -(void) stopCalc_ {
//        NSLog(@"in stop");
//        [thread_2 cancel];
//        thread_2 = nil;
//        
//    }
//    thread_2 = [[NSThread alloc] initWithTarget:self selector:@selector(dowhat) object:nil];
//    [thread_2 start];
//
//    [fittedBond calculate];
    thread_bondCurve = [[NSThread alloc] initWithTarget:self selector:@selector(dowhat) object:nil];
    [thread_bondCurve start];
    
}

//-(void) calcHit_ {
//    thread_bondCurve = [[NSThread alloc] initWithTarget:self selector:@selector(dowhat) object:nil];
//    [thread_bondCurve start];
//}

-(void) dowhat {
    if (![[NSThread currentThread]  isCancelled]) {
        [fittedBond calculate];
    }
}



@end
