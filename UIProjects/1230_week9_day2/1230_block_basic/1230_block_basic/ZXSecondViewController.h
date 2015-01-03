//
//  ZXSecondViewController.h
//  1230_block_basic
//
//  Created by zx on 12/30/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^secondBlock)(int);

@interface ZXSecondViewController : UIViewController
@property (nonatomic,copy) secondBlock mySecondBlock;
@end
