//
//  ZXMainViewController.m
//  1217_UIControllers
//
//  Created by zx on 12/17/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXMainViewController.h"

@interface ZXMainViewController ()<UIAlertViewDelegate,UITextViewDelegate>

@end

@implementation ZXMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor ];
#if 0
    [self testSwitch];
    [self testUIActivityIndicatorView];
    [self testUISlider];
    [self testUIStepper];
    [self testUISegmentedControl];
   // [self testUIProcessView];
   // [self testUIAlerView];
#endif
    
#if 1
    [self testUITextView];
#endif
    
    [self testUIActionSheet];
    
}

-(void)testUIActionSheet{
    //动作列表:
    //作用,在弹出的选项中,进行选择,--->分享,转载,
    UIButton *shareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    shareButton.frame = CGRectMake(100,200,120,40);
    [shareButton setTitle:@"share" forState:UIControlStateNormal];
    
    [shareButton addTarget:self
                    action:@selector(shareButtonClicked:)
          forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:shareButton];
    

}
-(void)shareButtonClicked:(UIButton *)button{
    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:@"share"
                                                    delegate:nil
                                           cancelButtonTitle:@"cancle"
//                                      destructiveButtonTitle:@"error tips"
                                      destructiveButtonTitle:nil
                                           otherButtonTitles:@"sina",@"weixin",@"momo",nil];
    
   // [self.view addSubview:as];
    [as showInView:self.view];
}



#pragma mark ----------UITextView
-(void)testUITextView{
    //作用:输入多行文本
    UITextView *tv = [[UITextView alloc]init];
    
    tv.frame = CGRectMake(15,40,290, 170);//高度不能设置
    tv.backgroundColor = [UIColor grayColor];
    tv.tag = 104;
    
    //添加一个工具栏
    UIBarButtonItem *finish = [[UIBarButtonItem alloc]initWithTitle:@"done"
                                                              style:UIBarButtonItemStylePlain
                                                             target:self
                                                             action:@selector(clickedFinish:)];
    UIBarButtonItem *clean = [[UIBarButtonItem alloc]initWithTitle:@"clean"
                                                              style:UIBarButtonItemStylePlain
                                                             target:self
                                                             action:@selector(clickedClean:)];
    UIToolbar *toolBar = [[UIToolbar alloc]init];
    toolBar.frame = CGRectMake(0, 0, 320, 44);
    toolBar.items = @[finish,clean];
    
    tv.inputAccessoryView = toolBar;
    tv.delegate = self;//
    [self.view addSubview:tv];
    
   
}
-(void)clickedFinish:(UIBarButtonItem *)finish{
    UITextView *tv = (UITextView *)[self.view viewWithTag:104];
    [tv resignFirstResponder];
}
-(void)clickedClean:(UIBarButtonItem *)clean{
    UITextView *tv = (UITextView *)[self.view viewWithTag:104];
    tv.text = @"";
}

/**
 *  当文本框的文件改变的时候执行
 *
 *  @param textView 当前的输入框
 *  @param range    范围
 *  @param text     用什么文本替换
 *
 *  @return 返回YES->可以输入,返回NO-->不能输入
 */
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    return YES;
}

#pragma mark ----------UIAlerView
-(void)testUIAlerView{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"输入帐号密码:" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    //set style.
    alertView.alertViewStyle  = UIAlertViewStyleLoginAndPasswordInput ;
    [alertView show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    UITextField *account = [alertView textFieldAtIndex:0];
    UITextField *password = [alertView textFieldAtIndex:1];
    NSLog(@"%s [LINE:%d] \naccount = %@\npassword = %@", __func__, __LINE__,account.text,password.text);
}

#pragma mark ----------progress
-(void)testUIProcessView{
    // 作用:显示进度
    UIProgressView *pro = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleBar];
    pro.frame = CGRectMake(60,320,200, 0);//高度不能设置
    //pro.backgroundColor = [UIColor greenColor];//背景的颜色
    //pro.progressTintColor = [UIColor yellowColor];//覆盖了背景色
    pro.progress = 0.0;//当前progress的实际大小-->起始进度
    //如果起始进度<0.0或者>1.0,则值被固定到最大值.
    
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(addProgress:)
                                   userInfo:pro
                                    repeats:YES];
    
  //  [self performSelector:@selector(proSetProgress:) withObject:pro afterDelay:2];
    [self.view addSubview:pro];
}
-(void)proSetProgress:(UIProgressView *)pro{
    [pro setProgress:0.5 animated:YES];//-->起始进度,最终的进度(最小为1,最大不限);(根据最大进度进行均匀的延伸)
}
-(void)addProgress:(UIProgressView *)pro{
    [pro setProgress:(pro.progress+0.1) animated:YES];
}

#pragma mark ----------UISegmentedControl
-(void)testUISegmentedControl{
    //作用:在多个选项中选择:多选
    //bug1:有段时间不能选中
    //bug2:有段时间可以是多选
    
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"first",@"second",@"third",@"fourth"]];
    seg.tag = 102;
    seg.frame = CGRectMake(30,250,260,40);
    [seg setWidth:40 forSegmentAtIndex:2];// 设置某个宽度
    
    [seg setSelectedSegmentIndex:3];//设置选中哪个
    [seg setTitle:@"FIRST" forSegmentAtIndex:0];//替换标题
    [seg  setEnabled:NO forSegmentAtIndex:0];  //设置不可用
    
    [self.view addSubview:seg];
    
    [self performSelector:@selector(insertSegment) withObject:self afterDelay:2.0];
    [self performSelector:@selector(removeSegment) withObject:self afterDelay:4.0];
    
    [seg addTarget:self
             action:@selector(segClicked:)
   forControlEvents:UIControlEventValueChanged];
}
-(void)insertSegment{
    UISegmentedControl *seg = (UISegmentedControl *) [self.view viewWithTag:102];
    [seg insertSegmentWithTitle:@"fifth" atIndex:2 animated:YES];
}

-(void)removeSegment{
    UISegmentedControl *seg = (UISegmentedControl *) [self.view viewWithTag:102];
    [seg removeSegmentAtIndex:1 animated:YES];
}


-(void)segClicked:(UISegmentedControl *)seg{
    NSLog(@"%s [LINE:%d] seleted:%i", __func__, __LINE__,seg.selectedSegmentIndex);
}
#pragma mark ----------UIStepper
-(void)testUIStepper{
    //调整一个值的大小===>属性的值.
    UIStepper *step = [[UIStepper alloc]init];
    step.center = CGPointMake(160,220);
    step.value = 40;//表示的当前值
    step.minimumValue  = 20;//表示的最小值
    step.maximumValue  = 100;//表示的最大值
    step.stepValue = 2;//步进值
    [step addTarget:self
             action:@selector(stepperChanged:)
   forControlEvents:UIControlEventValueChanged];
    
    UILabel *label4stepper = [[UILabel alloc]init];
    label4stepper.frame = CGRectMake(60,200,40,40);
    label4stepper.tag = 101;
    label4stepper.text = @"null";
    [self.view addSubview:label4stepper];
    
    [self.view addSubview:step];
}

-(void)stepperChanged:(UIStepper *)stepper{
    NSLog(@"%s [LINE:%d],stepper.value = %.f", __func__, __LINE__,stepper.value);
    UILabel *label = (UILabel *)[self.view viewWithTag:101];
    label.text = [NSString stringWithFormat:@"%.f",stepper.value];
}


#pragma  mark ----------UISlider
-(void)testUISlider{
   //可以手动调节一个时间的进度===>音量,播放进度,屏幕亮度
    UISlider *slider = [[UISlider alloc]init];
    slider.frame = CGRectMake(60,150,200,40);
    slider.backgroundColor = [UIColor whiteColor];
    
    slider.minimumValue = 0;//最小值
    slider.maximumValue = 100;//最大值
    
    slider.tintColor = [UIColor redColor];//滑过的颜色的值
    slider.minimumTrackTintColor = [UIColor redColor];
    slider.maximumTrackTintColor = [UIColor greenColor];//右侧为大值,

    UIImage *image = [UIImage imageNamed:@"tab_0.png"];
    [slider setThumbImage:image forState:UIControlStateNormal]; //设置滑块的图片
    
    [slider setThumbTintColor:[UIColor yellowColor]];//设置滑块滑动的时候的颜色.
    
    [slider setValue:30];//设置滑块的位置
    
    [slider addTarget:self
               action:@selector(sliderChanged:)
     forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];
    
    UILabel *label4slider = [[UILabel alloc]init];
    label4slider.frame = CGRectMake(20,150,40,40);
    label4slider.tag = 100;
    label4slider.text = @"null";
    [self.view addSubview:label4slider];
}
-(void)sliderChanged:(UISlider *)slider{
    //NSLog(@"%s [LINE:%i] slider.value = %lu", __func__, __LINE__,slider.value);
    NSLog(@"%s [LINE:%d],slider.value = %.f", __func__, __LINE__,slider.value);
    UILabel *label = (UILabel *)[self.view viewWithTag:100];
    label.text = [NSString stringWithFormat:@"%.f",slider.value];
}

#pragma  mark ----------UIActivityIndicatorView
-(void)testUIActivityIndicatorView{
    
#if 0
    UIActivityIndicatorView *ac = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
#endif
   
#if 1
     UIActivityIndicatorView *ac = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
#endif
    
    ac.frame = CGRectMake(160, 100, 0, 0);
    [ac startAnimating];
    
    /**
     *  定时器参数介绍:
     *      持续的时候
     *      执行方法所在的对象
     *      执行的方法
     *      需要的额外的参数:传值:id类型
     *      是否重复执行
     */
    [NSTimer scheduledTimerWithTimeInterval:3.0
                                     target:self
                                   selector:@selector(endAnimating:)
                                   userInfo:ac
                                    repeats:NO];
    [self.view addSubview:ac];
}

-(void)endAnimating:(NSTimer *)timer{
    UIActivityIndicatorView *newAc = timer.userInfo;
    [newAc stopAnimating];
    //[timer  invalidate];//使定时器失效
}


#pragma  mark ----------UISwitch
-(void)testSwitch{
    //1.UISwitch
    //开关的大小是固定的.
    
    UISwitch *mySwitch = [[UISwitch alloc]init];
    //mySwitch.frame = CGRectMake(100,100,0,0);//开关的大小是固定的.
    mySwitch.center = CGPointMake(160,50);
    mySwitch.onTintColor = [UIColor redColor];//开状态的颜色
    mySwitch.tintColor = [UIColor greenColor];//关状态的颜色
    mySwitch.thumbTintColor = [UIColor yellowColor];//开关球的颜色
    
    [mySwitch addTarget:self action:@selector(switchClicked:) forControlEvents:UIControlEventValueChanged ];
    
    //UISwitch---> UIControll -->UIView
    //UILabel -->UIView
    [self.view addSubview:mySwitch];
}

-(void)switchClicked:(UISwitch *)s{
    NSLog(@"%s [LINE:%d] %i", __func__, __LINE__,s.on);
}


@end
