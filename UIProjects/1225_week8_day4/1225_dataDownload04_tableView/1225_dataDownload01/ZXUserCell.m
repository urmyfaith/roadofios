//
//  ZXUserCell.m
//  1225_dataDownload01
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXUserCell.h"
#import "ZXUserModel.h"
#import "UIImageView+WebCache.h"

@implementation ZXUserCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UIImageView *imageView  = [[UIImageView alloc]init];
        imageView.frame = CGRectMake(10, 5, 50, 50);
        [self.contentView addSubview:imageView];
        self.userImageView = imageView;
        
        
        UILabel *name = [[UILabel alloc]init];
        name.frame = CGRectMake(CGRectGetMaxX(imageView.frame) + 10, 15, 120, 20);
        [self.contentView addSubview:name];
        self.userNameLabel = name;
        
        UILabel *userID = [[UILabel alloc]init];
        userID.frame = CGRectMake(CGRectGetMaxX(imageView.frame) + 10, 35, 120, 20);
        [self.contentView addSubview:userID];
        self.userIDLabel = userID;
        
    }
    return self;
}
+(ZXUserCell *)cellWithTableView:(UITableView *)tableview{
    static NSString *indentifier = @"cell_indentifier";
    ZXUserCell *cell = [tableview dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[ZXUserCell alloc]initWithStyle:UITableViewCellStyleDefault
                                reuseIdentifier:indentifier];
    }
    return cell;
}

-(void)setUserModel:(ZXUserModel *)userModel{
    _userModel                  = userModel;
    self.userNameLabel.text     = userModel.myUserName;
    self.userIDLabel.text       = userModel.myUserID;
    
#if 0
    //从工程中读取图片
    self.userImageView.image    = [UIImage imageNamed:userModel.myUserImage];
#endif
    
#if 1
    //从网络读取图片
    NSString *imagePath = [NSString stringWithFormat:@"http://10.0.8.8/sns%@",userModel.myUserImage];
    NSURL *url = [NSURL URLWithString:imagePath];
    [self.userImageView setImageWithURL:url];
    NSLog(@"%s [LINE:%d] downloadImage", __func__, __LINE__);
#endif
}

@end
