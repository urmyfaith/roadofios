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
@interface ZXLoginViewController ()<UIAlertViewDelegate>

@end

@implementation ZXLoginViewController

//初始化方法,在用nib/xib等的时候采用.


#pragma mark -------初始化方法
/**
 *  初始化方法,(重要)(基本完成所有的关于view的初始化工作)
 * [super viewDidLoad] -->必须写,而且需要放在最上面
 *  ***这个方法只在第一次进入控制器的时候调用***
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //设置当前view的背景色
    self.view.backgroundColor = [UIColor grayColor];
   
    //值传递,创建标签
    UILabel *userName = [[UILabel alloc]init];
    userName.frame = CGRectMake(100,20,120,40);
    userName.text = @"tom";
    userName.tag = 100;
    [self.view addSubview:userName];
    
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
    mainView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
  //  mainView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
  //  mainView.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    
    /**
     *  值传递-->通过对象的属性来完成.
     */
    UILabel *lable4name = (UILabel *)[self.view viewWithTag:100];
    mainView.name = lable4name.text;
    
    [ self presentViewController:mainView animated:YES completion:nil];
}


#pragma mark 生命周期相关
/**
 *  使用nib的时候才会用这个方法,一次初始化方法.
 *
 *  @param nibNameOrNil
 *  @param nibBundleOrNil
 *
 *  @return 
 */
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    
    return self;
}

/**
 *  构造方法,初始化方法,一次初始化.(使用代码创建对象)
 *  一般写的是一些非常少的初始化的东西,
 */
-(instancetype)init{
    self = [super init];
    if (self) {
        NSLog(@"init method");
    }
    return self;
}

/**
 *  加载视图:这个方法一般不手动调用
 */
-(void)loadView{
    [super loadView];//如果一定要使用这个方法来加载视图,一定需要先写这行代码.
    NSLog(@"****loadView method");
}

//每次进入视图控制器的时候都会调用一次,进入调用前2个,退出调用后2个方法.
/**
 *  视图将要出现的时候,调用此方法
 *
 *  @param animated <#animated description#>
 */
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];//最好的先调用父类的方法.
    NSLog(@"viewWillAppear method");

}

/**
 *  视图已经出现的的时候,调用此方法
 *
 *  @param animated
 */
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear method");
    UIAlertView *alert =[ [UIAlertView alloc]initWithTitle:@"tips" message:@"did appear" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"OK", nil];
    alert.tag = 100;
    [alert show];
}

/**
 *  视图将要消失的时候,调用此方法
 *
 *  @param animated
 */
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"viewWillDisappear method");
}

/**
 *  视图确实消失后,调用的方法
 *
 *  @param animated
 */
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear method");
}



/**
 *  卸载的时候调用
 *  但是这个方法已经被启用.
 */
-(void)viewDidUnload{
    NSLog(@"viewDidUnload method");

}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        NSLog(@"取消");
    }else{
        NSLog(@"确定");
    }
    /**
     *  使用alertView的tag值来区分各个不同的弹出框.
     */
    NSLog(@"%i",alertView.tag);
}

#pragma mark 内存管理警告

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
