//
//  SelectCalculatorViewController.m
//  QuantLibExample
//
//  Created by colman on 13.07.13.
//  Copyright (c) 2013 Striding Edge Technologies. All rights reserved.
//

#import "SelectCalculatorViewController.h"

@interface SelectCalculatorViewController ()

@end

@implementation SelectCalculatorViewController
@synthesize tabBarItem, tableView;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
//        tableView = [[UITableView alloc ] init];
        
//        tableView.delegate = self;
//        tableView.dataSource = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)showBond:(id)sender {
//    [super navigationController]
    
//    UIViewController *bondCon=[[BondViewController  alloc] initWithNibName:@"BondResult" bundle:nil];
        UIViewController *bondCon=[[BondViewController  alloc] initWithNibName:@"BondResult" bundle:nil];
    [[super navigationController] pushViewController:bondCon animated:YES];
}

-(IBAction)showEquity:(id)sender {
    _eqViewController =[[EquityOptionViewController  alloc] initWithNibName:@"EquityOption" bundle:nil];
    [[super navigationController] pushViewController:_eqViewController animated:YES];
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item {
    NSLog(@" did select tabbarItem scelectionCVC");
}
//
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"was pressed");
//}
//
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 10;
//}
//
//
//- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    static NSString *CellIdentifier = @"Cell1";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//    
//    //NSDate *object = _objects[indexPath.row];
//    
//    if(cell == nil)
//    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//        // expected identifier
//    }
//    
////    UITableViewCell * cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier]];
//    return cell;
//}

#pragma mark Table View Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 11;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    

    
    // Set up the cell...
    cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:15];
    
    switch ([indexPath row]) {
        case 0:
            cell.textLabel.text = [NSString  stringWithFormat:@"Equity Option"];
            break;
        case 1:
            cell.textLabel.text = [NSString  stringWithFormat:@"Bond"];
            break;
//        case 2:
//            cell.textLabel.text = [NSString  stringWithFormat:@"Market Models"];
//            break;
//        case 3:
//            cell.textLabel.text = [NSString  stringWithFormat:@"Swap"];
//            break;
//        case 4:
//            cell.textLabel.text = [NSString  stringWithFormat:@"Discrete Hedging"];
//            break;
//        case 5:
//            cell.textLabel.text = [NSString  stringWithFormat:@"Fitted Bond Curve"];
//            break;
//        case 6:
//            cell.textLabel.text = [NSString  stringWithFormat:@"Forward Rate"];
//            break;
//        case 7:
//            cell.textLabel.text = [NSString  stringWithFormat:@"Repo"];
//            break;
//        case 8:
//            cell.textLabel.text = [NSString  stringWithFormat:@"Replication"];
//            break;
//        case 9:
//            cell.textLabel.text = [NSString  stringWithFormat:@"Callable Bonds"];
//            break;
//        case 10:
//            cell.textLabel.text = [NSString  stringWithFormat:@"Bermudan Swaption"];
//            break;
            
        default:
            break;
    }
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UIViewController *bondCon=[[BondViewController  alloc] initWithNibName:@"BondResult" bundle:nil];
    UIViewController *bondCon=[[BondViewController  alloc] initWithNibName:@"BondSetValues" bundle:nil];

    _eqViewController =[[EquityOptionViewController  alloc] initWithNibName:@"EquityOption" bundle:nil];
    
    UIViewController *callBond=[[CallBond  alloc] initWithNibName:@"CallBond" bundle:nil];
    
    UIViewController *discrete=[[DiscreteHedgingViewController  alloc] initWithNibName:@"DiscreteHedgingViewController" bundle:nil];
    
    UIViewController *fit=[[FittedBondCurveViewController  alloc] initWithNibName:@"FittedBondCurveViewController" bundle:nil];
    
    UIViewController *forward=[[ForwardRateViewController  alloc] initWithNibName:@"ForwardRateViewController" bundle:nil];
    
    UIViewController *bermudan=[[BermudanSwaptionViewController  alloc] initWithNibName:@"BermudanSwaptionViewController" bundle:nil];
    
    UIViewController *replication=[[ReplicationViewController  alloc] initWithNibName:@"ReplicationViewController" bundle:nil];
    
    UIViewController *repo=[[RepoViewController  alloc] initWithNibName:@"RepoViewController" bundle:nil];
    
    UIViewController *swap=[[SwapViewController  alloc] initWithNibName:@"SwapViewController" bundle:nil];
    
    UIViewController *market=[[MarketMViewController  alloc] initWithNibName:@"MarketMViewController" bundle:nil];
    
    
    
    
    switch ([indexPath row]) {
        case 0:
            [[super navigationController] pushViewController:_eqViewController animated:YES];
            break;
        case 1:
            [[super navigationController] pushViewController:bondCon animated:YES];
            break;
//        case 2:
//
//            [[super navigationController] pushViewController:market animated:YES];
//            break;
//        case 3:
//            [[super navigationController] pushViewController:swap animated:YES];
//            break;
//        case 4:
//            [[super navigationController] pushViewController:discrete animated:YES];
//            break;
//        case 5:
//            [[super navigationController] pushViewController:fit animated:YES];
//            break;
//        case 6:
//            [[super navigationController] pushViewController:forward animated:YES];
//            break;
//        case 7:
//            [[super navigationController] pushViewController:repo animated:YES];
//            break;
//        case 8:
//            [[super navigationController] pushViewController:replication animated:YES];
//            break;
//        case 9:
//            [[super navigationController] pushViewController:callBond animated:YES];
//            break;
//        case 10:
//            [[super navigationController] pushViewController:bermudan animated:YES];
//            break;
            
            
        default:
            break;
    }
}



@end
