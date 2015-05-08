//
//  DemoSingleton.h
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 04/05/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoSingleton : NSObject

@property NSInteger selectedIndexForDisplay;

+(DemoSingleton *)sharedInstance;

@end
