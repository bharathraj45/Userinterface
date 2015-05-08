//
//  HistoryTableViewCell.h
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 22/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *lblDate;
@property (nonatomic, weak) IBOutlet UILabel *lblFare;
@property (nonatomic, weak) IBOutlet UILabel *lblFromCity;
@property (nonatomic, weak) IBOutlet UILabel *lblToCity;


@end
