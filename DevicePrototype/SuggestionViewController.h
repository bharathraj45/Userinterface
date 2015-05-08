//
//  SuggestionViewController.h
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 21/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SuggestionViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIButton *btnSubmit;
@property (nonatomic, weak) IBOutlet UITextField *txtChoose;
@property (nonatomic, weak) IBOutlet UITextField *txtData;
@property (nonatomic, weak) IBOutlet UITextField *txtComments;

-(IBAction)btnLogoutclick:(UIBarButtonItem *)sender;

@end
