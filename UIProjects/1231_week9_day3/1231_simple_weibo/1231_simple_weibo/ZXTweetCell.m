//
//  ZXTweetCell.m
//  1231_simple_weibo
//
//  Created by zx on 12/31/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ZXTweetCell.h"
#import "ZXTweetModel.h"
#import "UIImageView+WebCache.h"

@implementation ZXTweetCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    if (self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat gap = 10;
        UIImageView *tempIcon = [[UIImageView alloc]initWithFrame:CGRectMake(gap, gap, 50, 50)];
        [self.contentView addSubview:tempIcon];
        self.iconView = tempIcon;
        
        UILabel *tempTitle = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(tempIcon.frame)+gap, gap, 200, 30)];
        tempTitle.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:tempTitle];
        self.titleLabel = tempTitle;
        
        
        UILabel *tempContent = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(tempIcon.frame)+gap,
                                                                        CGRectGetMaxY(tempTitle.frame) +gap,
                                                                        200,
                                                                        40)];
        tempContent.font = [UIFont systemFontOfSize:12];
        tempContent.numberOfLines = 0;
        [self.contentView addSubview:tempContent];
        self.contentLabel = tempContent;
        
        
        //开始当成每个cell都有图片,
        //后面在加载数据的时候,在对cell进行判断后更新.
        UIImageView *tempSmall = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(tempIcon.frame)+gap,
                                                                              CGRectGetMaxY(tempContent.frame) +gap,
                                                                              50,
                                                                              50)];
        [self.contentView addSubview:tempSmall];
        self.smallView = tempSmall;
        
        UILabel *tempDate = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(tempIcon.frame)+gap,
                                                                     CGRectGetMaxY(tempSmall.frame) +gap,
                                                                     200,
                                                                     30 )];
        tempDate.font = [UIFont systemFontOfSize:10];
        [self.contentView addSubview:tempDate];
        self.nowDateLabel = tempDate ;
        
        UIImage *image = [UIImage imageNamed:@"comment.png"];
        UIImageView *tempCommentView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(tempTitle.frame)+gap,
                                                                                    gap,
                                                                                    image.size.width,
                                                                                    image.size.height)];
        tempCommentView.image = image;
        [self.contentView addSubview:tempCommentView];
        
        UILabel *tempComment = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(tempCommentView.frame),
                                                                        gap,
                                                                        20,
                                                                        20)];
        [self.contentView addSubview:tempComment];
        self.commentLabel = tempComment;
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    [super setSelected:selected animated:animated];

}

-(void)setMyModel:(ZXTweetModel *)myModel{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    _myModel = myModel;
    [self.iconView setImageWithURL:[NSURL URLWithString:myModel.portrait]];
    self.titleLabel.text = myModel.author;
    self.contentLabel.text = myModel.body;
    self.nowDateLabel.text = myModel.pubDate;
    self.commentLabel.text = myModel.commentCount;

    
    //根据加载的数据确定具体的高度.
    self.contentLabel.frame = CGRectMake(CGRectGetMaxX(self.iconView.frame)+ 10,CGRectGetMaxY(self.titleLabel.frame)+10,200,0);
    [self.contentLabel sizeToFit];
    
    self.smallView.hidden = NO;
    if (![myModel.imgSmall isEqualToString:@""]) {
        
        [self.smallView setImageWithURL:[NSURL URLWithString:myModel.imgSmall]];
        self.smallView.frame = CGRectMake(CGRectGetMaxX(self.iconView.frame)+ 10,CGRectGetMaxY(self.contentLabel.frame)+10,50,50);
        self.nowDateLabel.frame = CGRectMake(CGRectGetMaxX(self.iconView.frame)+ 10,CGRectGetMaxY(self.smallView.frame)+10,200,30);
    }else
    {
        self.smallView.hidden = YES;
        self.nowDateLabel.frame = CGRectMake(CGRectGetMaxX(self.iconView.frame)+ 10,CGRectGetMaxY(self.contentLabel.frame)+10,200,30);
    }
}


//创建cell
+(ZXTweetCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"cell";
    ZXTweetCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[ZXTweetCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    return cell;
}
@end
