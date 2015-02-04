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
                             andTitleName:(NSString *)titleName
                       andBackgroundImage:(NSString *)backgroundImage
                     andLeftBtnImagesName:(NSString *)leftBtnImage
                    andRightBtnImagesName:(NSString *)rightBtnImage
                                 andClass:(id)classObject
                                   andSEL:(SEL)sel{

    //背景图片---写在最前面.
    UIImageView *backgroundImageView = [[UIImageView alloc]initWithFrame:self.bounds];
    
    if (backgroundImage != nil)
        backgroundImageView.image = [UIImage imageNamed:backgroundImage];
    else
        backgroundImageView.image = [UIImage imageNamed:@"标题栏底"];
    [self addSubview:backgroundImageView];
 
    
    CGFloat leftGap = 0;
    //中间的logo  是文字? 还是图片?
    if (titleImageName!=nil) {
        [self createTitleImageViewWithTitleImageName:titleImageName andIsTop:isTopPage];
        leftGap = 10.0f;
    }
    if (titleName != nil) {
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.frame = self.bounds;
        titleLabel.contentMode = UIViewContentModeCenter;
        [self addSubview:titleLabel];
        leftGap =  15.0f;
    }
    
    //左右两侧的button
    
    UIImage *buttonLeftImage = [UIImage imageNamed:leftBtnImage];
    
    UIButton *buttonLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonLeft.tag  = zxNavigaionBarButtonLeftTag;
    buttonLeft.frame = CGRectMake(leftGap,
                                  (self.bounds.size.height - buttonLeftImage.size.height)/2,
                                  buttonLeftImage.size.width,
                                  buttonLeftImage.size.height);
    
    [buttonLeft setImage:buttonLeftImage forState:UIControlStateNormal];
    [buttonLeft addTarget:classObject action:sel forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:buttonLeft];
    
    
    
    UIImage *buttonRightImage = [UIImage imageNamed:rightBtnImage];
    
    UIButton *buttonRight = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonRight.tag = zxNavigaionBarButtonRightTag;
    buttonRight.frame = CGRectMake(self.bounds.size.width - leftGap,
                                  (self.bounds.size.height - buttonLeftImage.size.height)/2,
                                  buttonRightImage.size.width,
                                  buttonRightImage.size.height);
    
    [buttonRight setImage:buttonRightImage forState:UIControlStateNormal];
    [buttonRight addTarget:classObject action:sel forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:buttonRight];
    
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
