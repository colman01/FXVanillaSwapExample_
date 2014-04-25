//
//  BondViewController.m
//  QuantLibExample
//
//  Created by colman on 10.07.13.
//  Copyright (c) 2013 Striding Edge Technologies. All rights reserved.
//

#import "BondViewController.h"
//#import "NSDateCategory.h"
#import "DateCategory.h"

@interface BondViewController ()

@end

@implementation BondViewController

NSMutableArray * lookingIntoDates;

@synthesize waiting, results;
@synthesize dirtyPrice,
            settlementDate,
            accruedCoupon,
            previousCoupon,
            yield,
            nextCoupon,
            yieldToClean,
            cleanPrice,
            dates,
            dateEditor,
            scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
#pragma mark Create data methods
        // Custom initialization
        [self createIssueDates];
        [self createMaturityDates];
        [self createCouponRates];
        [self createMarketQuotes];
        
        [self createLiborForcastingCurveQuotes];
        [self createSwaps];
        dateEditor =[[DateEditorViewController alloc] init];
    }
    return self;
}

#pragma mark view stuff
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
        bond = [[Bond alloc] init];
    fixingDays = 3;
    settlementDays = 3;
}
-(void)viewWillAppear:(BOOL)animated{
    
    [scrollView setContentOffset:CGPointMake(0,0)];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Calculate!
- (IBAction)calculate {
    
    NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:@"Waiting" owner:self options:nil];
    UIView *nibVC = [nibObjects objectAtIndex:0];
    
    waiting = [[UIViewController alloc] init];
    [waiting setView:nibVC];
    [waiting setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
//     NSArray * nibObjectsRes = [[NSBundle mainBundle] loadNibNamed:@"BondResult" owner:self options:nil];
//    UIView * nibVCRes = [nibObjectsRes objectAtIndex:0];
    NSArray * nibObjectsRes = [[NSBundle mainBundle] loadNibNamed:@"loadIt" owner:self options:nil];
    UIView * nibVCRes = [nibObjectsRes objectAtIndex:0];
    
    results = [[UIViewController alloc] init];
    [results setView:nibVCRes];
    [results setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];

    
    [self presentViewController:waiting animated:YES completion:^{
        
        [self calculateBond];
        [self setCalcValues];
        [self dismissViewControllerAnimated:YES
                                 completion:^{

                                     [[self navigationController] pushViewController:results animated:YES];
                                 }];
    }];
    
    
    
//    NSArray *nibObjects_wait = [[NSBundle mainBundle] loadNibNamed:@"Waiting" owner:self options:nil];
//    UIView *nibVC_wait = [nibObjects_wait objectAtIndex:0];
//    waiting = [[UIViewController alloc] init];
//    [waiting setView:nibVC_wait];
//    [waiting setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
//    
//    [self setCalcValues];
//    
//    NSArray * nibObjects = [[NSBundle mainBundle] loadNibNamed:@"EquityOptionResults" owner:self options:nil];
//    UIView * nibVC = [nibObjects objectAtIndex:0];
//    results = [[UIViewController alloc] init];
//    [results setView:nibVC];
//    [self setResultsVC];
//    [results setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
//    
//    [[super navigationController] presentViewController:waiting animated:YES completion:^{
//        [eq calculate];
//        [self setResultsVC];
//        [self dismissViewControllerAnimated:YES
//                                 completion:^{
//                                     [[super navigationController] pushViewController:results animated:YES ];
//                                 }
//         ];
//    }];
}

- (void) calculateBond {
    [bond setFixingDays:fixingDays];
    [bond setSettlementDays:settlementDays];
    //        bond.zero
    [bond setRedemption:100.0];
    [bond setBondNumber:5];
    [bond setFaceAmount:100];
    [bond setZeroCouponDate:[[DateCategory alloc] dateWithYear:2013 month:8 day:15 ] :[[DateCategory alloc] dateWithYear:2003 month:8 day:15 ]];
    [bond setFixedBondDate:[[DateCategory alloc] dateWithYear:2007 month:5 day:15 ] :[[DateCategory alloc] dateWithYear:2017 month:5 day:15 ]];
    [bond setFixedRateBondDate:[[DateCategory alloc] dateWithYear:2007 month:5 day:15 ] ];
    //        setFloatBondSchedule
    [bond setFloatBondSchedule:[[DateCategory alloc] dateWithYear:2005 month:10 day:21 ]:[[DateCategory alloc] dateWithYear:2010 month:10 day:21 ]];
    //        setFloatingBondRate
    [bond setFloatingBondRate:[[DateCategory alloc] dateWithYear:2005 month:10 day:21 ]];
    [bond calculate];
}

-(void) setCalcValues {

    
    NSString * value = @"";
    
     // dirty price
    
//    zeroCoupongBondDirtyPrice;
//    fixedRateBondDirtyPrice;
//    floatingRateBondDirtyPrice;
    
    dirtyPrice.text =  [@"Bond Dirty zero coupon price:\n € " stringByAppendingString:[[NSNumber numberWithDouble:bond.zeroCoupongBondDirtyPrice] stringValue]];
    dirtyPrice.text = [dirtyPrice.text stringByAppendingString:@"\n ____________________________"];
     // Accured amount
    
//    zeroCouponBondAccruedAmount;
//    fixedRateBondAccruedAmount; @"Fixed Rate Bond Accrued Amount"
//    floatingRateBondAccruedAmount @"Floating Rate Bond Accrued Amount";
    
    value = [@"Accrued Amount zero coupon price:\n € " stringByAppendingString:[[NSNumber numberWithDouble:bond.zeroCouponBondAccruedAmount] stringValue]];
    value = [value stringByAppendingString:@"\n Fixed Rate Bond Accrued Amount:\n €"];
    value = [value stringByAppendingString:[[NSNumber numberWithDouble:bond.fixedRateBondAccruedAmount] stringValue]];
    value = [value stringByAppendingString:@"\n Floating Rate Bond Accrued Amount:\n € "];
    value = [value stringByAppendingString:[[NSNumber numberWithDouble:bond.floatingRateBondAccruedAmount] stringValue]];
    accruedCoupon.text = value;
    value = [value stringByAppendingString:@"\n ____________________________"];
    
     // Previous Coupon
    
    value = [@"Fixed Rate Bond Previous Coupon Rate:\n € " stringByAppendingString:[[NSNumber numberWithDouble:bond.fixedrateBondPreviousCouponRate] stringValue]];
    value = [value stringByAppendingString:@"\n Floating Rate Bond Previous Coupon Rate:\n €"];
    value = [value stringByAppendingString:[[NSNumber numberWithDouble:bond.floatingRateBontPreviousCouponRate] stringValue]];
    value = [value stringByAppendingString:@"\n ____________________________"];
    previousCoupon.text = value;
    
     // Next Coupon
    
//    fixedRateBondNextCouponRate;
//    floatingRateBoneNextCouponRate;
//    nextCoupon.text
    value = [@"Fixed Rate Bond Next Coupon Rate:\n € " stringByAppendingString:[[NSNumber numberWithDouble:bond.fixedRateBondNextCouponRate] stringValue]];
    value = [value stringByAppendingString:@"\nFloating Rate Bond Next Coupon Rate:\n €"];
    value = [value stringByAppendingString:[[NSNumber numberWithDouble:bond.floatingRateBondAccruedAmount] stringValue]];
    value = [value stringByAppendingString:@"\n ____________________________"];
    nextCoupon.text = value;

    
    // Yield
    
//    zeroCouponBondYieldActual360CompoundedAnnual;
//    fixedRateBondYieldActual360CompoundedAnnual;
//    floatingRateBondYieldActual360CompoundedAnnual;
    
    
    value = [@"Zero Coupon Bond Yield Actual 360 Compounded Annual:\n € " stringByAppendingString:[[NSNumber numberWithDouble:bond.zeroCouponBondYieldActual360CompoundedAnnual] stringValue]];
    
    value = [value stringByAppendingString:@"\nFixed Rate Bond Yield Actual 360 Compounded Annual:\n €"];
    
    value = [value stringByAppendingString:[[NSNumber numberWithDouble:bond.fixedRateBondYieldActual360CompoundedAnnual] stringValue]];
    
    value = [value stringByAppendingString:@"\nFixed Rate Bond Yield Actual 360 Compounded Annual:\n €"];
    
    value = [value stringByAppendingString:[[NSNumber numberWithDouble:bond.floatingRateBondYieldActual360CompoundedAnnual] stringValue]];
    value = [value stringByAppendingString:@"\n ____________________________"];
    yield.text = value;
    
//    yield.text = [@"Bond Dirty zero coupon price:\n € " stringByAppendingString:[[NSNumber numberWithDouble:bond.zeroCoupongBondDirtyPrice] stringValue]];
    
    
//    yieldToClean.text = [@"Yield to Clean:\n € " stringByAppendingString:[[NSNumber numberWithDouble:bond.zeroCoupongBondDirtyPrice] stringValue]];
//    
//    
//    cleanPrice.text = [@"Clean Price:\n € " stringByAppendingString:[[NSNumber numberWithDouble:bond.zeroCoupongBondDirtyPrice] stringValue]];
    
    
}


#pragma mark Create Methods

-(void) createIssueDates {
    issueDates = [[NSMutableArray alloc] init];
    [issueDates addObject:[[DateCategory alloc] dateWithYear:2005 month:3 day:15]];
    [issueDates addObject:[[DateCategory alloc] dateWithYear:2005 month:6 day:15]];
    [issueDates addObject:[[DateCategory alloc] dateWithYear:2006 month:6 day:30]];
    [issueDates addObject:[[DateCategory alloc] dateWithYear:2002 month:11 day:15]];
    [issueDates addObject:[[DateCategory alloc] dateWithYear:1987 month:5 day:15]];
    
//    NSCalendar *cal = [[NSCalendar alloc] init];
//    NSDateComponents *components = [cal components:0 fromDate:date];
//    int year = [components year];
//    int month = [components month];
//    int day = [components day];
    
}


-(void) createMaturityDates {
    maturities = [[NSMutableArray alloc] init];
    [maturities addObject:[[DateCategory alloc] dateWithYear:2010 month:8 day:31]];
    [maturities addObject:[[DateCategory alloc] dateWithYear:2011 month:8 day:31]];
    [maturities addObject:[[DateCategory alloc] dateWithYear:2013 month:8 day:31]];
    [maturities addObject:[[DateCategory alloc] dateWithYear:2018 month:8 day:15]];
    [maturities addObject:[[DateCategory alloc] dateWithYear:2038 month:5 day:15]];
}

-(void) createCouponRates {
    couponRates = [[NSMutableArray alloc] init];
    [couponRates addObject:[NSNumber numberWithFloat:0.02375]];
    [couponRates addObject:[NSNumber numberWithFloat:0.04625]];
    [couponRates addObject:[NSNumber numberWithFloat:0.03125]];
    [couponRates addObject:[NSNumber numberWithFloat:0.04000]];
    [couponRates addObject:[NSNumber numberWithFloat:0.04500]];
}

-(void) createMarketQuotes {
    marketQuotes = [[NSMutableArray alloc] init];
    [marketQuotes addObject:[NSNumber numberWithFloat:100.390625]];
    [marketQuotes addObject:[NSNumber numberWithFloat:106.21875]];
    [marketQuotes addObject:[NSNumber numberWithFloat:100.59375]];
    [marketQuotes addObject:[NSNumber numberWithFloat:101.6875]];
    [marketQuotes addObject:[NSNumber numberWithFloat:102.140625]];
}

-(void) createLiborForcastingCurveQuotes {
    liborForcastingCurveQuotes = [[NSMutableArray alloc] init];
    [liborForcastingCurveQuotes addObject:[NSNumber numberWithFloat:0.043375]];
    [liborForcastingCurveQuotes addObject:[NSNumber numberWithFloat:0.031875]];
    [liborForcastingCurveQuotes addObject:[NSNumber numberWithFloat:0.0320375]];
    [liborForcastingCurveQuotes addObject:[NSNumber numberWithFloat:0.03385]];
    [liborForcastingCurveQuotes addObject:[NSNumber numberWithFloat:0.0338125]];
    [liborForcastingCurveQuotes addObject:[NSNumber numberWithFloat:0.0335125]];
}

-(void) createSwaps {
    swaps = [[NSMutableArray alloc] init];
    [swaps addObject:[NSNumber numberWithFloat:0.0295]];
    [swaps addObject:[NSNumber numberWithFloat:0.0323]];
    [swaps addObject:[NSNumber numberWithFloat:0.0359]];
    [swaps addObject:[NSNumber numberWithFloat:0.0412]];
    [swaps addObject:[NSNumber numberWithFloat:0.0433]];
}

#pragma mark Set arrays with Date info

-(IBAction)setIssuesDates :(id)sender {
    
    dateEditor.dates = issueDates;
    dateEditor.isDate = YES;
    [[super navigationController] pushViewController:dateEditor animated:YES];
}

-(IBAction)setMaturityDates :(id)sender {
    dateEditor.isDate = YES;
    dateEditor.dates = maturities;
    [[super navigationController] pushViewController:dateEditor animated:YES];
    
//    if (!dates.hidden) {
//        dates.hidden = NO;
//    } else {
//        dates.hidden = YES;
//    }
}
-(IBAction)setCouponRates :(id)sender {
    dateEditor.isDate = NO;
    dateEditor.dates = couponRates;
    [[super navigationController] pushViewController:dateEditor animated:YES];

}

-(IBAction)setMarketQuotes :(id)sender {
    
    dateEditor.isDate = NO;
    dateEditor.dates = marketQuotes;
    [[super navigationController] pushViewController:dateEditor animated:YES];


}
-(IBAction)setZeroCoupon :(id)sender {
    
//    [[DateCategory alloc] dateWithYear:2013 month:8 day:15 ] :[[DateCategory alloc] dateWithYear:2003 month:8 day:15 ]
    DateCategory * d1 = [[DateCategory alloc] dateWithYear:2013 month:8 day:15 ];
    DateCategory * d2 = [[DateCategory alloc] dateWithYear:2003 month:8 day:15 ];
    
//        DateCategory * d3 = [[DateCategory alloc] dateWithYear:2003 month:8 day:15 ];
//        DateCategory * d4 = [[DateCategory alloc] dateWithYear:2003 month:8 day:15 ];
//        DateCategory * d5 = [[DateCategory alloc] dateWithYear:2003 month:8 day:15 ];
    dateEditor.dates = [[NSMutableArray alloc] initWithObjects:d1,d2, nil];
    dateEditor.isDate = YES;
    [[super navigationController] pushViewController:dateEditor animated:YES];
    

}

-(IBAction)setFixedBondSchedule :(id)sender {
//    [bond setFixedBondDate:[[DateCategory alloc] dateWithYear:2007 month:5 day:15 ] :[[DateCategory alloc] dateWithYear:2017 month:5 day:15 ]];
    DateCategory * d1 = [[DateCategory alloc] dateWithYear:2007 month:5 day:15 ];
    DateCategory * d2 = [[DateCategory alloc] dateWithYear:2017 month:5 day:15 ];
    dateEditor.dates = [[NSMutableArray alloc] initWithObjects:d1,d2, nil];
    dateEditor.isDate = YES;
    [[super navigationController] pushViewController:dateEditor animated:YES];
}

-(IBAction)setFloatingBondRate :(id)sender {
//    [bond setFloatingBondRate:[[DateCategory alloc] dateWithYear:2005 month:10 day:21 ]];
    
    DateCategory * d1 = [[DateCategory alloc] dateWithYear:2005 month:10 day:21 ];
    dateEditor.dates = [[NSMutableArray alloc] initWithObjects:d1, nil];
    dateEditor.isDate = YES;
    [[super navigationController] pushViewController:dateEditor animated:YES];
//    lookingIntoDates = maturities;
}

-(IBAction)show:(id)sender {
    //    [self presentViewController:results animated:YES completion:nil];
    if (results != nil) {
        [[super navigationController] pushViewController:results animated:YES];
    } else {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Nothing Calculated" message:@"Press calculate" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        [alert show];
    }
    
    
}




#pragma mark UITableView methods
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    lookingIntoDates = issueDates;
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [dates dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [dateFormatter stringFromDate:[lookingIntoDates objectAtIndex:indexPath.row]];
    cell.textLabel.text = dateString;
    return cell;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    dates.hidden = YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

#pragma mark keyboard
-(IBAction)bondTextEntered:(UITextField *)sender {
    [sender resignFirstResponder];

}

@end

















