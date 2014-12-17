//
//  ZXConfigViewController.m
//  1217_UIActionSheet_UITextView_etc
//
//  Created by zx on 12/17/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXConfigViewController.h"
#import "ZXAllMethod.h"

@interface ZXConfigViewController ()

@end

@implementation ZXConfigViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    
    //通过滑块设置背景颜色UISlide
    [self CreatUISlider];
    
    //通过步进器设置内容页面文本字体UIStepper
    [self createUIStepper];
    
    [self createLogoutButton];
}

#pragma mark -----创建注销按钮
-(void)createLogoutButton{
    UIButton *logoutButton  = [UIButton buttonWithFrame:CGRectMake(100,350,120,40)
                                                   withTitle:@"logout"
                                                    withType:UIButtonTypeSystem
                                                  withTarget:self
                                                  withMethod:@selector(logoutButtonClicked:)];
    logoutButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:logoutButton];
}

-(void)logoutButtonClicked:(UIButton *)button{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:0 forKey:@"isLogedIn"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"createLoginViewController" object:self];
    
}

#pragma mark -----步进器,修改字体大小,发出通知
-(void)createUIStepper{
    UILabel *label4FontSize = [[UILabel alloc]init];
    label4FontSize.frame = CGRectMake(40,250,200,40);
    label4FontSize.text = @"设置主界面的字体大小:";
    [self.view addSubview:label4FontSize];
    
    UILabel *label4Stepper = [[UILabel alloc]init];
    label4Stepper.frame = CGRectMake(40,300,60,40);
    label4Stepper.tag = 101;
    label4Stepper.text = @"12";
    [self.view addSubview:label4Stepper];
    
    
    UIStepper *stepper = [[UIStepper alloc]init];
    stepper.frame =CGRectMake(105,300,0,0);
    stepper.value = 12;
    stepper.minimumValue  = 8;
    stepper.maximumValue  = 40;
    stepper.stepValue = 2;
    [stepper addTarget:self
             action:@selector(stepperChanged:)
   forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:stepper];
}

-(void)stepperChanged:(UIStepper *)stepper{
    NSLog(@"%s [LINE:%d],stepper.value = %.f", __func__, __LINE__,stepper.value);
    UILabel *label = (UILabel *)[self.view viewWithTag:101];
    label.text = [NSString stringWithFormat:@"%.f",stepper.value];
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    NSNumber *fontSize = [[NSNumber alloc ]initWithInteger:stepper.value];
    [center postNotificationName:@"changeFontSize" object:self  userInfo:@{
                                                                           @"fontSize":fontSize,
                                                                           }];
     
}


# pragma mark ------滑块设置背景颜色UISlide
-(void)CreatUISlider{
    //可以手动调节一个时间的进度===>音量,播放进度,屏幕亮度
    UISlider *slider = [[UISlider alloc]init];
    slider.frame = CGRectMake(60,150,200,40);

    
    slider.minimumValue = 0.0;//最小值
    slider.maximumValue = 255.0;//最大值
    
    slider.tintColor = [UIColor redColor];//滑过的颜色的值
    slider.minimumTrackTintColor = [UIColor redColor];
    slider.maximumTrackTintColor = [UIColor greenColor];//右侧为大值,
    
    [slider setThumbTintColor:[UIColor yellowColor]];//设置滑块滑动的时候的颜色.
    
    [slider setValue:30];//设置滑块的位置
    
    [slider addTarget:self
               action:@selector(sliderChanged:)
     forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];
    
    UILabel *label4slider = [[UILabel alloc]init];
    label4slider.frame = CGRectMake(20,150,40,40);
    label4slider.tag = 200;
    label4slider.text = @"0";
    [self.view addSubview:label4slider];
}

-(void)sliderChanged:(UISlider *)slider{
    
    NSLog(@"%s [LINE:%d],slider.value = %.f", __func__, __LINE__,slider.value);
    UILabel *label = (UILabel *)[self.view viewWithTag:200];
    label.text = [NSString stringWithFormat:@"%.f",slider.value];
    UIColor *color = [UIColor colorWithRed:slider.value/255.0 green:slider.value/255.0 blue:slider.value/255.0 alpha:1];
    self.view.backgroundColor = color;
    slider.backgroundColor = color;
}

@end
