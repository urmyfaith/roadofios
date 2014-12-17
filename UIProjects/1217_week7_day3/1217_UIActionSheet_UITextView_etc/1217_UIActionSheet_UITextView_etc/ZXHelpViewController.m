//
//  ZXHelpViewController.m
//  1217_UIActionSheet_UITextView_etc
//
//  Created by zx on 12/17/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXHelpViewController.h"
#import "ZXAllMethod.h"

@interface ZXHelpViewController ()

@end

@implementation ZXHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
/**
 *  如果登录了-->创建已经登录的视图
 *  未登录--->弹出窗口--->登录窗口视图--->(登录成功)---->创建已经登录的视图;
 *  @param animated x
 */
-(void)viewWillAppear:(BOOL)animated{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger isLogedIn = [defaults integerForKey:@"isLogedIn"];
    NSLog(@"%s [LINE:%d] isLogedIn=%i", __func__, __LINE__,isLogedIn);
    if ( 1 == isLogedIn) {
        [self creatHelpView];
        
    }else{
        UIButton *loginButton  = [UIButton buttonWithFrame:CGRectMake(100,100,120,40)
                                                 withTitle:@"登录"
                                                  withType:UIButtonTypeSystem
                                                withTarget:self
                                                withMethod:@selector(createLoginAlertView)];
        loginButton.tag = 300;
        [self.view addSubview:loginButton];
        [self createLoginAlertView];
    }
}

-(void)creatHelpView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    UILabel *label4Loged = [[UILabel alloc]init];
    label4Loged.frame = CGRectMake(30,240,260,40);
    label4Loged.text = @"现在看到的是登录后的帮助界面";
    [self.view addSubview:label4Loged];
}
-(void)createLoginAlertView{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"输入帐号密码:" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    alertView.alertViewStyle  = UIAlertViewStyleLoginAndPasswordInput ;
    [alertView show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 1) {
        UITextField *account = [alertView textFieldAtIndex:0];
        UITextField *password = [alertView textFieldAtIndex:1];
        if ([account.text isEqual:@"zx"] &&[password.text isEqual:@"zx"] ) {
            NSLog(@"%s [LINE:%d]", __func__, __LINE__);
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            [defaults setInteger:1 forKey:@"isLogedIn"];
            [self.view viewWithTag:300].hidden = YES;
            [self creatHelpView];
        }
    }
}
@end
