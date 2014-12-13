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
    //如果字典里的值与想要的值匹配,就重新设置背景色.
    if ([ dic[@"color"] isEqualToString:@"yellow"])
    {
        self.view.backgroundColor = [UIColor yellowColor];
    }
    
    //注意在使用完成通知后,立即将将观察者从通知中❤取消
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"%s [LINE:%d] 观察者从通知中心取消注册", __func__, __LINE__);
}


#pragma mark 注册观察者放在viewWillApper
-(void)viewWillAppear:(BOOL)animated{
    //一般将注册观察者的操作放在viewWillAppear方法之中.
    
    //观察者,
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    /*
     **注册观察者一定要在发布消息之前**
     注册观察者
     1. 谁是观察者?
     2. 观察者执行的方法
     3. 接受的通知的名称(名称一样要相同,否则接受不到通知.)
     4. 通知的发布者是谁?configView/这里的发布者为nil的时候,意思是接受任何对象发布这个名称的通知
     
     
     postNotificationName:(NSString *)aName object:(id)anObject userInfo:(NSDictionary *)aUserInfo;
     addObserver:(id)observer selector:(SEL)aSelector name:(NSString *)aName object:(id)anObject;
     
     anObject         anObject
     发布者发布消息    接受者注册
     self             obj           --> 正常接受
     self             nil           --> 正常接收(任何对象的同名通知)
     nil              nil           --> 正常接收
     nil              ojb           --> 接收不到消息.
     
     */
    [center addObserver:self
               selector:@selector(changeBackgroundColor:)
                   name:@"changeColor"
                 object:nil];
     NSLog(@"%s [LINE:%d] 观察者从通知中心注册", __func__, __LINE__);
}


-(void)backToLogin{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)intoConfig{

    ZXConfigViewController *configView = [[ZXConfigViewController alloc]init];
    NSLog(@"%s [LINE:%d] [%@", __func__, __LINE__,configView);
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
