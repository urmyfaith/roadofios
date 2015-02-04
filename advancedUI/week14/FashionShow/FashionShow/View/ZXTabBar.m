//
//  ZXTabBar.m
//  FashionShow
//
//  Created by zx on 15/2/4.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "ZXTabBar.h"

@implementation ZXTabBar

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
            [button addTarget:classObject action:sel forControlEvents:UIControlEventTouchUpInside];
            
            [self addSubview:button];
        }
    }
    
    
    return self;
}


@end
