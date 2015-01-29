//
//  InfoViewController.m
//  xCarDemo
//
//  Created by zx on 1/29/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "InfoViewController.h"


@interface InfoViewController ()

@end

@implementation InfoViewController
{
    UIWebView *_webView;
    ALRadialMenu *_ratialMenu;
    UIButton *_btn;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createNavigationBar];
    
    [self loadWebView];
    
    [self createALRadialMenu];
}

#pragma mark 创建弹出扇形小球的效果

-(void)createALRadialMenu{
    _ratialMenu = [[ALRadialMenu alloc]init];
    _ratialMenu.delegate = self;
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(320-28, self.view.frame.size.height-28, 22, 22);
    [_btn setImage:[UIImage imageNamed:@"addthis500.png"] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(radialMenuClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn];
    
}

#pragma 弹出点击事件
-(void)radialMenuClick:(UIButton *)button{
    [_ratialMenu buttonsWillAnimateFromButton:button inView:self.view];
}

#pragma makr ALRadialMenuDelegate 方法

//弹出小球的数量
-(NSInteger)numberOfItemsInRadialMenu:(ALRadialMenu *)radialMenu{
    return 9;
}

//设置起始角度(-180~180)
-(NSInteger)arcStartForRadialMenu:(ALRadialMenu *)radialMenu{
    return -180;
}


//小球的旋转的角度
-(NSInteger)arcSizeForRadialMenu:(ALRadialMenu *)radialMenu{
    return 90;
}

//距离圆心按钮的半径
-(NSInteger)arcRadiusForRadialMenu:(ALRadialMenu *)radialMenu{
    return 180;
}

//小球的图片
-(UIImage *)radialMenu:(ALRadialMenu *)radialMenu imageForIndex:(NSInteger)index{
    UIImage *image = nil;
    switch (index) {
        case 1:
            image = [UIImage imageNamed:@"dribbble"];
            break;
        case 2:
            image =  [UIImage imageNamed:@"youtube"];
            break;
        case 3:
            image =  [UIImage imageNamed:@"vimeo"];
            break;
        case 4:
            image = [UIImage imageNamed:@"pinterest"];
            break;
        case 5:
            image = [UIImage imageNamed:@"twitter"];
            break;
        case 6:
            image =  [UIImage imageNamed:@"instagram500"];
            break;
        case 7:
            image = [UIImage imageNamed:@"email"];
            break;
        case 8:
            image =  [UIImage imageNamed:@"googleplus-revised"];
            break;
        case 9:
            image = [UIImage imageNamed:@"facebook500"];
            break;
        default:
            break;
    }
    return image;
}

-(void)radialMenu:(ALRadialMenu *)radialMenu didSelectItemAtIndex:(NSInteger)index{
    [_ratialMenu itemsWillDisapearIntoButton:_btn];
}

#pragma mark  加载网页

-(void)loadWebView{
    _webView = [[UIWebView alloc]init];
    _webView.frame = CGRectMake(0, 64, 320, 568-64);
    
    NSURL *url = [NSURL URLWithString:_infoLink];
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    [_webView loadRequest:request];
    
    
    [self.view addSubview:_webView ];
}

#pragma mark 重写导航条
    
-(void)createNavigationBar{
    [self createMyNavigationBarWithTitle:@"non-exit-image"
                              andLeftBtn:@[@"News_Details_Btn_Back.png"]
                             andRightBtn:@[@"News_Details_Btn_Comment.png",@"News_Details_Btn_Share.png"]];
}

-(void)buttonClick:(UIButton *)button{
    NSLog(@"butont.tag=%ld",(long)button.tag);
    if (button.tag == 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }else if (button.tag == 11)
    {
        //评论
        [_webView goBack];
    }else if (button.tag == 12)
    {
        //分享
    }else
        NSLog(@"how could you do that?");
}

@end
