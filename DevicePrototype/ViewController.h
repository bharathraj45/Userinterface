//
//  ViewController.h
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 21/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIButton *btnLoginData;
@property (nonatomic, weak) IBOutlet UITextField *txtLogin;
@property (nonatomic, weak) IBOutlet UITextField *txtPassword;
@property (nonatomic, weak) IBOutlet UIButton *btnForgotPassword;
@property (nonatomic, weak) IBOutlet UIButton *btnRegister;
@property (nonatomic, weak) IBOutlet UIButton *btnLoginAsGuest;


-(IBAction)btnLoginDataClick:(UIButton *)sender;

@end

