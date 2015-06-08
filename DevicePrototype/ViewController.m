//
//  ViewController.m
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 21/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import "ViewController.h"
#import "Macros.h"
#import "UITextField+Util.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize btnLoginData;
@synthesize txtLogin;
@synthesize txtPassword;
@synthesize btnForgotPassword;
@synthesize btnLoginAsGuest;
@synthesize btnRegister;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.txtLogin.leftViewMode = UITextFieldViewModeAlways;
    //UIImage *image = [UIImage imageNamed:@"email"];
    //self.txtLogin.leftView = (UIView *)image;
    UIView *paddingTxtfieldView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
    paddingTxtfieldView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"User"]];
    //self.txtLogin textRectForBounds:<#(CGRect)#>
    self.txtLogin.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);
    self.txtLogin.leftView = paddingTxtfieldView;
    self.txtLogin.leftViewMode = UITextFieldViewModeAlways;
    
    
    UIView *paddingTxtfieldRightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
    paddingTxtfieldRightView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"password"]];
    self.txtPassword.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);
    self.txtPassword.leftView = paddingTxtfieldRightView;
    self.txtPassword.leftViewMode = UITextFieldViewModeAlways;
    
//    self.view.backgroundColor = UIColorFromRGBWithAlpha(0x39A0E0, 1.0);
//    UIGraphicsBeginImageContext(self.view.frame.size);
//    f
//    [[UIImage imageNamed:@"m3"] drawInRect:self.view.bounds];
//    
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
    
    
    UIImage* _backGround = [UIImage imageNamed:@"m4"];
    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:self.view.frame];
    [backgroundImage setImage:_backGround];
    // choose best mode that works for you
    [backgroundImage setContentMode:UIViewContentModeScaleAspectFill];
    [self.view insertSubview:backgroundImage atIndex:0];
    
    //self.view.backgroundColor = [UIColor colorWithPatternImage:image];
    self.btnLoginData.backgroundColor = UIColorFromRGBWithAlpha(0xC1012F, 1.0);
    [self.btnForgotPassword setTitleColor:UIColorFromRGBWithAlpha(0xC1012F, 1.0) forState:UIControlStateNormal];
    [self.btnRegister setTitleColor:UIColorFromRGBWithAlpha(0xC1012F, 1.0) forState:UIControlStateNormal];
    [self.btnLoginAsGuest setTitleColor:UIColorFromRGBWithAlpha(0xC1012F, 1.0) forState:UIControlStateNormal];
    
    
    //self.btnForgotPassword. = UIColorFromRGBWithAlpha(0xC60010, 1.0);
    //self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mauritius"]];
//    CAGradientLayer *gradient = [CAGradientLayer layer];2996DD 39A0E0 1D8F66 2C9A74
//    gradient.frame = self.view.bounds;
//    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor blueColor] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
//    [self.view.layer insertSublayer:gradient atIndex:0];
    //F35343
    //C1012F
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    
    self.txtLogin.layer.cornerRadius = 2.0f;
    self.txtLogin.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.txtLogin.layer.borderWidth = 1.0f;
    self.txtLogin.layer.masksToBounds = true;
    
    self.txtPassword.layer.cornerRadius = 2.0f;
    self.txtPassword.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.txtPassword.layer.borderWidth = 1.0f;
    self.txtPassword.layer.masksToBounds = true;
    
    self.btnLoginData.layer.cornerRadius = 2.0f;
}

-(IBAction)btnLoginDataClick:(UIButton *)sender{
  
    
    [self displayToInformation];
//    if(txtLogin.text.length != 0 && txtPassword.text.length != 0 ){
//        [self displayToInformation];
//
//    }
//    else{
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Please enter Username and Password." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
//        [alert show];
//    }
}

-(void)displayToInformation{
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Information" bundle:nil];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Dashboard" bundle:nil];
    
    //UIViewController *sbvc = [sb instantiateViewControllerWithIdentifier:@"firstdata"];
    UIViewController *sbvc = [sb instantiateInitialViewController];
    sbvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:sbvc animated:YES completion:nil];
}

//- (void)willChangeValueForKey:(NSString *)key{
//    NSLog(@"welcome");
//}

-(void)macrodataq:(NSString *)qqqqq{
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#   define DLog(...)
#endif
    // ALog always displays output regardless of the DEBUG setting
#define ALog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
    
#define isIphone (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone))
    
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define DEFAULT_HEIGHT ((IS_IPAD) ? 475.0 : 175.0)
    NSLog(@"%f", DEFAULT_HEIGHT);
    
//    NSLog(@"qqqq %s", __PRETTY_FUNCTION__);
//    NSLog(@"qqqq %s", __FUNCTION__);
//    NSLog(@"qqqq %s", __func__);
//    NSLog(@"qqqq %s", __PRETTY_FUNCTION__);
    NSLog(@"qqqq %s", __FUNCTION__);
    NSLog(@"qqqq %s", __func__);
    NSLog(@"qqqq %d", __CONCAT(1, 4));
    NSLog(@"qqqq %d", __COREFOUNDATION__);
    NSLog(@"qqqq %d", __COUNTER__);
    NSLog(@"qqqq %d", __CONSTANT_CFSTRINGS__);
    NSLog(@"qqqq %d", __clang__);
    NSLog(@"qqqq %d", __clang_major__);
    NSLog(@"qqqq %d", __clang_minor__);
    NSLog(@"qqqq %s", __clang_version__);
    NSLog(@"qqqq %d", __LINE__);
    NSLog(@"qqqq %s", __FILE__);
    NSLog(@"qqqq %s", __FILE__);
    NSLog(@"qqqq %s", __FILE__);
    NSLog(@"qqqq %s", __FILE__);



}
@end
