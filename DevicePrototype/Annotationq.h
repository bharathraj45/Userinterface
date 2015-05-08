//
//  Annotationq.h
//  DevicePrototype
//
//  Created by Bharath Raj Venkatesh on 29/04/15.
//  Copyright (c) 2015 Techolution mobi. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MapKit;

@interface Annotationq : NSObject<MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;


@end
