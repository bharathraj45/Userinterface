//
//  HistoryTableViewCell.m
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 22/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import "HistoryTableViewCell.h"

@implementation HistoryTableViewCell

@synthesize lblDate;
@synthesize lblFare;
@synthesize lblFromCity;
@synthesize lblToCity;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
