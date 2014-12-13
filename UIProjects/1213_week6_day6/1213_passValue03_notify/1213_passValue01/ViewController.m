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

    
    UITextField *userNameTextField = [[UITextField alloc]init];
    userNameTextField.tag = 100;
    userNameTextField.frame = CGRectMake(90, 80, 140, 40);
    userNameTextField.placeholder = @"username";
    userNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    userNameTextField.backgroundColor = [UIColor colorWithRed:200/255. green:200/255. blue:200/255. alpha:0.5 ];
    userNameTextField.delegate = self;
    [self.view addSubview:userNameTextField];
    
    UIButton *loginButton = [[UIButton alloc]init];
    loginButton.tag = 111;
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
    
    //从消息通知中心接受消息
    //将本类注册成观察者,解决两个通知
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(hidden)
                                                name:@"UIKeyboardWillHideNotification"
                                              object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(show)
                                                name:@"UIKeyboardWillShowNotification"
                                              object:nil];
}

//键盘弹出
-(void)show{
    UIButton *loginButton = (UIButton *)[self.view viewWithTag:111];
    [UIView beginAnimations:nil context:nil];//添加动画
    [UIView setAnimationDuration:0.3];//动画持续时间
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];//动画类型
    loginButton.frame = CGRectMake(90, 140, 140, 40);
    [UIView commitAnimations];//提交动画,开始执行.
}

//键盘回收
-(void)hidden{
    UIButton *loginButton = (UIButton *)[self.view viewWithTag:111];
    loginButton.frame = CGRectMake(90, 220, 140, 40);
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



#pragma mark  得到通知消息,取消注册
/**
 *  改变颜色
 *
 *  @param center 注意:**这里的参数是通知,不是通知中心**
 */
-(void)changeBackgroundColor:(NSNotification *)notification{
    NSString *name = notification.name;
    id obj = notification.object;
    NSDictionary *dic = notification.userInfo;
    NSLog(@"%s [LINE:%d] \n通知名称:%@ \n通知发布者:%@ \n通知的具体内容%@", __func__, __LINE__,name,obj,dic);
    
    if ([name isEqualToString:@"changeColor"])
    {
        //如果字典里的值与想要的值匹配,就重新设置背景色.
        if ([ dic[@"color"] isEqualToString:@"yellow"])
        {
            self.view.backgroundColor = [UIColor yellowColor];
        }
    }
    else if ([name isEqualToString:@"changeFontColor"])
    {
        NSLog(@"%s [LINE:%d] [dic=%@]", __func__, __LINE__,dic);
    }
    //注意在使用完成通知后,立即将将观察者从通知中❤取消
    //[[NSNotificationCenter defaultCenter] removeObserver:self];
     NSLog(@"%s [LINE:%d] 观察者从通知中心取消注册", __func__, __LINE__);
}


#pragma mark 注册观察者放在viewWillApper
-(void)viewWillAppear:(BOOL)animated{
    //一般将注册观察者的操作放在viewWillAppear方法之中.
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];

    
    //当name和object都为nil的时候,这个观察者会接受系统中的所有通知,
    //所在注册的观察者的时候,最好指定name或者object或者都指定.
    [center addObserver:self
               selector:@selector(changeBackgroundColor:)
                  // name:@"changeColor"
                   name:@"changeColor"
                 object:nil];
    [center addObserver:self
               selector:@selector(changeBackgroundColor:)
     // name:@"changeColor"
                   name:@"changeFontColor"
                 object:nil];
    NSLog(@"%s [LINE:%d] 观察者从通知中心注册", __func__, __LINE__);
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
