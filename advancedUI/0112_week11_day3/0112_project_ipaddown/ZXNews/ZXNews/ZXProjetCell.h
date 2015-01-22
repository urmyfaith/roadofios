//
//  ZXProjetCell.h
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXProjectModel;

@interface ZXProjetCell : UITableViewCell

 /*
 "ID": "125352",
 "post_title": "\u81ea\u7531\u5927\u8fc7\u5929 \u5f00\u653e\u5f0f\u6c99\u76d2\u6e38\u620f\u4e13\u9898",
 "post_name": "sandbox-games",
 "app_icon": "http:\/\/file.ipadown.com\/uploads\/zt\/20150106102053667.png",
 "app_view_count": 294,
 "litpic": "http:\/\/file.ipadown.com\/uploads\/zt\/20150106102053667.png"
 */



@property(nonatomic, strong)IBOutlet UIImageView *litpicImageView;
@property(nonatomic, strong)IBOutlet UILabel *post_titleLabel;

@property(nonatomic, strong)ZXProjectModel *myModel;

+(ZXProjetCell *)cellWithTableView:(UITableView *)tableView;

@end
