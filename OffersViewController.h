//
//  OffersViewController.h
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 21/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OffersViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *offersTableViewData;
@property (strong, nonatomic) NSMutableArray *allTableDataOffers;

-(IBAction)btnLogoutclick:(UIBarButtonItem *)sender;

@end
