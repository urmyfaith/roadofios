//
//  PageView.h
//  MyMagazine
//
//  Created by zx on 1/21/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  每一个页
 *  - 功能:负责每页上的资源的加载
 *  - 层次:分为,低,中,高三层
 *  - 资源类型:分为轻,重两种资源
 *  - 内存控制:负责内层控制
 */
@interface PageView : UIView

//每一页的id.(第几页),与xml文件名对应
@property(nonatomic,strong)NSString *pageViewId;

//页面的页号,与数组_loadPageViewArray对应
@property(nonatomic,assign)int pageViewIndex;

//当前页是否已经被加载
@property(nonatomic,assign)BOOL isLoadPage;

//是否是活动页
@property(nonatomic,assign)BOOL isActivityPage;

//加载/释放轻资源
-(void)loadPage;
-(void)unloadPage;

//加载/释放中资源
-(void)activityPage;
-(void)unActivityPage;

@end

