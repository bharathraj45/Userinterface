//
//  RootViewController.h
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 30/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonLogOut;
@property (weak, nonatomic) IBOutlet UIView *flightStatusDataView;
@property (weak, nonatomic) IBOutlet UIView *airportView;
@property (weak, nonatomic) IBOutlet UIView *flightBookingView;
@property (weak, nonatomic) IBOutlet UIView *checkingView;
@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UIView *offersView;
@property (weak, nonatomic) IBOutlet UIView *upcomingView;
@property (weak, nonatomic) IBOutlet UILabel *lblUpcomingData;

-(IBAction)btnLogoutclick:(UIBarButtonItem *)sender;

@end
