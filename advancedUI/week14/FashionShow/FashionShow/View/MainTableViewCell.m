//
//  MainTableViewCell.m
//  FashionShow
//
//  Created by zx on 15/2/5.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "MainTableViewCell.h"
#import "GenericModel.h"


@implementation MainTableViewCell

/*
 @property (nonatomic,strong) UIImageView    *mainCell_number_imageView;
 @property (nonatomic,strong) UIImageView    *mainCell_picture_imageView;
 @property (nonatomic,strong) UILabel        *mainCell_title_label;

 尺寸:
 首行cell
 高度145
 数字图片宽度65
 
 其他行
 高度85
 图片150w*85h
 320-64-150= 106 剩余
 gapW = 8???
 gapH = 5;


 */


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGFloat gap = 5.0f;
        CGFloat cellHeight = 90.0f;
        CGFloat imageWidth = 50.0f;
        CGFloat imageHeight = 50.0f;
        CGFloat pictureWidth = 150.0f;
        CGFloat pictureHeight = 85.0f;
        
        
        _mainCell_number_imageView = [[UIImageView alloc]init];
        _mainCell_number_imageView.frame = CGRectMake(gap,
                                                      (cellHeight - imageWidth)/2 ,
                                                      imageWidth,
                                                      imageHeight);
        [self.contentView addSubview:_mainCell_number_imageView];
        
        
        _mainCell_picture_imageView = [[UIImageView alloc]init];
        _mainCell_picture_imageView.frame = CGRectMake(CGRectGetMaxX(_mainCell_number_imageView.frame) + gap,
                                                       0,
                                                       pictureWidth,
                                                       pictureHeight);
        [self.contentView addSubview:_mainCell_picture_imageView];
        
        _mainCell_title_label = [[UILabel alloc]init];
        _mainCell_title_label.frame = CGRectMake(CGRectGetMaxX(_mainCell_picture_imageView.frame)+gap,
                                                 0,
                                                 self.frame.size.width - CGRectGetMaxX(_mainCell_picture_imageView.frame) - gap*2,
                                                 cellHeight);
        [self.contentView addSubview:_mainCell_title_label];
        
    }
    return self;
}

+(MainTableViewCell *)cellWithTableView:(UITableView *)tableView{
    
    static NSString *identifer = @"mainCell";
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[MainTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    return cell;
}

-(void)setMainCell_Model:(GenericModel *)mainCell_Model{
    _mainCell_Model = mainCell_Model;

    
}

@end
