//
//  SecondViewController.m
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 30/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import "SecondViewController.h"
#import "SWRevealViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController


@synthesize barButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.barButton.target = self.revealViewController;
    self.barButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
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

@end
