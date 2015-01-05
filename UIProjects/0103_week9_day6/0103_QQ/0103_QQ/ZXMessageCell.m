//
//  ZXMessageCell.m
//  0103_QQ
//
//  Created by zx on 1/3/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXMessageCell.h"

#import "ZXMessageModel.h"
#import "ZXUserModel.h"

@interface ZXMessageCell()
@property (nonatomic,assign) BOOL shouldShowDate;
@end

@implementation ZXMessageCell

+(ZXMessageCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *indentifier = @"cell";
    ZXMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[ZXMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //------时间标签View  固定尺寸44
        UIView *labelBackGround = [[UIView alloc] initWithFrame:CGRectMake(0, 10, 50, 20)];
        labelBackGround.center = CGPointMake(320/2, 44/2);
        [labelBackGround.layer setMasksToBounds:YES];
        [labelBackGround.layer setCornerRadius:10];
        [labelBackGround.layer setBorderWidth:0];
        labelBackGround.backgroundColor = [UIColor colorWithRed:200/255. green:200/255. blue:200/255 alpha:0.5];
        [self.contentView addSubview:labelBackGround];
        self.dateUIView = labelBackGround;
        
        UILabel *label4Date = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
        label4Date.center = CGPointMake(320/2, 44/2);
        label4Date.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:label4Date];
        self.dateLabel  = label4Date;
        
        //-----头像Image
        UIImageView *imageView4Head = [[UIImageView alloc]init];
        [self.contentView addSubview:imageView4Head];
        self.headImageView = imageView4Head;
        
        //-----文字背景Image
        UIImageView *labelBackgroundImage = [[UIImageView alloc]init];
        [self.contentView addSubview:labelBackgroundImage];
        self.contentImageView = labelBackgroundImage;
        
        
        //-----文字标签Label
        UILabel *label4Content = [[UILabel alloc]init];
        [self.contentView addSubview:label4Content];
        self.contentLabel  = label4Content;
    }
    return self;
}


//重新设置  文字背景Image  文字标签Label
-(void)setMessageModel:(ZXMessageModel *)messageModel{
    _messageModel = messageModel;
    if ([messageModel isTimeMessage]) { //时间数据,显示日期
        
        self.shouldShowDate         = YES;
        self.dateUIView.hidden      = NO;
        self.dateLabel.hidden       = NO;
        
        self.dateLabel.text         = messageModel.messageContent;//差点给忘了= = 
        
        self.headImageView.hidden       = YES;
        self.contentImageView.hidden    = YES;
        self.contentLabel.hidden        = YES;
    }
    else{
        
        self.shouldShowDate     = NO;
        self.dateUIView.hidden  = YES;
        self.dateLabel.hidden   = YES;
        
        self.contentLabel.text = messageModel.messageContent;
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.font  = [UIFont systemFontOfSize:17.0];
        CGSize size             = [self.contentLabel sizeThatFits:CGSizeMake(180,0)];
        
        if ( self.messageModel.userId  == 1) { //右侧头像boss-->文本靠右
            self.contentLabel.frame         = CGRectMake(320-5-40-15-5-size.width, 5+5,size.width, size.height);
            
             UIImage *backImage             = [UIImage imageNamed:@"balloon_right_blue.png"];

            self.contentImageView.frame     = CGRectMake(320-5-40-15-5-size.width-5,5,size.width+5+5+15,size.height+5+5);
            self.contentImageView.image     = [backImage stretchableImageWithLeftCapWidth:16 topCapHeight:20];
            
        }else{                         //左侧自己头像-->文本靠左
           self.contentLabel.frame          = CGRectMake(5+40+15+5,5+5,size.width, size.height);
            
            UIImage *backImage              = [UIImage imageNamed:@"balloon_left_purple.png"];
            
            self.contentImageView.frame     = CGRectMake(5+40,5,size.width+5+5+15,size.height+5+5);
            self.contentImageView.image     = [backImage stretchableImageWithLeftCapWidth:16 topCapHeight:20];
        }
    }
}

//重新设置头像 头像Image

-(void)setUserModel:(ZXUserModel *)userModel{
    _userModel = userModel;
    self.headImageView.image = [UIImage imageNamed:userModel.userHeadImage];
    
    if (self.shouldShowDate == NO) {
        if ([userModel userId] == 1) { //右侧头像boss
            self.headImageView.frame = CGRectMake(320-5-40, 5, 40, 40);
        }else{                         //左侧自己头像
            self.headImageView.frame = CGRectMake(5, 5, 40, 40);
        }
    }
}
@end
