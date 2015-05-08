//
//  OffersTableViewCell.h
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 07/05/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OffersTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblSubject;
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblDuration;
@property (weak, nonatomic) IBOutlet UIImageView *imgDescription;
@property (weak, nonatomic) IBOutlet UIImageView *imgSelectionStatusData;

@end
