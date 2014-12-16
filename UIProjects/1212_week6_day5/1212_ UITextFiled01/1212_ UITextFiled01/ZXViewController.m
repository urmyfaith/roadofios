//
//  ZXViewController.m
//  1212_ UITextFiled01
//
//  Created by zx on 12/12/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ZXViewController.h"

@interface ZXViewController ()<UITextFieldDelegate>

@end

@implementation ZXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    //UITextFiled
    
    
    //--Create
    UITextField *textFiled = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 160, 40)];
    
    textFiled.center = CGPointMake(160,120);
    textFiled.borderStyle = UITextBorderStyleRoundedRect;
    textFiled.backgroundColor = [UIColor whiteColor];
    
    //--hidden keyboard
    /**
     *  inputFiled: 知道输入的内容什么时候输完,不知道键盘什么时候弹回.
     *  当前界面:知道键盘什么时候弹回,不知道内容什么时候输完.
     * 目标-->输入完成后,弹回键盘
     *  通过代理:1.将在输入框的类里面写协议,协议里面有控制键盘回收的方法等.
                2.让当前类引用协议
                3.将当前类设置成输入框的代理类
                4.在当前类里写协议的相关方法的具体实现.
     */
    textFiled.delegate = self;
    
    [self.view addSubview:textFiled];
    
}

/**
 *  回收键盘
 *
    第一项响应项:当前正在响应的对象(正在与用户进行交互的对象)
 键盘回收的方法:取消第一响应项
 
 *  @param textField 主动类
 *
 *  @return 返回值
 */
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
//    [textField becomeFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
