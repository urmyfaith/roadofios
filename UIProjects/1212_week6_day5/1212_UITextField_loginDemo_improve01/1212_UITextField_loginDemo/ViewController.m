//
//  ViewController.m
//  1212_UITextField_loginDemo
//
//  Created by zx on 12/12/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ViewController.h"
#import "ZXMainViewController.h"

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
    //1.设置背景
    UIImageView *backgroundVeiw = [[UIImageView alloc]
                                   initWithImage:([UIImage imageNamed:@"back2.jpg"])];
    backgroundVeiw.frame = [[UIScreen mainScreen] bounds];
    [self.view addSubview:backgroundVeiw];
    
    UIImage *icon = [UIImage imageNamed:@"logo_title.png"];
    UIImageView *iconView = [[UIImageView alloc]
                             initWithFrame:CGRectMake(100,30,icon.size.width,icon.size.height)];
    iconView.image = icon;
    iconView.center =  CGPointMake(160, 60);
    [self.view addSubview:iconView];
    
    //2.添加用户名的标签和输入框
    CGFloat leftGap  = 50;
    CGFloat topGap = 100;
    CGFloat midGap = 10;
    CGFloat smallGap = 20;
    UILabel *userNameLabel = [[UILabel alloc]initWithFrame:
                              CGRectMake(leftGap, topGap, 60,40)];
    userNameLabel.text = @"用户名:";
    userNameLabel.font = [UIFont systemFontOfSize:16];
    userNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:userNameLabel];
    
    self.userNameTextField = [[UITextField alloc]initWithFrame:
                                      CGRectMake(CGRectGetMaxX(userNameLabel.frame)+midGap, topGap,
                                                 120, 40)];
    self.userNameTextField.borderStyle = UITextBorderStyleNone;
//    UIImage *userNameBackgroundImage = [[UIImage imageNamed:@"rr_pub_button_silver.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
    UIImage *userNameBackgroundImage = BUTTON_BACKGROUND_IMAGE;
    self.userNameTextField.background = userNameBackgroundImage;
    self.userNameTextField.placeholder = @"请填写用户名";
    self.userNameTextField.clearButtonMode = UITextFieldViewModeAlways;
    
    UIView *leftView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    self.userNameTextField.leftView = leftView;
    self.userNameTextField.leftViewMode = UITextFieldViewModeAlways;
    
    self.userNameTextField.delegate = self;
    [self.view addSubview:self.userNameTextField];
    
    //3.添加密码的标签和输入框
    UILabel *passLabel = [[UILabel alloc]initWithFrame:
                              CGRectMake(leftGap,
                                         CGRectGetMaxY(userNameLabel.frame) + smallGap,
                                         60,
                                         40)];
    passLabel.text = @"密  码:";
    passLabel.font = [UIFont systemFontOfSize:16];
    passLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:passLabel];
    
    self.passTextField = [[UITextField alloc]initWithFrame:
                                      CGRectMake(CGRectGetMaxX(userNameLabel.frame)+midGap, CGRectGetMaxY(userNameLabel.frame) + smallGap,
                                                 120,
                                                 40)];
    self.passTextField.borderStyle = UITextBorderStyleNone;
//    UIImage *passBackgroundImage = [[UIImage imageNamed:@"rr_pub_button_silver.png"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
     UIImage *passBackgroundImage = BUTTON_BACKGROUND_IMAGE;
    self.passTextField.background = passBackgroundImage;
    self.passTextField.placeholder = @"请填写密码";
    self.passTextField.clearButtonMode = UITextFieldViewModeAlways;
    
    self.passTextField.secureTextEntry = YES;
    self.passTextField.keyboardType = UIKeyboardTypeNumberPad;
    
//    UIView *returnView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    UIButton  *returnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    returnButton.frame = CGRectMake(250, 0, 60, 40);
    [returnButton setTitle:@"确定⬇︎" forState:UIControlStateNormal];
    [returnButton addTarget:self action:@selector(keyboardBack:) forControlEvents:UIControlEventTouchUpInside];
    [returnButton setBackgroundImage:BUTTON_BACKGROUND_IMAGE forState:UIControlStateNormal];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    imageView.image = [UIImage imageNamed:@"inputImage.png"];
    [imageView addSubview:returnButton ];
    imageView.userInteractionEnabled = YES;
    
    self.passTextField.inputAccessoryView = imageView;
    
    UIView *leftViewPass =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
    self.passTextField.leftView = leftViewPass;
    self.passTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    self.passTextField.delegate = self;
    [self.view addSubview:self.passTextField];
    
    //4.添加登录和注册按钮
    UIButton  *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(100 ,
                                   CGRectGetMaxY(self.passTextField.frame) + 100 ,
                                   100,
                                   40);
    loginButton.tag = ButtonTageWithLogin;
    [loginButton setTitle:@"登  录" forState:UIControlStateNormal];
    loginButton.center = CGPointMake(160,CGRectGetMaxY(self.passTextField.frame) +140 + 40/2);
    [loginButton addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
    [loginButton setBackgroundImage:BUTTON_BACKGROUND_IMAGE forState:UIControlStateNormal];
   
    [self.view addSubview:loginButton];
    
    UIButton  *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    registerButton.frame = CGRectMake(100 , CGRectGetMaxY(loginButton.frame) + 20 , 100, 40);
    registerButton.center = CGPointMake(160,CGRectGetMaxY(loginButton.frame) + 20 + 40/2);
    
    registerButton.tag = ButtonTageWIthRegiest;
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton addTarget:self
                       action:@selector(clickedButton:)
             forControlEvents:UIControlEventTouchUpInside];
    [registerButton setBackgroundImage:BUTTON_BACKGROUND_IMAGE forState:UIControlStateNormal];
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
        {
              NSLog(@"%s [LINE:%d]输入的不是邮箱", __func__, __LINE__);
        }
    }
    else
    {
        NSLog(@"%s [LINE:%d]注册", __func__, __LINE__);
    }
}

/**
 *  匹配邮箱
 *
 *  @param email 传入的邮箱
 *
 *  @return 是否是有效的邮箱
 */

-(BOOL)isValidateWithEmail:(NSString *)email{
    //正则表达式
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    //正则表达式放入语境
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [pre evaluateWithObject:email];
}

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
