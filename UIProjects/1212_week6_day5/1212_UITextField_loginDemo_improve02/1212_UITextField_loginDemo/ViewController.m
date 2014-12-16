//
//  ViewController.m
//  1212_UITextField_loginDemo
//
//  Created by zx on 12/12/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ViewController.h"
#import "ZXMainViewController.h"
#import "ZXUIViewCreater.h"

#define BUTTON_BACKGROUND_IMAGE [[UIImage imageNamed:@"rr_pub_button_silver.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5]
typedef enum{
    ButtonTageWithLogin = 1,
    ButtonTageWIthRegiest
}ButtonTag;

@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic,strong) UITextField *userNameTextField;
@property (nonatomic,strong) UITextField *passTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //background
    UIImageView *backgroundVeiw = [UIImageView imageViewWithImage:@"back2.jpg"
                                                        withFrame:[[UIScreen mainScreen] bounds]];
    [self.view addSubview:backgroundVeiw];
    
    //icon
    UIImageView *iconView = [UIImageView imageViewWithImage:@"logo_title.png"
                                              withFrame:CGRectMake(100,
                                                                   30,
                                                                   [UIImage imageNamed:@"logo_title.png"].size.width,
                                                                   [UIImage imageNamed:@"logo_title.png"].size.height)];
    iconView.center = CGPointMake(160, 60);
    [self.view addSubview:iconView];
    
    //2.添加用户名的标签和输入框
    CGFloat leftGap  = 50;
    CGFloat topGap = 100;
    CGFloat midGap = 10;
    CGFloat smallGap = 20;
    
    UILabel *userNameLabel = [UILabel labelWithText:@"用户名"
                                          withFrame:CGRectMake(leftGap, topGap, 60,40)
                                           withFont:[UIFont systemFontOfSize:16]
                                  withTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:userNameLabel];
    
    self.userNameTextField = [UITextField textFiledWithFrame:CGRectMake(
                                                                        CGRectGetMaxX(userNameLabel.frame)+midGap,
                                                                        topGap,
                                                                        120,
                                                                        40)
                                             withBorderStyle:UITextBorderStyleNone
                                             withPlaceholder:@"请填写用户名"
                                         withBackgroundImage:BUTTON_BACKGROUND_IMAGE
                                         withClearButtonMode:UITextFieldViewModeAlways
                                                 withDelegate:self];
    
    UIView *leftView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    self.userNameTextField.leftView = leftView;
    self.userNameTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:self.userNameTextField];
    
    //3.添加密码的标签和输入框
    UILabel *passLabel = [UILabel labelWithText:@"密  码"
                                      withFrame:CGRectMake(leftGap,
                                                           CGRectGetMaxY(userNameLabel.frame) + smallGap,
                                                           60,
                                                           40)
                                        withFont:[UIFont systemFontOfSize:16]
                              withTextAlignment:NSTextAlignmentLeft];
    [self.view addSubview:passLabel];
    
    self.passTextField = [UITextField textFiledWithFrame:CGRectMake(
                                                                    CGRectGetMaxX(userNameLabel.frame)+midGap,
                                                                    CGRectGetMaxY(userNameLabel.frame) + smallGap,
                                                                    120,
                                                                    40)
                                         withBorderStyle:UITextBorderStyleNone
                                         withPlaceholder:@"请填写密码"
                                     withBackgroundImage:BUTTON_BACKGROUND_IMAGE
                                     withClearButtonMode:UITextFieldViewModeAlways
                                            withDelegate:self];
    self.passTextField.secureTextEntry = YES;
    self.passTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    
    UIButton  *returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.frame = CGRectMake(250, 0, 60, 40);
    [returnButton setTitle:@"确定⬇︎" forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(keyboardBack:) forControlEvents:UIControlEventTouchUpInside];
    [returnButton setBackgroundImage:BUTTON_BACKGROUND_IMAGE forState:UIControlStateNormal];
    
    UIImageView *imageView = [UIImageView imageViewWithImage:@"inputImage.png"
                                                   withFrame:CGRectMake(0, 0, 320, 40)];
    
    [imageView addSubview:returnButton ];
    imageView.userInteractionEnabled = YES;
    
    self.passTextField.inputAccessoryView = imageView;
    UIView *leftViewPass =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    self.passTextField.leftView = leftViewPass;
    self.passTextField.leftViewMode = UITextFieldViewModeAlways;
    
    

    [self.view addSubview:self.passTextField];
    
    //4.添加登录和注册按钮
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom
                                             withTag:ButtonTageWithLogin
                                           withFrame: CGRectMake(100 ,
                                                                 CGRectGetMaxY(self.passTextField.frame) + 100 ,
                                                                 100,
                                                                 40)
                                     withCenterPoint:CGPointMake(160,CGRectGetMaxY(self.passTextField.frame) +140 + 40/2)
                                           withTitle:@"登  录"
                                       andTitleState:UIControlStateNormal
                                           withTaret:self andSelector:@selector(clickedButton:) andControlEvents:UIControlEventTouchUpInside
                                 withBackgroundImage:BUTTON_BACKGROUND_IMAGE andBackgroundImageState:UIControlStateNormal];
    [self.view addSubview:loginButton];
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom
                                             withTag:ButtonTageWIthRegiest
                                           withFrame: CGRectMake(100 , CGRectGetMaxY(loginButton.frame) + 20 , 100, 40)
                                     withCenterPoint: CGPointMake(160,CGRectGetMaxY(loginButton.frame) + 20 + 40/2)
                                           withTitle:@"注  册"
                                       andTitleState:UIControlStateNormal
                                           withTaret:self andSelector:@selector(clickedButton:) andControlEvents:UIControlEventTouchUpInside
                                 withBackgroundImage:BUTTON_BACKGROUND_IMAGE andBackgroundImageState:UIControlStateNormal];
    [self.view addSubview:registerButton];
    
}

#pragma mark UITextFieldDelegateMethod
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.userNameTextField resignFirstResponder];
    return  YES;
}

-(void)clickedButton:(UIButton *)button{
    //预设的用户名和密码
    NSString *userNameString = @"zx@qq.com";
    NSString *passwordString = @"123456";
    if (button.tag == ButtonTageWithLogin) {
        //验证用户名和密码
        if ([self isValidateWithEmail:self.userNameTextField.text])
        {
            if (  [self.userNameTextField.text isEqualToString:userNameString] &&
                  [self.passTextField.text isEqualToString:passwordString] )
            {
                NSLog(@"%s [LINE:%d]登录成功", __func__, __LINE__);
                ZXMainViewController *main = [[ZXMainViewController alloc]init];
                [self presentViewController:main animated:YES completion:nil];
            }
            else{
                NSLog(@"%s [LINE:%d]登录失败", __func__, __LINE__);
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"tips"
                                                                   message:@"username or password error"
                                                                  delegate:nil
                                                         cancelButtonTitle:@"OK"
                                                         otherButtonTitles:nil];
                [alertView show];
            }
        }
        else
              NSLog(@"%s [LINE:%d]输入的不是邮箱", __func__, __LINE__);
    }
    else
        NSLog(@"%s [LINE:%d]注册", __func__, __LINE__);
}


#pragma mark 判断邮箱地址
/**
 *  匹配邮箱
 *
 *  @param email 传入的邮箱
 *
 *  @return 是否是有效的邮箱
 */

-(BOOL)isValidateWithEmail:(NSString *)email{
    //正则表达式的
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    //正则表达式放入语境
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [pre evaluateWithObject:email];
}

#pragma mark  输入框的监听器方法
//当输入框中的字符改变的时候调用
-(BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string
{
    if( [textField isEqual:self.userNameTextField ] )
	{
		//1.先获取改变前的字符串
		//注意:这个字符串应该是可变的字符串
	NSMutableString *mutString = [NSMutableString stringWithFormat:@"%@",self.userNameTextField.text];

	//将改变的字符串插入到源字符串中
	[mutString insertString:string atIndex:range.location];

	//判断,当新的字符串的长度大于10的时候,不让将此字符串添加进原字符串.
	//返回NO,添加失败,返回YES,添加成功.
	if ([mutString length] > 10 )
		return NO;
	else
		return YES;
	}
	return YES;
}

-(void)keyboardBack:(UIButton *)button{
    [self.passTextField resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
