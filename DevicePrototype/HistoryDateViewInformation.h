//
//  HistoryDateViewInformation.h
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 22/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistoryDateViewInformation : NSObject

@property (nonatomic, strong) NSString *strDate;
@property (nonatomic, strong) NSString *strFare;
@property (nonatomic, strong) NSString *strFromCity;
@property (nonatomic, strong) NSString *strToCity;

-(id)initWithManufacturer:(NSString *)theDate andFare:(NSString *)theFare andFromCity:(NSString *)theFromCity andToCity:(NSString *)theToCity;

@end
