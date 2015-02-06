//
//  ZXTabBar.m
//  FashionShow
//
//  Created by zx on 15/2/4.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "ZXTabBar.h"
#import "ShowCommentsViewController.h"

@implementation ZXTabBar
{
    id _currentClassObject;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(ZXTabBar *)tabBarWithImagesArray:(NSArray *)imagesArray
                          andClass:(id)classObject
                            andSEL:(SEL)sel{
    
    _currentClassObject = classObject;
    
    //背景图片---写在最前面.
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithFrame:self.bounds];
    backgroundImageView.image = [UIImage imageNamed:@"一级栏目底"];
    [self addSubview:backgroundImageView];
    
    //64*49每张图片大小
    //(320 - 64*5)*6 = gap
    
    CGFloat singlePhotoWidth = 64.0f;
    CGFloat gap = (self.frame.size.width- singlePhotoWidth*imagesArray.count)/(imagesArray.count + 1);
    
    if (imagesArray.count > 0 ) {
        for (int index = 0 ; index < imagesArray.count; index++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = zxTabBarButtonBaseTag+ index;
            
            UIImage *buttonImage = [UIImage imageNamed:imagesArray[index]];
            button.frame = CGRectMake(gap + buttonImage.size.width*index,
                                      (self.frame.size.height - buttonImage.size.height)/2,
                                      buttonImage.size.width,
                                      buttonImage.size.height);
            [button setImage:buttonImage forState:UIControlStateNormal];
            
            //如果子类需要修改的时候,sel不为空,子类自己实现点击方法
            //target为子类自己
            if (sel != nil) {
                [button addTarget:classObject action:sel forControlEvents:UIControlEventTouchUpInside];
            }else{
                //如果sel == nil,由父类来完成默认的点击事件的处理
                //target为当前的类
                [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            }
            [self addSubview:button];
        }
    }
    return self;
}

-(void)buttonClick:(UIButton *)button{
    NSLog(@"%s [LINE:%d] button.tag =%ld", __func__, __LINE__,button.tag);
    
    UIViewController *curren_vc = (UIViewController *)_currentClassObject;
    switch (button.tag) {
            
#pragma mark  返回按钮事件处理
        case zxTabBarButtonBaseTag:
        {

            [curren_vc.navigationController popViewControllerAnimated:YES];
            NSLog(@"%s [LINE:%d]", __func__, __LINE__);
        }
            break;
#pragma mark  下载按钮事件处理
        case zxTabBarButtonBaseTag+1:
        {
           NSLog(@"%s [LINE:%d]", __func__, __LINE__);
        }
            break;
#pragma mark  分享按钮事件处理
        case zxTabBarButtonBaseTag+2:
        {
           NSLog(@"%s [LINE:%d]", __func__, __LINE__);
        }
            break;
#pragma mark  收藏按钮事件处理
        case zxTabBarButtonBaseTag+3:
        {
            NSLog(@"%s [LINE:%d]", __func__, __LINE__);
        }
            break;
#pragma mark  评论按钮事件处理
        case zxTabBarButtonBaseTag+4:
        {
            ShowCommentsViewController *svc = [[ShowCommentsViewController alloc]init];
            [curren_vc.navigationController pushViewController:svc animated:YES];
            NSLog(@"%s [LINE:%d]", __func__, __LINE__);
        }
            break;
    }
}
@end
