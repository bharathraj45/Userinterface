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
#import "UITextField+Util.h"


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
@synthesize lblPassengers;
@synthesize lblStart;
@synthesize lblEnd;
@synthesize informationView;
@synthesize departureView;
@synthesize returnView;
@synthesize seatView;
@synthesize classView;
@synthesize modeSegment;

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
    self.btnSearch.backgroundColor = UIColorFromRGBWithAlpha(0x075BA1, 1.0f);
    self.btnClear.backgroundColor = UIColorFromRGBWithAlpha(0x075BA1, 1.0);
//    self.btnClear.backgroundColor = UIColorFromRGBWithAlpha(0x0066CC, 1.0);
    //hex data color information 2996DD 39A0E0 1D8F66 2C9A74
    
//    UIImage* _backGround = [UIImage imageNamed:@"m3-1"];
    UIImage* _backGround = [UIImage imageNamed:@"m4"];
    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:self.view.frame];
    [backgroundImage setImage:_backGround];
    // choose best mode that works for you
    [backgroundImage setContentMode:UIViewContentModeScaleAspectFill];
    [self.view insertSubview:backgroundImage atIndex:0];
    
    self.informationView.layer.cornerRadius = 2.0f;
    self.departureView.layer.cornerRadius = 2.0f;
    self.returnView.layer.cornerRadius = 2.0f;
    self.seatView.layer.cornerRadius = 2.0f;
    self.classView.layer.cornerRadius = 2.0f;
    self.modeSegment.layer.cornerRadius = 2.0f;
    
    [self getStartValueq];
    
    
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
    self.txtNumberOfPassengers.layer.sublayerTransform = CATransform3DMakeTranslation(4, 0, 0);
    
    self.btnSearch.layer.cornerRadius = 2.0f;
    self.btnClear.layer.cornerRadius = 2.0f;
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
    UIImageView *imageDeparting = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"electronicdate"]];
    imageDeparting.frame = CGRectMake(0.0, 0.0, imageDeparting.image.size.width+20.0, imageDeparting.image.size.height);
    imageDeparting.contentMode = UIViewContentModeCenter;
//    UIView *paddingChooseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
//    paddingChooseView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"electronicdate"]];
//    [self.txtDepartingDate editingRectForBounds:txtDepartingDate.bounds];
    self.txtDepartingDate.layer.sublayerTransform = CATransform3DMakeTranslation(4, 0, 0);
    self.txtDepartingDate.rightView = imageDeparting;
    self.txtDepartingDate.rightViewMode = UITextFieldViewModeAlways;
    
    UIImageView *imageReturning = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"electronicdate"]];
    imageReturning.frame = CGRectMake(0.0, 0.0, imageReturning.image.size.width+20.0, imageReturning.image.size.height);
    imageReturning.contentMode = UIViewContentModeCenter;
    self.txtReturningDate.layer.sublayerTransform = CATransform3DMakeTranslation(4, 0, 0);
//    UIView *paddingDateReturningView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
//    paddingDateReturningView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"electronicdate"]];
    self.txtReturningDate.rightView = imageReturning;
    self.txtReturningDate.rightViewMode = UITextFieldViewModeAlways;
    
    UIImageView *imageFromLocation = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"down4"]];
    imageFromLocation.frame = CGRectMake(0.0, 0.0, imageFromLocation.image.size.width+10.0, imageFromLocation.image.size.height);
    imageFromLocation.contentMode = UIViewContentModeCenter;
    self.txtFromLocation.layer.sublayerTransform = CATransform3DMakeTranslation(4, 0, 0);
//    UIView *paddingFromView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
//    paddingFromView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"down4"]];
    self.txtFromLocation.rightView = imageFromLocation;
    self.txtFromLocation.rightViewMode = UITextFieldViewModeAlways;
    
    
    UIImageView *imageTo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"down4"]];
    imageTo.frame = CGRectMake(0.0, 0.0, imageTo.image.size.width+10.0, imageTo.image.size.height);
    imageTo.contentMode = UIViewContentModeCenter;
    self.txtToLocation.layer.sublayerTransform = CATransform3DMakeTranslation(4, 0, 0);
//    UIView *paddingToDataView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
//    paddingToDataView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"down4"]];
    self.txtToLocation.rightView = imageTo;
    self.txtToLocation.rightViewMode = UITextFieldViewModeAlways;
    
    UIImageView *imagetxtClass = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"electronicdate"]];
    imagetxtClass.frame = CGRectMake(0.0, 0.0, imagetxtClass.image.size.width+20.0, imagetxtClass.image.size.height);
    imagetxtClass.contentMode = UIViewContentModeCenter;
    self.txtClass.layer.sublayerTransform = CATransform3DMakeTranslation(4, 0, 0);
//    UIView *paddingPlanView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
//    paddingPlanView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Plan"]];
    self.txtClass.rightView = imagetxtClass;
    self.txtClass.rightViewMode = UITextFieldViewModeAlways;
    
    
//    UIView *paddingNumberView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
//    paddingNumberView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"down4"]];
//    self.txtNumberOfPassengers.rightView = paddingNumberView;
//    self.txtNumberOfPassengers.rightViewMode = UITextFieldViewModeAlways;
}


-(IBAction)btnLogoutclick:(UIBarButtonItem *)sender;{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)btnIncrementClick:(UIButton *)sender{
    NSInteger seat = [lblPassengers.text intValue];
    if(seat >= 0){
        lblPassengers.text = [NSString stringWithFormat:@"%ld", (long)seat+1];
    }
}

-(IBAction)btnDecrementClick:(UIButton *)sender{
    NSInteger seat = [lblPassengers.text intValue];
    if(seat >1){
        lblPassengers.text = [NSString stringWithFormat:@"%ld", (long)seat-1];
    }
//    else if(seat == 0){
//        
//    }
}


-(void)getStartValueq{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"EEEE"];
    [dateFormatter setDateFormat:@"dd   MMMM YYYY \n EEEE"];
    NSString *start = [dateFormatter stringFromDate:[NSDate date]];
    //NSLog(@"%@", [dateFormatter stringFromDate:[NSDate date]]);
    self.lblStart.text = [NSString stringWithFormat:@"%@", start];
//    self.lblEnd.text = [NSString stringWithFormat:@"%@",start];
    
    
    
    NSDate *now4 = [NSDate date];
    int daysToAdd4 = 4;
    NSDate *newDate1 = [now4 dateByAddingTimeInterval:60*60*24*daysToAdd4];
    NSString *end = [dateFormatter stringFromDate:newDate1];
    //NSLog(@"%@", [dateFormatter stringFromDate:newDate1]);
    self.lblEnd.text = [NSString stringWithFormat:@"%@",end];

//    NSDate *now = [NSDate date];
//    int daysToAdd = 43;  // or 60 :-)
//    
//    // set up date components
//    NSDateComponents *components = [[NSDateComponents alloc] init];
//    [components setDay:daysToAdd];
//    
//    // create a calendar
//    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
//    
//    NSDate *newDate2 = [gregorian dateByAddingComponents:components toDate:now options:0];
//    NSLog(@"Clean: %@", [dateFormatter stringFromDate:newDate2]);
   
}
@end
