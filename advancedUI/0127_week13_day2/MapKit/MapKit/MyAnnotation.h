//
//  MyAnnotation.h
//  MapKit
//
//  Created by zx on 1/27/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyAnnotation : NSObject<MKAnnotation>

@property(nonatomic,strong)NSString *myTitle;
@property(nonatomic,strong)NSString *mySubTitle;
@property(nonatomic,assign)CLLocationCoordinate2D myCoordinate;
@end
