//
//  ZXMainViewController.m
//  TCPClient
//
//  Created by zx on 1/20/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXMainViewController.h"

@interface ZXMainViewController ()

@end

@implementation ZXMainViewController
{
    UITextField *_textField;
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
    
    _textField = [[UITextField alloc]init];
    _textField.frame = CGRectMake(10, 100, 300, 30);
    _textField.borderStyle = UITextBorderStyleLine;
    [self.view addSubview:_textField];
    
    
    UIButton  *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(10, 150, 150, 40);
    btn1.backgroundColor  = [UIColor greenColor];
    [btn1 setTitle:@"连接服务器" forState:UIControlStateNormal];
    btn1.tag = 1;
    [btn1 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton  *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn2.frame = CGRectMake(10+150, 150, 150, 40);
    btn2.backgroundColor  = [UIColor yellowColor];
    [btn2 setTitle:@"发送数据" forState:UIControlStateNormal];
    btn2.tag = 2;
    [btn2 addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];

    
}

-(void)btnClicked:(UIButton *)button{
    NSLog(@"%s [LINE:%d] button.tag=%i", __func__, __LINE__,button.tag);
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_textField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
