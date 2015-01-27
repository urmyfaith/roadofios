//
//  MainViewController.m
//  ZXAppleMap
//
//  Created by zx on 1/27/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "MainViewController.h"
#import "MyAnnotation.h"
#import "BMKPinAnnotationView.h"
#import "BMKPolyLineView.h"



@interface MainViewController ()

@end

@implementation MainViewController
{
    BMKMapView *_mapView;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _mapView = [[BMKMapView alloc]init];
    _mapView.delegate = self;
    _mapView.frame = CGRectMake(0, 0, 320, 480);
    _mapView.mapType = BMKMapTypeStandard;
    _mapView.trafficEnabled = YES;
    
    //设置指南针位置
    _mapView.compassPosition = CGPointMake(0, 100);
    
    //设置显示区域
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(40.029997, 116.346653);
    BMKCoordinateSpan span;
    BMKCoordinateRegion region;
    span.latitudeDelta = 0.1;
    span.longitudeDelta = 0.1;
    region.center = coordinate;
    region.span = span;
    [_mapView setRegion:region];
    
    
    _mapView.overlookEnabled = YES;
    _mapView.overlooking = 45;
    
    //添加标注点.
    MyAnnotation *ma = [[MyAnnotation alloc]initWithTitle:@"hello" andSubTitle:@"world" andCoordinate:coordinate];
    [_mapView addAnnotation:ma];
    
    //绘制图形----画线
    CLLocationCoordinate2D coors[2] = {0};
    coors[0].latitude = 40.029997;
    coors[0].longitude = 116.346653;
    coors[1].latitude = 41.129997;
    coors[1].longitude = 117.446653;
    
    BMKPolyline *polyLine = [BMKPolyline polylineWithCoordinates:coors count:2];
    [_mapView addOverlay:polyLine];
    [self.view addSubview:_mapView];
    
    
}

-(BMKOverlayView *)mapView:(BMKMapView *)mapView viewForOverlay:(id<BMKOverlay>)overlay{
    if ([overlay isKindOfClass:[BMKPolyline class]]){
        
        
        BMKPolylineView *ov = [[BMKPolylineView alloc] initWithOverlay:overlay];
        
        ov.strokeColor = [UIColor purpleColor] ;
        ov.lineWidth = 5.0f;
        return ov;
    }
    return nil;
}

-(BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation{
    static NSString *identifier = @"a";
    BMKPinAnnotationView *av = (BMKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    
    if (!av) {
        av = [[BMKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier ];
        
    }
    av.enabled3D = YES;
    av.animatesDrop = YES;
    av.image = [UIImage imageNamed:@"eye"];
    return av;
}


@end
