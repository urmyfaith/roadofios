//
//  MainViewController.m
//  MapKit
//
//  Created by zx on 1/27/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "MainViewController.h"

#import "MyAnnotation.h"


@interface MainViewController ()



@end

@implementation MainViewController
{
    CLLocationManager *_locationManager;
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 定位坐标点用的
    CLLocationCoordinate2D  coordinate = CLLocationCoordinate2DMake(40.037120,116.370580);
    
    //设置精细度
    
    //2.显示地图位置
    MKMapView *mapView = [[MKMapView alloc]init];
    mapView.delegate = self;
    mapView.tag = 1001;
    
    mapView.frame = CGRectMake(0, 0, 320, 480);
    [self.view addSubview:mapView];
    
    //3.设置地图类型
   // mapView.mapType = MKMapTypeSatellite;
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.01, 0.01);
    MKCoordinateRegion regin = MKCoordinateRegionMake(coordinate, span);
    
    mapView.showsUserLocation = YES;
    [mapView setRegion:regin];
    
    
    //标注点
    MyAnnotation *ma = [[MyAnnotation alloc]init];
    
    ma.myTitle = @"mianTitle";
    ma.mySubTitle = @"subtitle";
    ma.myCoordinate = coordinate;
    [mapView addAnnotation:ma];
    
    //长按手势
    UILongPressGestureRecognizer *lp = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
    [mapView addGestureRecognizer:lp];
    
    //判断定位服务不可用
    if ([CLLocationManager locationServicesEnabled]) {
        //定位频率,定位的精度,开始更新位置.
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        [_locationManager startUpdatingLocation];
        
    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    for (CLLocation *location in locations) {
        CLGeocoder *geocoder = [[CLGeocoder alloc]init];
        
        [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
            NSString *str = [placemarks componentsJoinedByString:@","];
            NSLog(@"address: %@",str);
        }];
    }
    [_locationManager stopUpdatingLocation];
}

/**
 *  标注点复用(mapViewDelegate协议方法)
 *
 *  @param mapView    地图视图
 *  @param annotation 标注点
 *
 *  @return 标注点视图
 */
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{

    static NSString *identifier = @"annotation";
    MKPinAnnotationView *av = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
    if (!av) {
        av = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifier];
    }
    //修改标注点的view
    
    //开启动画
    av.animatesDrop = YES;
    
    //显示标题
    av.canShowCallout = YES;
    
    //显示左侧视图,右侧视图
    UIView *leftView = [[UIView alloc]init];
    leftView.frame = CGRectMake(0, 0, 20, 20);
    leftView.backgroundColor = [UIColor redColor];
    av.leftCalloutAccessoryView = leftView;
    
    UIView *rightView = [[UIView alloc]init];
    rightView.frame = CGRectMake(0, 0, 20, 20);
    rightView.backgroundColor = [UIColor blackColor];
    av.rightCalloutAccessoryView = rightView;
    
    //大头针颜色
    av.pinColor = MKPinAnnotationColorPurple;//只有三种颜色
    
    return av;
}


-(void)longPress:(UILongPressGestureRecognizer *)lp{
    
    if (lp.state == UIGestureRecognizerStateBegan) {//防止重复加入

        MKMapView *mv = (MKMapView *)[self.view viewWithTag:1001];
        
        //得到手势点击的坐标
        CGPoint point = [lp locationInView:mv];
        
        
        //将坐标转换为经纬度
        CLLocationCoordinate2D coordinate = [mv convertPoint:point toCoordinateFromView:mv];
        
        //实例化标记点
        MyAnnotation *ma = [[MyAnnotation alloc]init];
        ma.myTitle = @"Title";
        ma.mySubTitle   = @"subTitle";
        ma.myCoordinate = coordinate;
        [mv addAnnotation:ma];
    }

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
