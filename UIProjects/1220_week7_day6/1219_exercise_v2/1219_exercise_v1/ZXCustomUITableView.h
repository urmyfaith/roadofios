//
//  ZXCustomUITableView.h
//  1219_exercise_v1
//
//  Created by zx on 12/19/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXCustomUITableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,assign)CGRect tableViewFrame;
@property(nonatomic,strong)NSMutableArray * textLabel_Marray;
@property(nonatomic,strong)NSMutableArray * images_MArray;
@property(nonatomic,strong)NSMutableArray * subtitle_MArray;

@end
