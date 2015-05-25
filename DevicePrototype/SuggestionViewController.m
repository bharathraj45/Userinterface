//
//  SuggestionViewController.m
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 21/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import "SuggestionViewController.h"
#import "Macros.h"

@interface SuggestionViewController ()

@end

@implementation SuggestionViewController

@synthesize btnSubmit;
@synthesize txtChoose;
@synthesize txtComments;
@synthesize txtData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self viewDataInformationAdded];
    //0B3024
//    UISwipeGestureRecognizer *swipeGestureLeftData = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(eventData:)];
//    swipeGestureLeftData.numberOfTouchesRequired = 1;
//    swipeGestureLeftData.direction = UISwipeGestureRecognizerDirectionLeft;
//    [self.view addGestureRecognizer:swipeGestureLeftData];
    
    UISwipeGestureRecognizer *swipeGestureRightData = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(eventDataRightInformation:)];
    swipeGestureRightData.numberOfTouchesRequired = 1;
    swipeGestureRightData.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGestureRightData];
    
    
    //self.view.backgroundColor = UIColorFromRGBWithAlpha(0xE75155, 1.0);
//    UIImage* _backGround = [UIImage imageNamed:@"m3-1"];
     UIImage* _backGround = [UIImage imageNamed:@"m4"];
    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:self.view.frame];
    [backgroundImage setImage:_backGround];
    // choose best mode that works for you
    [backgroundImage setContentMode:UIViewContentModeScaleAspectFill];
    [self.view insertSubview:backgroundImage atIndex:0];
//    self.btnSubmit.backgroundColor = UIColorFromRGBWithAlpha(0x0066CC, 1.0);
    self.btnSubmit.backgroundColor = UIColorFromRGBWithAlpha(0x075BA1, 1.0);
}

//-(void)eventData:(UISwipeGestureRecognizer *)sender{
//    NSUInteger numberoftouchesdata = sender.numberOfTouches;
//    if(numberoftouchesdata == 1){
//        if(sender.state == UIGestureRecognizerStateEnded){
//            self.tabBarController.selectedIndex = 3;
//        }
//    }
//}

-(void)eventDataRightInformation:(UISwipeGestureRecognizer *)sender{
    NSUInteger numberoftouchesdata = sender.numberOfTouches;
    if(numberoftouchesdata == 1){
        if(sender.state == UIGestureRecognizerStateEnded){
            self.tabBarController.selectedIndex = 2;
        }
    }
}

-(void)viewDataInformationAdded{
    UIImageView *imageChooseDatq = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"down4"]];
    imageChooseDatq.frame = CGRectMake(0.0, 0.0, imageChooseDatq.image.size.width+20.0, imageChooseDatq.image.size.height);
    imageChooseDatq.contentMode = UIViewContentModeCenter;
//    UIView *paddingFromView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)]; // what ever you want
//    paddingFromView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"down4"]];
    self.txtChoose.rightView = imageChooseDatq;
    self.txtChoose.rightViewMode = UITextFieldViewModeAlways;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated{
    
    self.txtChoose.layer.cornerRadius = 8.0f;
    self.txtChoose.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.txtChoose.layer.borderWidth = 1.0f;
    self.txtChoose.layer.masksToBounds = true;
    self.txtChoose.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);
    
    self.txtComments.layer.cornerRadius = 8.0f;
    self.txtComments.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.txtComments.layer.borderWidth = 1.0f;
    self.txtComments.layer.masksToBounds = true;
    self.txtComments.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);
    
    self.txtData.layer.cornerRadius = 8.0f;
    self.txtData.layer.borderColor = [[UIColor whiteColor] CGColor];
    self.txtData.layer.borderWidth = 1.0f;
    self.txtData.layer.masksToBounds = true;
    self.txtData.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0);
    
    self.btnSubmit.layer.cornerRadius = 8.0f;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(IBAction)btnLogoutclick:(UIBarButtonItem *)sender;{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
