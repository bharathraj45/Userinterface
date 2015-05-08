//
//  BookingViewController.h
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 21/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookingViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *txtDepartingDate;
@property (nonatomic, weak) IBOutlet UITextField *txtFromLocation;
@property (nonatomic, weak) IBOutlet UITextField *txtToLocation;
@property (nonatomic, weak) IBOutlet UITextField *txtReturningDate;
@property (nonatomic, weak) IBOutlet UITextField *txtClass;
@property (nonatomic, weak) IBOutlet UITextField *txtNumberOfPassengers;

@property (nonatomic, weak) IBOutlet UIButton *btnSearch;
@property (nonatomic, weak) IBOutlet UIButton *btnClear;


-(IBAction)btnLogoutclick:(UIBarButtonItem *)sender;

@end
