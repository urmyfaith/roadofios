//
//  ZXInfomationCell.h
//  VistaLookTheWorld
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZXInfomationModel;

@interface ZXInfomationCell : UITableViewCell

@property(nonatomic,strong) IBOutlet UIImageView *icon_ImageView;
@property(nonatomic,strong) IBOutlet UILabel *title_Label;
@property(nonatomic,strong) IBOutlet UILabel *desc_Label;
@property(nonatomic,strong) IBOutlet UILabel *pub_time;

@property(nonatomic,strong) ZXInfomationModel *infomationModel;

+(ZXInfomationCell *)cellWithTableView:(UITableView *)tableView;

@end

/*
 "id": "4908",
 "title": "英雄难过蚂蚁关",
 "desc": "继续深入亚马逊丛林，我们的下一站，是“子弹蚁部落”。我要去那儿，迎接这次亚马逊探险的终极挑战。在赴巴西之前做功课的时候，得知丛林深处藏着一个很奇怪的部落，部落里的每个男性，必须要经过被子弹蚁尾刺针蛰的成人礼，方才能留在部落里，否则就会被驱逐出村子。而子弹蚁到底有多厉害？蚁如其名，仿佛中枪。子弹蚁是世界上最大的蚂蚁，也是蜇人最痛的蚂蚁。酋长是个胖子，得知我们的来意之后，一脸的蔑视，他觉得我不敢挑战。",
 "icon": "http://img2.ifenghui.com/ktx_t/detail/270/170/0/2014/11/6/1415252768953.jpg",
 "author": "联合版权",
 "pub_time": "2014-11-06"Mi
 },
 */
