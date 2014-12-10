//
//  ZXLoginViewController.m
//  1210_ UIViewController
//
//  Created by zx on 12/10/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ZXLoginViewController.h"
#import "ZXMainViewController.h"

/**
 *   匿名分类:私有的变量和方法
 */
@interface ZXLoginViewController ()

@end

@implementation ZXLoginViewController

//初始化方法,在用nib/xib等的时候采用.


#pragma mark -------初始化方法
/**
 *  初始化方法,(重要)(基本完成所有的关于view的初始化工作)
 * [super viewDidLoad] -->必须写,而且需要放在最上面
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置当前view的背景色
    self.view.backgroundColor = [UIColor grayColor];
    
    //创建标签
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100,100,120,40)];
    label.text = @"login view";
    label.backgroundColor = [UIColor yellowColor];
    //显示
    /**
     *  原来通过添加到self.winowd来显示
     *  现在通过添加到self.view来显示.
     */
    [self.view addSubview:label];

    
    //创建按钮:跳转到系一个界面
    UIButton *nextView = [UIButton buttonWithType:UIButtonTypeSystem];
    nextView.frame = CGRectMake(100, 150, 120, 40);
    nextView.backgroundColor = [UIColor whiteColor];
    [nextView.layer setMasksToBounds:YES];
    [nextView.layer setCornerRadius:10];
    [nextView setTitle:@"next" forState:UIControlStateNormal  ];
    [self.view addSubview:nextView];
    
    
    //执行跳转方法
    [nextView addTarget:self
                 action:@selector(jumpIntoMain)
       forControlEvents:UIControlEventTouchUpInside];
    
    NSLog(@"load loginView complete.");
    // Do any additional setup after loading the view.
}

-(void)jumpIntoMain{
    NSLog(@"do jump into main");
    
    //执行跳转(模态跳转)
    /**
      这里是一个栈结构,依次进入,先进后出,看到的是栈顶元素(最后加入的视图控制器)
      可以设置跳转动画.
     */
    ZXMainViewController *mainView = [[ZXMainViewController alloc]init];
  //  mainView.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
  //    mainView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
  //  mainView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    mainView.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [ self presentViewController:mainView animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
