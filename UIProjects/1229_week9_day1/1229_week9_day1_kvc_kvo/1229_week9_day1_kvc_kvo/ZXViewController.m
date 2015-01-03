//
//  ZXViewController.m
//  1229_week9_day1_kvc_kvo
//
//  Created by zx on 12/29/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXViewController.h"
#import "ZXCar.h"

@interface ZXViewController ()
@property (nonatomic,strong) ZXCar    *myCar;
@property (nonatomic,strong) UIProgressView    *pro;
@end

@implementation ZXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self testKVC];
    [self loadProgressView];

    
    [self testKVO];
    
}


-(void)testKVC{
    //--1
    ZXCar *car = [[ZXCar alloc]init];
    car.type = @"my car";
    NSLog(@"%s [LINE:%d]car=%@", __func__, __LINE__,car.type);
    
    //--2
    [car setValue:@"my car KVC" forKey:@"typee"];
    NSLog(@"%s [LINE:%d]car = %@", __func__, __LINE__,[car valueForKey:@"type"]);
    NSLog(@"%s [LINE:%d]car=%@", __func__, __LINE__,car.type);
    
    //---3
    [car setValue:[NSNumber numberWithInt:3] forKey:@"_speed"];
    NSLog(@"%s [LINE:%d] speed=%i", __func__, __LINE__,[[car valueForKey:@"_speed"] intValue]);
    
    
    //---4
    NSDictionary *dic = @{
                          @"type":@"bike"
                          };
    [car setValuesForKeysWithDictionary:dic];
    NSLog(@"%s [LINE:%d]car = %@", __func__, __LINE__,[car valueForKey:@"type"]);
    
    //----5.1
    car.engine.name = @"my engine";
    NSLog(@"%s [LINE:%d] name = %@", __func__, __LINE__,car.engine.name);
    
    //----5.2
    [car setValue:@"my engine kvc" forKeyPath:@"engine.name"];
    NSLog(@"%s [LINE:%d] %@", __func__, __LINE__,[car valueForKeyPath:@"engine.name"]);
    
    //---6 自己封装setValve forkey方法-理解KVC的原理.
    [car mySetValue:@"my new bike" forKey:@"type"];
    NSLog(@"%s [LINE:%d] type=%@", __func__, __LINE__,car.type);
}


-(void)loadProgressView{
    self.pro = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleBar];
    self.pro.frame = CGRectMake(60,320,200, 0);//高度不能设置
    self.pro.backgroundColor = [UIColor greenColor];//背景的颜色
    [self.view addSubview:self.pro];}

-(void)testKVO{
     self.myCar = [[ZXCar alloc]  init];
    [self.myCar addObserver:self forKeyPath:@"mySpeed" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    //NSLog(@"%s [LINE:%d]%@change", __func__, __LINE__,change);
    CGFloat newSpeed = [[object valueForKeyPath:keyPath] floatValue];
    //NSLog(@"%s [LINE:%d],newSpeed=%.2f", __func__, __LINE__,newSpeed);

    // self.pro.progress =[change[@"old"] floatValue];
    if (newSpeed >1) {
        NSLog(@"%s [LINE:%d] progress=%.2f", __func__, __LINE__,newSpeed);
        [self.pro setProgress:1.0 animated:YES];
    }
    else{
        [self.pro setProgress:newSpeed animated:YES];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.myCar removeObserver:self forKeyPath:@"mySpeed" context:nil];
}
@end
