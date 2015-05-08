//
//  DemoSingleton.m
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 04/05/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import "DemoSingleton.h"

static DemoSingleton *sharedSingleton = nil;

@implementation DemoSingleton

@synthesize selectedIndexForDisplay;


+(DemoSingleton *)sharedInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSingleton = [[self alloc] init];
    });
    return sharedSingleton;
}
@end
