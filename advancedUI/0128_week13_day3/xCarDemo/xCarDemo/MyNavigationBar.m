//
//  MyNavigationBar.m
//  xCarDemo
//
//  Created by zx on 1/28/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "MyNavigationBar.h"

@implementation MyNavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)createMyNavigaitonBarWithTitleImag:(NSString * )titleImageName
                    andLeftBtnImagesNames:(NSArray *)leftBtnImagesArray
                   andRightBtnImagesNames:(NSArray *)rightBtnImagesArray
                                 andClass:(id)classObject
                                   andSEL:(SEL)sel{
    
    self.backgroundColor = [UIColor colorWithRed:0.18f green:0.63f blue:0.86f alpha:1.00f];
    [self createTitleImageViewWithTitleImageName:titleImageName];
    
    CGFloat btnX = 0.f;
    if (leftBtnImagesArray ) {
        for (int i = 0 ; i< leftBtnImagesArray.count; i++) {
            
            UIButton *btn = [self createBtnWithBtnImageName:[leftBtnImagesArray objectAtIndex:i]
                                    andBtnX:btnX
                                     andTag:i+1
                                  andIsLeft:YES
                                   andClass:classObject
                                     andSEL:sel];
            btnX = btnX + btn.frame.size.width;
        }
    }
    btnX = self.bounds.size.width;
    if (rightBtnImagesArray) {
        for (int i = 0 ; i< rightBtnImagesArray.count; i++) {
            
            UIButton *btn = [self createBtnWithBtnImageName:[rightBtnImagesArray objectAtIndex:i]
                                                    andBtnX:btnX
                                                     andTag:i+1+10
                                                  andIsLeft:NO
                                                   andClass:classObject
                                                     andSEL:sel];
            btnX = btnX - btn.frame.size.width;
        }
    }
    
}

-(void)createTitleImageViewWithTitleImageName:(NSString *)titleImageName{
    UIImageView *titleImageVeiw = [[UIImageView alloc]initWithImage:[UIImage imageNamed:titleImageName]];
    titleImageVeiw.frame = self.bounds;
    titleImageVeiw.contentMode = UIViewContentModeCenter;
    [self addSubview:titleImageVeiw];
}

-(UIButton *)createBtnWithBtnImageName:(NSString *)btnImageName
                         andBtnX:(CGFloat ) btnX
                          andTag:(int)btnTag
                       andIsLeft:(BOOL)isLeft
                        andClass:(id)classObject
                          andSEL:(SEL)sel{
    UIImage *btnImage = [UIImage imageNamed:btnImageName];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = isLeft ? CGRectMake(btnX,
                                    (self.bounds.size.height-btnImage.size.height)/2,
                                    btnImage.size.width,
                                    btnImage.size.height)
                        :
                        CGRectMake(btnX - btnImage.size.width,
                                   (self.bounds.size.height-btnImage.size.height)/2,
                                   btnImage.size.width,
                                   btnImage.size.height);
    [btn setImage:btnImage forState:UIControlStateNormal];
    btn.tag = btnTag;
    [btn addTarget:classObject action:sel forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    if ([btnImageName isEqualToString:@"Index_Head02.png"]) {
        btn.clipsToBounds = YES;
        btn.layer.cornerRadius = 15.0f;
    }
    return btn;
}

@end
