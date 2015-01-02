//
//  ZXCustomButton.h
//  1230_block_basic
//
//  Created by zx on 12/30/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZXCustomButton;

typedef void(^BUTTONBLOCK)(ZXCustomButton *);

@interface ZXCustomButton : UIButton

//必须使用copy
@property (nonatomic,copy) BUTTONBLOCK tempBlock;

+(ZXCustomButton *)buttonWithFrame:(CGRect )frame
                       title:(NSString *)title
                    andBlock:(void(^)())block;

@end
