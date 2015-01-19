//
//  ZXOuterCell.h
//  VistaLookTheWorld
//
//  Created by zx on 1/19/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <UIKit/UIKit.h>




@class ZXOuterModel;

typedef ZXOuterModel *(^BLOCK)(ZXOuterModel *outerModerl);

@interface ZXOuterCell : UITableViewCell

@property(nonatomic,strong)UILabel *lable_cat_name;

@property(nonatomic,strong)NSMutableArray *innerViews_array;

@property(nonatomic,strong)ZXOuterModel  *outerModel;


@property(nonatomic,strong)BLOCK myBlock;

+(ZXOuterCell *)cellWithTableView:(UITableView *)tableView;



+(ZXOuterCell *)cellWithTableView:(UITableView *)tableView andBlock:(BLOCK)myBlock;

@end

/*
 
 @property(nonatomic,strong) IBOutlet UIImageView *icon_ImageView;
 @property(nonatomic,strong) IBOutlet UILabel *title_Label;
 @property(nonatomic,strong) IBOutlet UILabel *desc_Label;
 @property(nonatomic,strong) IBOutlet UILabel *pub_time;
 
 @property(nonatomic,strong) ZXInfomationModel *infomationModel;
 
 +(ZXInfomationCell *)cellWithTableView:(UITableView *)tableView;

 */
