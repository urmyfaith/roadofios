//
//  ZXImageView.h
//  1218_touchGuesture
//
//  Created by zx on 12/18/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXImageView;
@protocol ZXImageViewDelegate <NSObject>
-(void)enlargeImageView:(ZXImageView        *)imageView;
@end

@interface ZXImageView : UIImageView
@property(nonatomic,assign) id<ZXImageViewDelegate>delegate;
@property(nonatomic,assign) BOOL    isLarge;//是否方法
@property(nonatomic,assign) CGRect  myFrame;//正常状态的frame
@end
