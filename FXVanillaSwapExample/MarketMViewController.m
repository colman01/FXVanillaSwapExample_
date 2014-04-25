//
//  MarketMViewController.m
//  QuantLibExample
//
//  Created by colman on 15.07.13.
//  Copyright (c) 2013 Striding Edge Technologies. All rights reserved.
//

#import "MarketMViewController.h"


@interface MarketMViewController ()

@end

@implementation MarketMViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    market = [[MarketModels alloc] init];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnCalc:(id)sender {
    [market calcHit];
//        [market calcualte];
}

-(IBAction)quitCalc:(id)sender {
//    [market setExitCalc:YES];
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"myAlert" message:@"pressed" delegate:self cancelButtonTitle:@"can cel"otherButtonTitles:@"", nil];
    [alert show];
    [market stopCalc];
}

@end
