//
//  SuggestionViewController.h
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 21/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RateView.h"

@interface SuggestionViewController : UIViewController <UIActionSheetDelegate, RateViewDelegate>

@property (nonatomic, weak) IBOutlet UIButton *btnSubmit;
@property (nonatomic, weak) IBOutlet UITextField *txtChoose;
@property (nonatomic, weak) IBOutlet UITextField *txtData;
@property (nonatomic, weak) IBOutlet UITextField *txtComments;
@property (nonatomic, weak) IBOutlet UIButton *btnProvideFeedback;

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet RateView *rateView;
-(IBAction)btnLogoutclick:(UIBarButtonItem *)sender;
-(IBAction)btnProvideFeedbackClick:(UIButton *)sender;

@end
