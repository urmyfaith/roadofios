//
//  ZXImageView.h
//  1218_touchGuesture02_exercise
//
//  Created by zx on 12/18/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXImageView;
@protocol ZXImageViewDelegate <NSObject>

-(void)moveImageView:(ZXImageView *)imageView;

@end

@interface ZXImageView : UIImageView

@property(nonatomic,assign) id<ZXImageViewDelegate> delegate;
@property(nonatomic,assign) BOOL isAtUp;//判断是否移动过
@property(nonatomic,assign) NSInteger tapCounts;
@property(nonatomic,assign) CGRect originalFrame; //原来的frame

@end



