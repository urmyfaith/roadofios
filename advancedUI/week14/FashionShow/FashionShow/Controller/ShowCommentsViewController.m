//
//  ShowCommentsViewController.m
//  FashionShow
//
//  Created by zx on 15/2/3.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "ShowCommentsViewController.h"

@interface ShowCommentsViewController ()

@end

@implementation ShowCommentsViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createNavitaionbar];
    
    
}



#pragma mark 绘制顶部导航栏
//重写root的创建导航栏的方法
-(void)createNavitaionbar{
    
    [self createRootNavigaitonBarWithTitleImag:nil
                                      andIsTop:NO
                                  andTitleName:@"大家在评论"
                            andBackgroundImage:nil
                          andLeftBtnImagesName:@"内文返回_1"
                         andRightBtnImagesName:nil
                                      andClass:self
                                        andSEL:@selector(navigationBarClicked:)];
}

-(void)navigationBarClicked:(UIButton *)button{
    if (button.tag == zxNavigaionBarButtonLeftTag) {
#if 1
        [self.navigationController popViewControllerAnimated:YES];
#else
        [self dismissViewControllerAnimated:YES completion:nil];
#endif
    }
}


@end
