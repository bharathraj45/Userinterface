//
//  BookingViewController.m
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 21/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import "BookingViewController.h"
#import "Macros.h"
#import "DemoSingleton.h"

@interface BookingViewController ()

@end

@implementation BookingViewController

@synthesize txtDepartingDate;
@synthesize txtFromLocation;
@synthesize txtToLocation;
@synthesize txtReturningDate;
@synthesize txtClass;
@synthesize txtNumberOfPassengers;
@synthesize btnClear;
@synthesize btnSearch;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addedViewData];
    
    UISwipeGestureRecognizer *swipeGestureLeftData = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(eventData:)];
    swipeGestureLeftData.numberOfTouchesRequired = 1;
    swipeGestureLeftData.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeGestureLeftData];
    
    UISwipeGestureRecognizer *swipeGestureRightData = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(eventDataRightData:)];
    swipeGestureRightData.numberOfTouchesRequired = 1;
    swipeGestureRightData.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGestureRightData];
    
    //self.view.backgroundColor = UIColorFromRGBWithAlpha(0xE75155, 1.0);
    self.btnSearch.backgroundColor = UIColorFromRGBWithAlpha(0xC1012F, 1.0f);
    self.btnClear.backgroundColor = UIColorFromRGBWithAlpha(0xC1012F, 1.0);
    //hex data color information 2996DD 39A0E0 1D8F66 2C9A74
    
    UIImage* _backGround = [UIImage imageNamed:@"m3-1"];
    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:self.view.frame];
    [backgroundImage setImage:_backGround];
    // choose best mode that works for you
    [backgroundImage setContentMode:UIViewContentModeScaleAspectFill];
    [self.view insertSubview:backgroundImage atIndex:0];
    
}

-(void)eventData:(UISwipeGestureRecognizer *)sender{
    NSUInteger numberoftouchesdata = sender.numberOfTouches;
    if(numberoftouchesdata == 1){
        if(sender.state == UIGestureRecognizerStateEnded){
            self.tabBarController.selectedIndex = 2;
        }
    }
}

-(void)eventDataRightData:(UISwipeGestureRecognizer *)sender{
    NSUInteger numberoftouchesdata = sender.numberOfTouches;
    if(numberoftouchesdata == 1){
        if(sender.state == UIGestureRecognizerStateEnded){
            self.tabBarController.selectedIndex = 0;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated{
    //DemoSingleton *demoSingleton = [DemoSingleton sharedInstance];
    
    self.txtFromLocation.layer.cornerRadius = 8.0f;
    self.txtFromLocation.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.txtFromLocation.layer.borderWidth = 1.0f;
    self.txtFromLocation.layer.masksToBounds = true;
    
    self.txtToLocation.layer.cornerRadius = 8.0f;
    self.txtToLocation.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.txtToLocation.layer.borderWidth = 1.0f;
    self.txtToLocation.layer.masksToBounds = true;
    
    self.txtDepartingDate.layer.cornerRadius = 8.0f;
    self.txtDepartingDate.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.txtDepartingDate.layer.borderWidth = 1.0f;
    self.txtDepartingDate.layer.masksToBounds = true;
    
    self.txtReturningDate.layer.cornerRadius = 8.0f;
    self.txtReturningDate.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.txtReturningDate.layer.borderWidth = 1.0f;
    self.txtReturningDate.layer.masksToBounds = true;
    
    self.txtClass.layer.cornerRadius = 8.0f;
    self.txtClass.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.txtClass.layer.borderWidth = 1.0f;
    self.txtClass.layer.masksToBounds = true;
    
    self.txtNumberOfPassengers.layer.cornerRadius = 8.0f;
    self.txtNumberOfPassengers.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.txtNumberOfPassengers.layer.borderWidth = 1.0f;
    self.txtNumberOfPassengers.layer.masksToBounds = true;
    
    self.btnSearch.layer.cornerRadius = 8.0f;
    self.btnClear.layer.cornerRadius = 8.0f;
    //self.tabBarController.selectedIndex = demoSingleton.selectedIndexForDisplay;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)addedViewData{
    UIView *paddingChooseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
    paddingChooseView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"electronicdate"]];
    self.txtDepartingDate.rightView = paddingChooseView;
    self.txtDepartingDate.rightViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingDateReturningView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
    paddingDateReturningView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"electronicdate"]];
    self.txtReturningDate.rightView = paddingDateReturningView;
    self.txtReturningDate.rightViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingFromView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
    paddingFromView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"down4"]];
    self.txtFromLocation.rightView = paddingFromView;
    self.txtFromLocation.rightViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingToDataView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
    paddingToDataView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"down4"]];
    self.txtToLocation.rightView = paddingToDataView;
    self.txtToLocation.rightViewMode = UITextFieldViewModeAlways;
    
    UIView *paddingPlanView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
    paddingPlanView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Plan"]];
    self.txtClass.rightView = paddingPlanView;
    self.txtClass.rightViewMode = UITextFieldViewModeAlways;
    
    
//    UIView *paddingNumberView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
//    paddingNumberView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"down4"]];
//    self.txtNumberOfPassengers.rightView = paddingNumberView;
//    self.txtNumberOfPassengers.rightViewMode = UITextFieldViewModeAlways;
}


-(IBAction)btnLogoutclick:(UIBarButtonItem *)sender;{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
