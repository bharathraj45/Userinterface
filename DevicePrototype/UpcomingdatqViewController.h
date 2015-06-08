//
//  UpcomingdatqViewController.h
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 29/05/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpcomingdatqViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *offersTableViewData;
@property (strong, nonatomic) NSMutableArray *allTableDataOffers;
@property (weak, nonatomic) IBOutlet UIImageView *imageData;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationData;






-(IBAction)btnBacktapevent:(id)sender;

@end
