//
//  ZXCustomUITableView.h
//  1223_exercisev1
//
//  Created by zx on 12/23/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXCustomUITableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray * name_Marray;
@property(nonatomic,strong)NSMutableArray * sex_Marray;
@property(nonatomic,strong)NSMutableArray * telephone_Marray;
@property(nonatomic,strong)NSMutableArray * ID_Marray;

@property(nonatomic,strong)UILabel *name_Label;
@property(nonatomic,strong)UILabel *sex_Label;
@property(nonatomic,strong)UILabel *telephone_Label;
@property(nonatomic,strong)UILabel *ID_Label;
@property(nonatomic,strong)UIButton *modifyButton;

@end
