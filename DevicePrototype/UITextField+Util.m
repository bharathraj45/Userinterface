//
//  UITextField+Util.m
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 12/05/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import "UITextField+Util.h"

@implementation UITextField (Util)


+(CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 100, 40 );
    
}

// text position
+ (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 40 , 40 );
}

@end
