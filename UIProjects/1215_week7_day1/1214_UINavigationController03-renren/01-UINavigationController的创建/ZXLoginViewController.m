//
//  ZXLoginViewController.m
//  01-UINavigationController的创建
//
//  Created by zx on 12/15/14.
//  Copyright (c) 2014 zhaokai. All rights reserved.
//

#import "ZXLoginViewController.h"
#import "ZXAllMethod.h"

@interface ZXLoginViewController ()<UITextFieldDelegate>
@property (nonatomic,strong) UITextField *userNameTextField;
@end

@implementation ZXLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    self.userNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(80,100,160,40)];
    self.userNameTextField.borderStyle = UITextBorderStyleNone;
    self.userNameTextField.placeholder = @"输入用户名";
    self.userNameTextField.backgroundColor = [UIColor whiteColor];
    self.userNameTextField.clearButtonMode = UITextFieldViewModeAlways;
    self.userNameTextField.delegate = self;
    self.userNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.userNameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.view addSubview:self.userNameTextField];
    
    
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"注销"
                                                                 style:UIBarButtonItemStylePlain target:self
                                                                action:@selector(doLogoutRequest)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UIButton *loginButton = [UIButton buttonWithFrame:CGRectMake(100, 170, 100, 40) withTitle:@"登录" withType:UIButtonTypeSystem withTarget:self withMethod:@selector(doLoginRequest)];
    loginButton.backgroundColor = [UIColor whiteColor];
    [loginButton.layer setMasksToBounds:YES];
    [loginButton.layer setCornerRadius:10];
    [self.view addSubview:loginButton];
    
}

#pragma mark UITextFieldDelegateMethod
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.userNameTextField resignFirstResponder];
    return  YES;
}

#pragma mark doLogin/LogoutRequest
-(void)doLoginRequest{
    NSLog(@"%s [LINE:%d]handle login request.", __func__, __LINE__);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //NSInteger  signal = [defaults integerForKey:@"mySignal"];
    if ([self.userNameTextField.text isEqual:@"zx"]) {
        NSLog(@"%s [LINE:%d]登录成功", __func__, __LINE__);
        [defaults setInteger:1 forKey:@"isLogedIn"];
        [self performSelector:@selector(jumpToMainView)
                   withObject:nil
                   afterDelay:1.0];
    }
    else{
        self.userNameTextField.text = @"";
        UIAlertView *alert =[ [UIAlertView alloc]initWithTitle:@"提示" message:@"登录失败" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

-(void)doLogoutRequest{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:0 forKey:@"isLogedIn"];
    [self performSelector:@selector(jumpToMainView)
               withObject:nil
               afterDelay:1.0];
}


 -(void)jumpToMainView{
     [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
