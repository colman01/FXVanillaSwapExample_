//
//  BondViewController.h
//  QuantLibExample
//
//  Created by colman on 10.07.13.
//  Copyright (c) 2013 Striding Edge Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Bond.h"
#import "DateEditorViewController.h"
//#import "Waiting.xib"

@interface BondViewController : UIViewController<UITableViewDataSource, UITableViewDelegate,UIScrollViewDelegate> {

    
    Bond * bond;
    
    
    IBOutlet UILabel * settlementDate;
    IBOutlet UILabel * dirtyPrice;
    
    IBOutlet UILabel * accruedCoupon;
    IBOutlet UILabel * previousCoupon;
    IBOutlet UILabel * nextCoupon;
    
    IBOutlet UILabel * yield;
    
    IBOutlet UILabel * yieldToClean;
    IBOutlet UILabel * cleanPrice;
    
    IBOutlet UIButton * setIssueDatesBtn;
    IBOutlet UITableView * dates;
    
    
    
    NSDate * settleMentDate;
    
    int fixingDays;
    int settlementDays;
    
//    float zc3mQuote;
//    float zc6mQuote;
//    float zc1yQuote;
    
    float redemption;
    int numberOfBonds;
    
    NSMutableArray * issueDates;
    NSMutableArray * maturities;
    NSMutableArray * couponRates;
    NSMutableArray * marketQuotes;
    NSMutableArray * liborForcastingCurveQuotes;
    float d1wQuote;
    float d1mQuote;
    float d3mQuote;
    float d6mQuote;
    float d9mQuote;
    float d1yQuote;
    // swaps
    NSMutableArray * swaps;
    float s2yQuote;
    float s3yQuote;
    float s5yQuote;
    float s10yQuote;
    float s15yQuote;
    
    float faceAmount;
    
    NSDate * zeroCouponBondDate_1;
    NSDate * zeroCouponBondDate_2;
    
    NSDate * fixedBondScheduleDate_1;
    NSDate * fixedBondScheduleDate_2;
    
    NSDate * fixedRateBondDate;
    
    NSDate * libor3mDate;
    
    NSDate * floatingBondScheduleDate_1;
    NSDate * floatingBondScheduleDate_2;
    
    NSDate * floatingRateBondDate;
    
    
    
    
}

@property (nonatomic, retain)  DateEditorViewController *dateEditor;

@property (nonatomic, retain) IBOutlet UIViewController *waiting;
@property (nonatomic, retain) IBOutlet UIViewController *results;




@property (nonatomic, retain) IBOutlet UILabel * settlementDate;
@property (nonatomic, retain) IBOutlet UILabel * dirtyPrice;

@property (nonatomic, retain) IBOutlet UILabel * accruedCoupon;
@property (nonatomic, retain) IBOutlet UILabel * previousCoupon;
@property (nonatomic, retain) IBOutlet UILabel * nextCoupon;

@property (nonatomic, retain) IBOutlet UILabel * yield;

@property (nonatomic, retain) IBOutlet UILabel * yieldToClean;

@property (nonatomic, retain) IBOutlet UILabel * cleanPrice;

-(IBAction) calculate;

-(IBAction)setIssuesDates :(id)sender;
-(IBAction)setMaturityDates :(id)sender;
-(IBAction)setCouponRates :(id)sender;
-(IBAction)setMarketQuotes :(id)sender;
-(IBAction)setZeroCoupon :(id)sender;
-(IBAction)setFixedBondSchedule :(id)sender;
-(IBAction)setFloatingBondRate :(id)sender;
-(IBAction)show :(id)sender;

- (IBAction)textEntered:(UITextField *)sender;

@property (nonatomic, retain) UITableView * dates;

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;


@end

//    [bond setRedemption:100.0];
//    [bond setBondNumber:5];
//    [bond setFaceAmount:100];
//    [bond setZeroCouponDate:[[DateCategory alloc] dateWithYear:2013 month:8 day:15 ] :[[DateCategory alloc] dateWithYear:2003 month:8 day:15 ]];
//    [bond setFixedBondDate:[[DateCategory alloc] dateWithYear:2007 month:5 day:15 ] :[[DateCategory alloc] dateWithYear:2017 month:5 day:15 ]];
//    [bond setFixedRateBondDate:[[DateCategory alloc] dateWithYear:2007 month:5 day:15 ] ];
//
//    //        setFloatBondSchedule
//    //        Date(21, October, 2005)
//    //        Date(21, October, 2010)
//    [bond setFloatBondSchedule:[[DateCategory alloc] dateWithYear:2005 month:10 day:21 ]:[[DateCategory alloc] dateWithYear:2010 month:10 day:21 ]];
//
//    //        setFloatingBondRate
//    //         Date(21, October, 2005)
//    [bond setFloatingBondRate:[[DateCategory alloc] dateWithYear:2005 month:10 day:21 ]];


