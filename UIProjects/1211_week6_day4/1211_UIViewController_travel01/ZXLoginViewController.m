//
//  ZXLoginViewController.m
//  1210_UIViewController_travel
//
//  Created by zx on 12/10/14.
//  Copyright (c) 2014 zx. All rights reserved.
//
#import "ZXMainViewController.h"
#import "ZXLoginViewController.h"
#import "ZXAllMethod.h"

@interface ZXLoginViewController ()<UITextFieldDelegate>

@end

@implementation ZXLoginViewController

/**
 *  login view:
            1. label :username
            2. button:login
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *userName = [UILabel labelWithFrame:CGRectMake(60,100,120,40)
                                       withText:@"用户名" withTag:100
                            withBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:userName];
    
    UITextField *userNameTextField = [[UITextField alloc]init];
    userNameTextField.frame = CGRectMake(120, 100, 120, 40);
    userNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    userNameTextField.placeholder = @"username";
    userNameTextField.delegate = self;
    userNameTextField.tag = 1000;
    userNameTextField.backgroundColor = [UIColor colorWithRed:250/255. green:200/255. blue:200/255. alpha:0.5];
    [self.view addSubview:userNameTextField];
    
    
    
    UIButton *nextView = [UIButton buttonWithFrame:CGRectMake(100, 250, 120, 40)
                                         withTitle:@"登录"
                                          withType:UIButtonTypeSystem
                                        withTarget:self
                                        withMethod:@selector(jumpIntoMain)];
    [self.view addSubview:nextView];
    
}

#pragma mark 输入框的代理方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return  YES;
}


#pragma mark 文本输入框的监听器方法

-(BOOL)textField:(UITextField *)textField
shouldChangeCharactersInRange:(NSRange)range
replacementString:(NSString *)string
{
    UITextField *tf = (UITextField *) [self.view viewWithTag:1000];
    
    if( [textField isEqual:tf ] )
    {
        //1.先获取改变前的字符串
        //注意:这个字符串应该是可变的字符串
        NSMutableString *mutString = [NSMutableString stringWithFormat:@"%@",tf.text];
        
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

-(void)jumpIntoMain{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:1 forKey:@"mySignal"];
    
    ZXMainViewController *mainView = [[ZXMainViewController alloc]init];
    mainView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    

    //    mainView.name = lable4name.text;
#if 0
    NSString *userName = lable4name.text;
    UILabel *lable4name = (UILabel *)[self.view viewWithTag:100];
#endif
    
#if 1
    UITextField *tf =  (UITextField *)[self.view viewWithTag:1000];
    NSString *userName = tf.text;
    NSLog(@"%s [LINE:%d] [userName=%@", __func__, __LINE__,userName);
#endif
    
    [defaults setObject:userName forKey:@"userName"];
    
     NSInteger  isFromMainView = [defaults integerForKey:@"isFromMainView"];
    if (isFromMainView == 1){
        NSLog(@"%s [LINE:%d] %@", __func__, __LINE__,@"出");
        //[self dismissViewControllerAnimated:YES completion:nil];
        [self presentViewController:mainView animated:YES completion:nil];
    }
    else
    {
        NSLog(@"%s [LINE:%d] %@", __func__, __LINE__,@"入");
        [self presentViewController:mainView animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
