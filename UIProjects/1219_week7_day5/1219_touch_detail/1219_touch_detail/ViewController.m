//
//  ViewController.m
//  1219_touch_detail
//
//  Created by zx on 12/19/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic,strong) UIImageView *imageView ;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.imageView  = [[UIImageView alloc]initWithFrame:CGRectMake(20, 40, 260, 350)];
    self.imageView.image = [UIImage imageNamed:@"bing.jpg"];
    [self.view addSubview:self.imageView];

    [self testTap];
    [self testLongPress];
    [self testSwip];//按住+一个方向长划
    [self testRotation];//alt+按住左键+旋转
    [self testPinch];
    [self testPan];//按住+移动
}

#pragma mark  ------pan 移动
-(void)testPan{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self
action:@selector(myPan:)];
    
    self.imageView.userInteractionEnabled = YES;
    self.imageView.multipleTouchEnabled = YES;
    [self.imageView addGestureRecognizer:pan];
}

-(void)myPan:(UIPanGestureRecognizer *)pan{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    CGPoint  point = [pan locationInView:self.view];
    self.imageView.center = point;
}

#pragma mark  ------pinch 缩放
-(void)testPinch{
    UIPinchGestureRecognizer *pinch =[[ UIPinchGestureRecognizer alloc]initWithTarget:self
                                                                                  action:@selector(myPinch:)];
    
    //----3.添加手势
    self.imageView.userInteractionEnabled = YES;
    self.imageView.multipleTouchEnabled = YES;
    [self.imageView addGestureRecognizer:pinch];
    
    pinch.delegate = self;
    
}
-(void)myPinch:(UIPinchGestureRecognizer *) pinch{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pinch.scale,pinch.scale);
    pinch.scale = 1;
}

#pragma mark ------旋转
-(void)testRotation{
    UIRotationGestureRecognizer *rotation = [[ UIRotationGestureRecognizer alloc]initWithTarget:self
action:@selector(myRotation:)];
    
    self.imageView.userInteractionEnabled = YES;
    self.imageView.multipleTouchEnabled = YES;
    [self.imageView addGestureRecognizer:rotation];
    
    rotation.delegate = self;
}

-(void)myRotation:(UIRotationGestureRecognizer *)rotation{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    
    //执行的一个动画.
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, rotation.rotation);
    rotation.rotation = 0;
}

#pragma mark ------手势的代理方法
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

#pragma mark 轻扫
-(void)testSwip{
    
    //-----1.创建手势
    UISwipeGestureRecognizer *swip =[ [UISwipeGestureRecognizer alloc]initWithTarget:self
action:@selector(mySwipMethod:)];
    
    //-----2.手势的属性
    swip.direction = UISwipeGestureRecognizerDirectionDown;
    //----3.添加手势
    self.imageView.userInteractionEnabled = YES;
    self.imageView.multipleTouchEnabled = YES;
    [self.imageView addGestureRecognizer:swip];
}

-(void)mySwipMethod:(UISwipeGestureRecognizer *)swip{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

#pragma mark ------长按
-(void)testLongPress{
    
    //-----1.创建手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self
                                                                                           action:@selector(myLongPress:)];
    //-----2.手势的属性
    //numberOfTapsRequired,numberOfTouchesRequired和
    longPress.minimumPressDuration = 1.0;//最小长按的时间
    longPress.allowableMovement = 10;//允许移动的范围(像素为单位)
    
    //----3.添加手势
    self.imageView.userInteractionEnabled = YES;
    self.imageView.multipleTouchEnabled = YES;
    [self.imageView addGestureRecognizer:longPress];
    
}

-(void)myLongPress:(UILongPressGestureRecognizer *)longPress{
    
    if (longPress.state  == UIGestureRecognizerStateEnded) {
        NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    }
    
}

#pragma mark ------单击手势

-(void)testTap{
    
    //----1.创建手势(实现手势方法)
    UITapGestureRecognizer  *tap =  [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(myTap:)];
    
    //----2.设置手势配置
    // Default is 1. The number of fingers required to match
    tap.numberOfTouchesRequired = 2;  //需要2根手指
    // Default is 1. The number of taps required to match
    tap.numberOfTapsRequired = 4;//需要点击的次数
    
    //----3.添加手势
    self.imageView.userInteractionEnabled = YES;
    self.imageView.multipleTouchEnabled = YES;
    [self.imageView addGestureRecognizer:tap];
}

-(void)myTap:(UITapGestureRecognizer *)tap{
    NSLog(@"%s [LINE:%d] a->%i", __func__, __LINE__,tap.numberOfTouchesRequired);
    NSLog(@"%s [LINE:%d] b->%i", __func__, __LINE__,tap.numberOfTapsRequired);
}


@end
