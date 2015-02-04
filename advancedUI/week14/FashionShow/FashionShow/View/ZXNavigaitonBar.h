//
//  ZXNavigaitonBar.h
//  FashionShow
//
//  Created by zx on 15/2/4.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXNavigaitonBar : UIView

//首页,明星,时装,美容,生活,视觉
-(void)createMyNavigaitonBarWithTitleImag:(NSString * )titleImageName
                                 andIsTop:(BOOL)isTopPage
                    andLeftBtnImagesNames:(NSArray *)leftBtnImage
                   andRightBtnImagesNames:(NSArray *)rightBtnImage
                                 andClass:(id)classObject
                                   andSEL:(SEL)sel;

//设置,我的收藏,评论,写评论
-(void)createMyNavigaitonBarWithTitle:(NSString * )titleName
                andLeftBtnImagesNames:(NSArray *)leftBtnImage
               andRightBtnImagesNames:(NSArray *)rightBtnImage
                             andClass:(id)classObject
                               andSEL:(SEL)sel;


@end
