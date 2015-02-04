//
//  ZXNavigaitonBar.m
//  FashionShow
//
//  Created by zx on 15/2/4.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "ZXNavigaitonBar.h"

@implementation ZXNavigaitonBar


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)createMyNavigaitonBarWithTitleImag:(NSString * )titleImageName
                                 andIsTop:(BOOL)isTopPage
                       andBackgroundImage:(NSString *)backgroundImage
                    andLeftBtnImagesNames:(NSArray *)leftBtnImage
                   andRightBtnImagesNames:(NSArray *)rightBtnImage
                                 andClass:(id)classObject
                                   andSEL:(SEL)sel{
    //背景图片---写在最前面.
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithFrame:self.bounds];
    if (backgroundImage != nil)
        backgroundImageView.image = [UIImage imageNamed:backgroundImage];
    else
        backgroundImageView.image = [UIImage imageNamed:@"标题栏底"];
    [self addSubview:backgroundImageView];
    

    //中间的logo
    [self createTitleImageViewWithTitleImageName:titleImageName andIsTop:isTopPage];
    
    
    //左右两侧的button
    
}

-(void)createTitleImageViewWithTitleImageName:(NSString *)titleImageName andIsTop:(BOOL)isTopPage{
    
    //中间图片
    UIImageView *titleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:titleImageName]];
    titleImageView.frame = self.bounds;
    titleImageView.contentMode = UIViewContentModeCenter;
    [self addSubview:titleImageView];
    
    //top图片
    if (isTopPage == YES) {
        
        UIImage *topImage = [UIImage imageNamed:@"logo"];
        
        UIImageView *topImageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleImageView.frame), CGRectGetMaxY(titleImageView.frame)-topImage.size.height/2, topImage.size.width, topImage.size.height)];
        topImageView.image = topImage;
        [self addSubview:topImageView];
    }
}

@end
