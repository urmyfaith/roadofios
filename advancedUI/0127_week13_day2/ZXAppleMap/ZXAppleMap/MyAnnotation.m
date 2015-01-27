//
//  MyAnnotation.m
//  ZXAppleMap
//
//  Created by zx on 1/27/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation
{
    NSString *_mt;
    NSString *_mst;
    CLLocationCoordinate2D _coor;
    
}
-(id)initWithTitle:(NSString *)myTitle
         andSubTitle:(NSString *)mySubTitle
       andCoordinate:(CLLocationCoordinate2D )myCoordinate{
    
    self =  [ super init];
    if (self) {
        _mt = myTitle;
        _mst  = mySubTitle;
        _coor = myCoordinate;
    }
    return self;
}

-(NSString *)title{
    return _mt;
}

-(NSString *)subtitle{
    return _mst;
}

-(CLLocationCoordinate2D)coordinate{
    return _coor;
}

@end
