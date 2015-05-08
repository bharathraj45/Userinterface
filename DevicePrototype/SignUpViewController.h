//
//  SignUpViewController.h
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 21/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIButton *btnForgotPassword;

@property (nonatomic, weak) IBOutlet UIButton *btnSignUp;
@property (nonatomic, weak) IBOutlet UIButton *btnLogin;
@property (nonatomic, weak) IBOutlet UITextField *txtEmail;
@property (nonatomic, weak) IBOutlet UITextField *txtPassword;
@property (nonatomic, weak) IBOutlet UITextField *txtConfirmPassword;


-(IBAction)btnForgotPasswordClikc:(UIButton *)sender;

@end
