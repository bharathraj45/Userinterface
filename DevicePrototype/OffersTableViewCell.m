//
//  OffersTableViewCell.m
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 07/05/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import "OffersTableViewCell.h"

@implementation OffersTableViewCell

@synthesize lblDescription;
@synthesize lblDuration;
@synthesize lblSubject;
@synthesize imgDescription;
@synthesize imgSelectionStatusData;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
