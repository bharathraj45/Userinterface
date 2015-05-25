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
    self.flightBookingView.backgroundColor = UIColorFromRGBWithAlpha(0x0066CC, 1.0f);
    self.flightStatusDataView.backgroundColor = UIColorFromRGBWithAlpha(0xD26E03, 1.0f);
    self.airportView.backgroundColor = UIColorFromRGBWithAlpha(0x6B8E23, 1.0f);
    self.checkingView.backgroundColor = UIColorFromRGBWithAlpha(0xDB7093, 1.0f);
    self.infoView.backgroundColor = UIColorFromRGBWithAlpha(0xE29F3F, 1.0f);//0x2E8B57  0x808000
    self.offersView.backgroundColor = UIColorFromRGBWithAlpha(0x6633CC, 1.0f);
    //self.upcomingView.backgroundColor = UIColorFromRGBWithAlpha(0x191970, 1.0f);
    //self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Airmauritiuslogodata"]];
    
    
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
        [self displayFlightDataInformation];
    }
    
    else if(CGRectContainsPoint(self.flightBookingView.frame, location)){
        //NSLog(@"flig");
        demoSingleton.selectedIndexForDisplay = 1;
        [self displayFlightDataInformation];
    }
    else if(CGRectContainsPoint(self.checkingView.frame, location)){
        //NSLog(@"flig");
        demoSingleton.selectedIndexForDisplay = 3;
        [self displayFlightDataInformation];
    }
    else if(CGRectContainsPoint(self.airportView.frame, location)){
        //NSLog(@"flig");
        demoSingleton.selectedIndexForDisplay = 2;
        [self displayFlightDataInformation];
    }
    else if(CGRectContainsPoint(self.offersView.frame, location)){
        demoSingleton.selectedIndexForDisplay = 0;
        [self displayFlightDataInformation];
    }
    else if(CGRectContainsPoint(self.upcomingView.frame, location)){
        demoSingleton.selectedIndexForDisplay = 2;
        [self displayFlightDataInformation];
    }

}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

-(void)displayFlightDataInformation{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Test" bundle:nil];
    
    //UIViewController *sbvc = [sb instantiateViewControllerWithIdentifier:@"firstdata"];
    UIViewController *sbvc = [sb instantiateInitialViewController];
    sbvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [self presentViewController:sbvc animated:YES completion:nil];
}
@end
