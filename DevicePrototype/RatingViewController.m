//
//  RatingViewController.m
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 05/06/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import "RatingViewController.h"

@interface RatingViewController ()

@end

@implementation RatingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setFeedbackQuestion];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setFeedbackQuestion{
    
    self.rateView.notSelectedImage = [UIImage imageNamed:@"star"];
    self.rateView.halfSelectedImage = [UIImage imageNamed:@"star2"];
    self.rateView.fullSelectedImage = [UIImage imageNamed:@"star2"];
    self.rateView.rating = 0;
    self.rateView.editable = YES;
    self.rateView.maxRating = 5;
    self.rateView.delegate = self;
    
    self.rateView2.notSelectedImage = [UIImage imageNamed:@"star"];
    self.rateView2.halfSelectedImage = [UIImage imageNamed:@"star2"];
    self.rateView2.fullSelectedImage = [UIImage imageNamed:@"star2"];
    self.rateView2.rating = 0;
    self.rateView2.editable = YES;
    self.rateView2.maxRating = 5;
    self.rateView2.delegate = self;
    
    
    self.rateView3.notSelectedImage = [UIImage imageNamed:@"star"];
    self.rateView3.halfSelectedImage = [UIImage imageNamed:@"star2"];
    self.rateView3.fullSelectedImage = [UIImage imageNamed:@"star2"];
    self.rateView3.rating = 0;
    self.rateView3.editable = YES;
    self.rateView3.maxRating = 5;
    self.rateView3.delegate = self;
    
    self.rateView4.notSelectedImage = [UIImage imageNamed:@"star"];
    self.rateView4.halfSelectedImage = [UIImage imageNamed:@"star2"];
    self.rateView4.fullSelectedImage = [UIImage imageNamed:@"star2"];
    self.rateView4.rating = 0;
    self.rateView4.editable = YES;
    self.rateView4.maxRating = 5;
    self.rateView4.delegate = self;
    
    self.rateView5.notSelectedImage = [UIImage imageNamed:@"star"];
    self.rateView5.halfSelectedImage = [UIImage imageNamed:@"star2"];
    self.rateView5.fullSelectedImage = [UIImage imageNamed:@"star2"];
    self.rateView5.rating = 0;
    self.rateView5.editable = YES;
    self.rateView5.maxRating = 5;
    self.rateView5.delegate = self;
    
    self.lblFirst.text = @"Overall, how satisfied or dissatisfied are you with our company?";
    self.lblSecond.text = @"How happy are you with our attention to detail and thoroughness?";
    self.lblThird.text = @"How likely are you to purchase any of our products again?";
    self.lblFourth.text = @"How would you rate the quality of our products?";
    self.lblFifth.text = @"How would you rate the value for money of our products?";
}
// Add to bottom
- (void)rateView:(RateView *)rateView ratingDidChange:(float)rating {
    //self.statusLabel.text = [NSString stringWithFormat:@"Rating: %f", rating];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)btnBackClick:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
