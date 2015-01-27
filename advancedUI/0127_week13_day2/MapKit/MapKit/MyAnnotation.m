//
//  MyAnnotation.m
//  MapKit
//
//  Created by zx on 1/27/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "MyAnnotation.h"


@implementation MyAnnotation

-(NSString *)title{

    return _myTitle;
}

-(NSString *)subtitle{
    return _mySubTitle;
}

-(CLLocationCoordinate2D)coordinate{
    return  _myCoordinate;
}

@end
