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
@synthesize btnProvideFeedback;

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
    
    self.rateView.notSelectedImage = [UIImage imageNamed:@"star"];
    self.rateView.halfSelectedImage = [UIImage imageNamed:@"star2"];
    self.rateView.fullSelectedImage = [UIImage imageNamed:@"star2"];
    self.rateView.rating = 0;
    self.rateView.editable = YES;
    self.rateView.maxRating = 5;
    self.rateView.delegate = self;
}

// Add to bottom
- (void)rateView:(RateView *)rateView ratingDidChange:(float)rating {
    self.statusLabel.text = [NSString stringWithFormat:@"Rating: %f", rating];
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
            self.tabBarController.selectedIndex = 3;
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

-(IBAction)btnProvideFeedbackClick:(UIButton *)sender;{
//    UIActionSheet *actionsheet = [[UIActionSheet alloc] initWithTitle:@"Love using Air Mauritius services?" delegate:self cancelButtonTitle:@"No, thanks" destructiveButtonTitle:nil otherButtonTitles:@"Rate now", @"Ask me later", nil];
////    [actionsheet setTintColor:[UIColor greenColor]];
////    actionsheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
////    [[actionsheet layer] setBackgroundColor:[UIColor greenColor].CGColor];
//    [actionsheet showInView:btnProvideFeedback];
//    //[actionsheet showFromTabBar:self.tabBarController.view];
    
//    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Feedback" message:@"Love using Air Mauritius services?" preferredStyle:UIAlertControllerStyleActionSheet];
//    UIAlertAction *alert = [UIAlertAction actionWithTitle:@"Rate now" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        
//        [controller dismissViewControllerAnimated:YES completion:nil];
//    }];
//    
//    UIAlertAction *alert2 = [UIAlertAction actionWithTitle:@"Ask me later" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
//        
//        [controller dismissViewControllerAnimated:YES completion:nil];
//    }];
//    UIAlertAction *alert3 = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
//        
//        [controller dismissViewControllerAnimated:YES completion:nil];
//    }];
//    [controller addAction:alert3];
//    [controller addAction:alert];
//    [controller addAction:alert2];
//    
//    
//    
//    [self presentViewController:controller animated:YES completion:nil];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Rating" bundle:nil];
    
    //UIViewController *sbvc = [sb instantiateViewControllerWithIdentifier:@"firstdata"];
    UIViewController *sbvc = [sb instantiateInitialViewController];
    sbvc.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    [self presentViewController:sbvc animated:YES completion:nil];
    
}

-(void)willPresentActionSheet:(UIActionSheet *)actionSheet{
    [actionSheet setTintColor:[UIColor greenColor]];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [[actionSheet layer] setBackgroundColor:[UIColor greenColor].CGColor];
}
@end
