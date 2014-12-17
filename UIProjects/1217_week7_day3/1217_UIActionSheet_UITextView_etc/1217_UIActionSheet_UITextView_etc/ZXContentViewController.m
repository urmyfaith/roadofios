//
//  ZXContentViewController.m
//  1217_UIActionSheet_UITextView_etc
//
//  Created by zx on 12/17/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXContentViewController.h"

@interface ZXContentViewController ()<UITextViewDelegate,UIActionSheetDelegate>

@end

@implementation ZXContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    [self createTextView];
    
    
}

# pragma mark ------注册观察者:改变字体
-(void)viewWillAppear:(BOOL)animated{
     NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(changeTextViewFontSize:) name:@"changeFontSize" object:nil];
}

-(void)changeTextViewFontSize:(NSNotification *)notification{

    NSDictionary *dic = notification.userInfo;
    
    UITextView *tv = (UITextView *)[self.view viewWithTag:300];
    
    tv.font = [UIFont systemFontOfSize:[dic[@"fontSize"] integerValue]];
    //[[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)createTextView{
    UITextView *tv = [[UITextView alloc]init];
    tv.tag = 300;
    tv.frame = CGRectMake(10, 40, 300, 200);
    tv.backgroundColor = [UIColor colorWithRed:200./255. green:200./255. blue:200/255. alpha:0.5];
    [tv.layer setMasksToBounds:YES];
    [tv.layer setCornerRadius:10];
    tv.text = @"老码农冒死揭开行业黑幕：[如何编写无法维护的代码]为了造福大众，在编程领域创造就业机会，兄弟在此传授大师秘籍。这些大师写的代码极其难以维护，后继者就是想对它做最简单的修改都需要花上数年时间";
    [self.view addSubview:tv];
    
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
    UITextView *tv = (UITextView *)[self.view viewWithTag:300];
    [tv resignFirstResponder];
    [self shareButtonClicked];

}

-(void)shareButtonClicked{
    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:@"share"
                                                    delegate:nil
                                           cancelButtonTitle:@"cancle"
                         //                                      destructiveButtonTitle:@"error tips"
                                      destructiveButtonTitle:nil
                                           otherButtonTitles:@"sina",@"weixin",@"momo",nil];
    as.delegate = self;
    [as showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    UITextView *tv = (UITextView *)[self.view viewWithTag:300];
    NSLog(@"%s [LINE:%d] \n成功分享了内容:\n\t%@ \n到--->%@",
          __func__,
          __LINE__,
          tv.text,
          [actionSheet buttonTitleAtIndex:buttonIndex]);
}

-(void)clickedClean:(UIBarButtonItem *)clean{
    UITextView *tv = (UITextView *)[self.view viewWithTag:300];
    tv.text = @"";
}


@end
