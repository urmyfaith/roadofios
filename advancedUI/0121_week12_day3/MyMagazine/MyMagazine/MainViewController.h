//
//  MainViewController.h
//  MyMagazine
//
//  Created by zx on 1/21/15.
//  Copyright (c) 2015 zx. All rights reserved.
//



#import <UIKit/UIKit.h>

#import "PageView.h"


/**
 *  主界面(唯一界面)
 * - 负责切换滚动视图
 * - 声音的控制
 * - 引导页的控制
 */
@interface MainViewController : UIViewController<UIScrollViewDelegate,PageViewDelegete>

@end
