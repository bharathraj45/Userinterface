//
//  HistoryDateViewInformation.m
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 22/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import "HistoryDateViewInformation.h"

@implementation HistoryDateViewInformation

@synthesize strDate;
@synthesize strFare;
@synthesize strFromCity;
@synthesize strToCity;

-(id)initWithManufacturer:(NSString *)theDate andFare:(NSString *)theFare andFromCity:(NSString *)theFromCity andToCity:(NSString *)theToCity;
{
    self = [super init];
    
    if (self) {
        
        self.strDate = ([theDate isKindOfClass:[NSNull class]]) ? @"": theDate;
        self.strFare = theFare;
        self.strFromCity = theFromCity;
        self.strToCity = theToCity;
        
    }
    return self;
}

@end
