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
@property (nonatomic, weak) IBOutlet UILabel *lblKualaLumpur;
@property (nonatomic, weak) IBOutlet UILabel *lblSydney;
@property (nonatomic, weak) IBOutlet UILabel *lblKualaLumpurSubtitle;
@property (nonatomic, weak) IBOutlet UILabel *lblSydneySubtitle;
@property (nonatomic, weak) IBOutlet UILabel *lblKualaLumpurSubsubtitle;
@property (nonatomic, weak) IBOutlet UILabel *lblSydneySubsubtitle;
@property (nonatomic, weak) IBOutlet UIView *viewKualaLumpur;
@property (nonatomic, weak) IBOutlet UIView *viewSyndey;

-(IBAction)btnLogoutclick:(UIBarButtonItem *)sender;

@end
