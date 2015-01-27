//
//  MyAnnotation.h
//  ZXAppleMap
//
//  Created by zx on 1/27/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMKAnnotation.h"

@interface MyAnnotation : NSObject<BMKAnnotation>


-(id)initWithTitle:(NSString *)myTitle
       andSubTitle:(NSString *)mySubTitle
     andCoordinate:(CLLocationCoordinate2D )myCoordinate;

@end
