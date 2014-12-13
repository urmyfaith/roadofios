//
//  ZXMainViewController.m
//  1213_passValue01
//
//  Created by zx on 12/13/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ZXMainViewController.h"
#import "ZXConfigViewController.h"

@interface ZXMainViewController ()<ZXConfigViewDelegate>

@end

@implementation ZXMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
#if 0
    //视图层次-->通过子视图设置背景图片,一定要在最前设置.
    UIView *view = [[UIView alloc] init];
    view.frame = [[UIScreen mainScreen] bounds];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
#endif
    
    
    //userInfo
    UILabel *userInfo = [[UILabel alloc]init];
    if ([self.userName isEqual: @""]) {
        self.userName = @"hacker007";
    }
    userInfo.text =  self.userName;
    userInfo.frame = CGRectMake(100,50,120,40);
    userInfo.textAlignment = NSTextAlignmentCenter;
    userInfo.backgroundColor = [UIColor colorWithRed:200/255. green:200/255. blue:200/255. alpha:0.5];
    [self.view addSubview:userInfo];
    
    
    //content:
    UILabel *contentLable = [[UILabel alloc]init];
    contentLable.tag = 200;
    contentLable.frame = CGRectMake(10,120,300,0);
    contentLable.numberOfLines = 0;
    contentLable.text = @"\t[新华网北京12月12日 电] 南水北调中线一期工程12日正式通水。中共中央总书记、国家主席、中央军委主席习近平作出重要指示，强调南水北调工程是实现我国水资源优化配置、促进经济社会可持续发展、保障和改善民生的重大战略性基础设施。经过几十万建设大军的艰苦奋斗，南水北调工程实现了中线一期工程正式通水，标志着东、中线一期工程建设目标全面实现。这是我国改革开放和社会主义现代化建设的一件大事，成果来之不易。";
    [contentLable sizeToFit];
    [self.view addSubview:contentLable];
    
    //backButton
    UIButton *backToLoginButton = [[UIButton alloc]init];
    backToLoginButton.frame = CGRectMake(30, 400, 100, 40);
    backToLoginButton.backgroundColor = [UIColor grayColor];
    [backToLoginButton setTitle:@"back" forState:UIControlStateNormal];
    [backToLoginButton.layer setMasksToBounds:YES];
    [backToLoginButton.layer setCornerRadius:10];
    [backToLoginButton addTarget:self action:@selector(backToLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backToLoginButton];
    
    //configButton
    UIButton *configButton = [[UIButton alloc]init];
    configButton.frame = CGRectMake(190, 400, 100, 40);
    configButton.backgroundColor = [UIColor grayColor];
    [configButton setTitle:@"config" forState:UIControlStateNormal];
    [configButton.layer setMasksToBounds:YES];
    [configButton.layer setCornerRadius:10];
    [configButton addTarget:self action:@selector(intoConfig) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:configButton];
    

}

-(void)backToLogin{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)intoConfig{

    ZXConfigViewController *configView = [[ZXConfigViewController alloc]init];
    
    configView.delegate = self;//主动类的代理设置成本类(重要)
    
    configView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [ self presentViewController:configView animated:YES completion:nil];
}

-(void)changeFontSizeWithField:(UITextField *)textField{
    UILabel *label = (UILabel *)[self.view viewWithTag:200];
    label.font = [UIFont systemFontOfSize:[textField.text intValue]];
    //当label的文字大小属性改变的时候,需要重新设置自适应.
    [label sizeToFit];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
