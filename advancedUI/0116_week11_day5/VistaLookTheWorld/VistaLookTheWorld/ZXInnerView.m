//
//  ZXInnerView.m
//  VistaLookTheWorld
//
//  Created by zx on 1/19/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXInnerView.h"
#import "ZXInnerModel.h"



@implementation ZXInnerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        //背景图片
        UIImageView *bakcgourndImage = [[UIImageView alloc]init];
        bakcgourndImage.frame = CGRectMake(0, 0, 320, 30);
        bakcgourndImage.image = [UIImage imageNamed:@""];
        [self addSubview:bakcgourndImage];
        
        
        //星星
        UIImageView *imageView_star = [[UIImageView alloc]init];
        UIImage *image_star = [UIImage imageNamed:@"五角星_2"];
        
        imageView_star.frame = CGRectMake(10, 10, image_star.size.width,image_star.size.height);
        imageView_star.image = image_star;
        [bakcgourndImage addSubview:imageView_star];
        
        //文字
        _lable_title = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView_star.frame), 0, 320-10-10-20, 30)];
        [bakcgourndImage addSubview:_lable_title];
        

        
    }
    return self;
}

-(void)setInnerModel:(ZXInnerModel *)innerModel{
    _innerModel = innerModel;
    _lable_title.text = innerModel.title;
    
}

/*
 @property(nonatomic,strong)UILabel *lable_title;
 
 @property(nonatomic,strong)ZXInnerModel *model;
 
 */

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
