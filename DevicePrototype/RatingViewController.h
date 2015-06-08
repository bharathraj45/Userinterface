//
//  RatingViewController.h
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 05/06/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RateView.h"

@interface RatingViewController : UIViewController<RateViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblFirst;
@property (weak, nonatomic) IBOutlet UILabel *lblSecond;
@property (weak, nonatomic) IBOutlet UILabel *lblThird;
@property (weak, nonatomic) IBOutlet UILabel *lblFourth;
@property (weak, nonatomic) IBOutlet UILabel *lblFifth;

@property (weak, nonatomic) IBOutlet RateView *rateView;
@property (weak, nonatomic) IBOutlet RateView *rateView2;
@property (weak, nonatomic) IBOutlet RateView *rateView3;
@property (weak, nonatomic) IBOutlet RateView *rateView4;
@property (weak, nonatomic) IBOutlet RateView *rateView5;

@property (strong, nonatomic) IBOutletCollection(RateView) NSArray *rateView6;

-(IBAction)btnBackClick:(id)sender;


@end
