//
//  ZXCustomProgressView.h
//  1218_custom_ProgressView
//
//  Created by zx on 12/18/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXCustomProgressView : UIView
{
    UIImageView *_imageViewBackground;
    UIImageView *_imageViewForhead;
}
@property (nonatomic,assign) CGFloat progress;
@property (nonatomic,strong) UIImage *backgroundImage;
@property (nonatomic,strong) UIImage *forheadImage;

-(void)setProgress:(CGFloat)progress animated:(BOOL)animated;
@end
