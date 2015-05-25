//
//  SignUpViewController.m
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 21/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import "SignUpViewController.h"
#import "Macros.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

@synthesize btnForgotPassword;
@synthesize btnSignUp;
@synthesize txtEmail;
@synthesize txtPassword;
@synthesize txtConfirmPassword;
@synthesize btnLogin;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *paddingTxtfieldView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
    paddingTxtfieldView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"User"]];
    self.txtEmail.leftView = paddingTxtfieldView;
    self.txtEmail.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingTxtfieldPasswordView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
    paddingTxtfieldPasswordView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"password"]];
    self.txtPassword.leftView = paddingTxtfieldPasswordView;
    self.txtPassword.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingTxtfieldConfirmPasswordView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
    paddingTxtfieldConfirmPasswordView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"password"]];
    self.txtConfirmPassword.leftView = paddingTxtfieldConfirmPasswordView;
    self.txtConfirmPassword.leftViewMode = UITextFieldViewModeAlways;
    
    
//    UIImage* _backGround = [UIImage imageNamed:@"m3-1"];
    UIImage* _backGround = [UIImage imageNamed:@"m4"];
    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:self.view.frame];
    [backgroundImage setImage:_backGround];
    // choose best mode that works for you
    [backgroundImage setContentMode:UIViewContentModeScaleAspectFill];
    [self.view insertSubview:backgroundImage atIndex:0];
    //self.view.backgroundColor = UIColorFromRGBWithAlpha(0xE75155, 1.0);
    
    self.btnSignUp.backgroundColor = UIColorFromRGBWithAlpha(0xC1012F, 1.0);
    [self.btnForgotPassword setTitleColor:UIColorFromRGBWithAlpha(0xC1012F, 1.0) forState:UIControlStateNormal];
//  self.btnLogin.backgroundColor = UIColorFromRGBWithAlpha(0xC1012F, 1.0);
    [self.btnLogin setTitleColor:UIColorFromRGBWithAlpha(0xC1012F, 1.0) forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)viewWillAppear:(BOOL)animated{
    
    self.txtEmail.layer.cornerRadius = 8.0f;
    self.txtEmail.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.txtEmail.layer.borderWidth = 1.0f;
    self.txtEmail.layer.masksToBounds = true;
    
    self.txtPassword.layer.cornerRadius = 8.0f;
    self.txtPassword.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.txtPassword.layer.borderWidth = 1.0f;
    self.txtPassword.layer.masksToBounds = true;
    
    self.txtConfirmPassword.layer.cornerRadius = 8.0f;
    self.txtConfirmPassword.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.txtConfirmPassword.layer.borderWidth = 1.0f;
    self.txtConfirmPassword.layer.masksToBounds = true;
    
    self.btnSignUp.layer.cornerRadius = 8.0f;
    
}

-(IBAction)btnForgotPasswordClikc:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
