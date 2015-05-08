//
//  OffersDataDetail.m
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 07/05/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import "OffersDataDetail.h"

@implementation OffersDataDetail

@synthesize strDescription;
@synthesize strDuration;
@synthesize strImageDescritpion;
@synthesize strImageSelectionStatus;
@synthesize strSubject;


-(id)initWithManufacturerData:(NSString *)theSubject
               andDescription:(NSString *)theDescription
                  andDuration:(NSString *)theDuration
          andImageDescription:(NSString *)theImageDescription
      andImageSelectionStatus:(NSString *)theImageSelectionStatus{
    
    self = [super init];
    if (self) {
        
        self.strDescription = theDescription;
        self.strSubject = theSubject;
        self.strDuration = theDuration;
        self.strImageDescritpion = theImageDescription;
        self.strImageSelectionStatus = theImageSelectionStatus;
    }
    
    return self;
}



@end
