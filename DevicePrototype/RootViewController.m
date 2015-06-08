//
//  RootViewController.m
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 30/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import "RootViewController.h"
#import "SWRevealViewController.h"
#import "Macros.h"
#import "DemoSingleton.h"

@interface RootViewController ()

@end

@implementation RootViewController

@synthesize barButton;
@synthesize barButtonLogOut;
@synthesize flightBookingView;
@synthesize flightStatusDataView;
@synthesize checkingView;
@synthesize airportView;
@synthesize infoView;
@synthesize offersView;
@synthesize upcomingView;
@synthesize lblUpcomingData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.barButton.target = self.revealViewController;
    self.barButton.action = @selector(revealToggle:);
    self.barButton.image = [UIImage imageNamed:@"Sidemenu"];
    
    
    //self.barButtonLogOut.action = @selector(btnLogoutclick:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.navigationItem.title = [NSString stringWithFormat:@"Air Mauritius"];
    
//    UIImage* _backGround = [UIImage imageNamed:@"m3-1"];
    UIImage* _backGround = [UIImage imageNamed:@"m4"];
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithFrame:self.view.frame];
    [backgroundImage setImage:_backGround];
    // choose best mode that works for you
    [backgroundImage setContentMode:UIViewContentModeScaleAspectFill];
    [self.view insertSubview:backgroundImage atIndex:0];
    self.flightBookingView.backgroundColor = UIColorFromRGBWithAlpha(0x2583CC, 1.0f);
    self.flightStatusDataView.backgroundColor = UIColorFromRGBWithAlpha(0xE5BB1C, 1.0f);
    self.airportView.backgroundColor = UIColorFromRGBWithAlpha(0x39401C, 1.0f);
    self.checkingView.backgroundColor = UIColorFromRGBWithAlpha(0xFF6905, 1.0f);
    self.infoView.backgroundColor = UIColorFromRGBWithAlpha(0xE29F3F, 1.0f);//0x2E8B57  0x808000
    self.offersView.backgroundColor = UIColorFromRGBWithAlpha(0x7E417F, 1.0f);
    self.upcomingView.backgroundColor = UIColorFromRGBWithAlpha(0x37B247, 1.0f);
    
    self.flightBookingView.layer.cornerRadius = 2.0f;
    self.flightStatusDataView.layer.cornerRadius = 2.0f;
    self.airportView.layer.cornerRadius = 2.0f;
    self.checkingView.layer.cornerRadius = 2.0f;
    self.offersView.layer.cornerRadius = 2.0f;
    self.upcomingView.layer.cornerRadius = 2.0f;
    //self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Airmauritiuslogodata"]];
    [self upcomingTripData];
    
    
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

-(void)upcomingTripData{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setDateFormat:@"EEEE"];
    [dateFormatter setDateFormat:@"dd MMMM YYYY EEEE"];
    NSDate *now4 = [NSDate date];
    int daysToAdd4 = 4;
    NSDate *newDate1 = [now4 dateByAddingTimeInterval:60*60*24*daysToAdd4];
    NSString *date = [dateFormatter stringFromDate:newDate1];
    //NSLog(@"%@", [dateFormatter stringFromDate:newDate1]);

    
    lblUpcomingData.text = [NSString stringWithFormat:@"James, your upcoming trip is for Wellington and scheduled on %@. Tap to find more details...",date];
}

-(IBAction)btnLogoutclick:(UIBarButtonItem *)sender;{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma - view touch events

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    DemoSingleton *demoSingleton = [DemoSingleton sharedInstance];
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
//    if([touch view] == self.flightStatusDataView){
//        NSLog(@"flig");
//    }
    
    if(CGRectContainsPoint(self.flightStatusDataView.frame, location)){
        //NSLog(@"flig");
        demoSingleton.selectedIndexForDisplay = 2;
        [self displayFlightDataInformation:@"Test"];
    }
    
    else if(CGRectContainsPoint(self.flightBookingView.frame, location)){
        //NSLog(@"flig");
        demoSingleton.selectedIndexForDisplay = 1;
        [self displayFlightDataInformation:@"Test"];
    }
    else if(CGRectContainsPoint(self.checkingView.frame, location)){
        //NSLog(@"flig");
        demoSingleton.selectedIndexForDisplay = 4;
        [self displayFlightDataInformation:@"Test"];
    }
    else if(CGRectContainsPoint(self.airportView.frame, location)){
        //NSLog(@"flig");
        demoSingleton.selectedIndexForDisplay = 2;
        [self displayFlightDataInformation:@"Test"];
    }
    else if(CGRectContainsPoint(self.offersView.frame, location)){
        demoSingleton.selectedIndexForDisplay = 0;
        [self displayFlightDataInformation:@"Test"];
    }
    else if(CGRectContainsPoint(self.upcomingView.frame, location)){
        demoSingleton.selectedIndexForDisplay = 3;
        [self displayFlightDataInformation:@"Test"];
    }

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

-(void)displayFlightDataInformation:(NSString *)name{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:name bundle:nil];
    
    //UIViewController *sbvc = [sb instantiateViewControllerWithIdentifier:@"firstdata"];
    UIViewController *sbvc = [sb instantiateInitialViewController];
    sbvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:sbvc animated:YES completion:nil];
}
@end
