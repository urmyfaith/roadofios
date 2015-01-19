//
//  ViewController.m
//  multi_thread_exercise
//
//  Created by zx on 1/19/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}


-(void)createUI{
    
    //--->320/4=80
    //--->40
    CGFloat W = 80.0f;
    CGFloat H = 40.0f;
    
    for (int i = 0 ; i < 4;  i++) {
        
        CGFloat xPos = 40 +  160*(i%2);
        CGFloat yPos = 100 + 160*(i/2);
        
        UILabel *label = [[UILabel alloc]init];
        label.frame = CGRectMake(xPos, yPos, W, H);
        label.text = [NSString stringWithFormat:@"thread%i",(i+1)];
        [self.view addSubview: label];

#pragma mark 分计数
        
        UILabel *label_number = [[UILabel alloc]init];
        label_number.frame = CGRectMake(CGRectGetMaxX(label.frame), yPos, W, H);
        label_number.tag = i + 100;
        label_number.text = @"0";
        [self.view addSubview:label_number];
        
#pragma mark 分开关
        UIButton *button_start  = [[UIButton alloc]init];
        button_start.tag = i + 200;
        button_start.frame = CGRectMake(xPos, CGRectGetMaxY(label.frame), W*2-50, H);
        [button_start setTitle:@"开始" forState:UIControlStateNormal];
        button_start.backgroundColor = [UIColor redColor];
        [button_start addTarget:self
                         action:@selector(buttonClicked:)
               forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button_start];
    }
    
    UILabel  *label_total = [[UILabel alloc]init];
    label_total.frame = CGRectMake(0, 0, 200, 40);
    label_total.center = CGPointMake(self.view.frame.size.width - 100-80,
                                     self.view.frame.size.height - 200);
    label_total.text = @"total:";
    [self.view addSubview:label_total];
   
#pragma mark 总计数
    UILabel *label_total_number = [[UILabel alloc]init];
    label_total_number.frame = CGRectMake(0, 0, 200+40, 40);
    label_total_number.center = CGPointMake(self.view.frame.size.width - 100,
                                            self.view.frame.size.height - 200);
    label_total_number.text = @"0";
    [self.view addSubview:label_total_number];
    
    
#pragma mark 全部停止
    UIButton *button_all_stop = [[UIButton alloc]init];
    button_all_stop.frame = CGRectMake((self.view.frame.size.width-300)/2,
                                       self.view.frame.size.height-60,
                                       300,
                                       40);
    [button_all_stop setTitle:@"全部停止" forState:UIControlStateNormal];
    button_all_stop.backgroundColor = [UIColor redColor];
    [button_all_stop  addTarget:self
                         action:@selector(all_stop:)
               forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_all_stop];
    
}

-(void)buttonClicked:(UIButton *)button{
    NSLog(@"%s [LINE:%d] button.tag = %i", __func__, __LINE__,button.tag);
}

-(void)all_stop:(UIButton *)button{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

@end
