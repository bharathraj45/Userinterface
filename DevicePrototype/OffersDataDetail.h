//
//  OffersDataDetail.h
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 07/05/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OffersDataDetail : NSObject

@property (strong, nonatomic) NSString *strSubject;
@property (strong, nonatomic) NSString *strDescription;
@property (strong, nonatomic) NSString *strDuration;
@property (strong, nonatomic) NSString *strImageDescritpion;
@property (strong, nonatomic) NSString *strImageSelectionStatus;

-(id)initWithManufacturerData:(NSString *)theSubject andDescription:(NSString *)theDescription andDuration:(NSString *)theDuration andImageDescription:(NSString *)theImageDescription andImageSelectionStatus:(NSString *)theImageSelectionStatus;


@end
