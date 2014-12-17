//
//  general_table_view.h
//  1214_UITableView01
//
//  Created by zx on 12/14/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableView4WeiXin : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, assign)CGRect         tableViewFrame;

@property (nonatomic, copy)NSMutableArray * textLabel_MArray;

@property (nonatomic, copy)NSMutableArray * images_MArray;

@property (nonatomic, copy)NSMutableArray * subtitle_MArray;

@end
