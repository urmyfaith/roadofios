//
//  ViewController.m
//  1213_passValue01
//
//  Created by zx on 12/13/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ViewController.h"
#import "ZXMainViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  三个界面
     *
     * 登录界面:    输入框用户名(输入框) 登录(按钮)
     * 主界面:     显示用户名(标签) 显示内容(标签)
     * 设置界面:   设置字体大小(输入框) 返回(按钮)
     */
    
    UITextField *userNameTextField = [[UITextField alloc]init];
    userNameTextField.tag = 100;
    userNameTextField.frame = CGRectMake(90, 150, 140, 40);
    userNameTextField.placeholder = @"username";
    userNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    userNameTextField.backgroundColor = [UIColor colorWithRed:200/255. green:200/255. blue:200/255. alpha:0.5 ];
    userNameTextField.delegate = self;
    [self.view addSubview:userNameTextField];
    
    UIButton *loginButton = [[UIButton alloc]init];
    loginButton.frame = CGRectMake(90, 220, 140, 40);
    loginButton.backgroundColor = [UIColor grayColor];
    [loginButton setTitle:@"login" forState:UIControlStateNormal];
    [loginButton.layer setMasksToBounds:YES];
    [loginButton.layer setCornerRadius:10];
    [loginButton addTarget:self action:@selector(intoMain) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    
    
    //添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapMethod:)];
    [self.view addGestureRecognizer:tap];
}

-(void)tapMethod:(UITapGestureRecognizer *)tap{
     UITextField *userNameTextField = (UITextField *) [self.view viewWithTag:100];
    [userNameTextField resignFirstResponder];
}

-(void)intoMain{
    ZXMainViewController *mainView = [[ZXMainViewController alloc]init];
    UITextField *userNameTextField = (UITextField *) [self.view viewWithTag:100];
    mainView.userName = userNameTextField.text;
   // mainView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [ self presentViewController:mainView animated:YES completion:nil];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return  YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
