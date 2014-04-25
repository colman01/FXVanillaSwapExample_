//
//  DiscreteHedgingViewController.m
//  QuantLibExample
//
//  Created by colman on 15.07.13.
//  Copyright (c) 2013 Striding Edge Technologies. All rights reserved.
//

#import "DiscreteHedgingViewController.h"

@interface DiscreteHedgingViewController ()

@end

@implementation DiscreteHedgingViewController
@synthesize scrollResults;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        discreteHedging = [[DiscreteHedging alloc] init];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void) viewDidAppear:(BOOL)animated {
    CGRect srlRes = scrollResults.frame;
    NSLog(@"size of frame %f , %f",srlRes.size.height, srlRes.size.width);
    
    CGSize srlRes_ = scrollResults.contentSize;
    NSLog(@"size of content %f , %f",srlRes_.height, srlRes_.width);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)calculateHedge:(id)sender {
    [discreteHedging calcHit_];
}

-(IBAction)quitCalc_:(id)sender {
    //    [market setExitCalc:YES];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"myAlert" message:@"pressed" delegate:self cancelButtonTitle:@"can cel"otherButtonTitles:@"", nil];
    [alert show];
    [discreteHedging stopCalc_];
}

@end
