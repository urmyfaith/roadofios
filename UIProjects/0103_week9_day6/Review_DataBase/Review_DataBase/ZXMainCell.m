//
//  ZXMainCell.m
//  Review_DataBase
//
//  Created by zx on 1/15/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXMainCell.h"
#import "MainArticleModel.h"

@implementation ZXMainCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.myIdLabel = [[UILabel alloc]init];
        self.myIdLabel.frame = CGRectMake(50, 10, 60, 30);
        [self.contentView addSubview:self.myIdLabel];
        
        
        self.myTitleLabel =[[UILabel alloc]init];
        self.myTitleLabel.frame = CGRectMake(100, 10, 200, 30);
        [self.contentView addSubview:self.myTitleLabel];
        
    }
    return self;
}

+(ZXMainCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *ident = @"cell";
    ZXMainCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (!cell) {
        cell = [[ZXMainCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    return cell;
}

-(void)setArticleModel:(MainArticleModel *)articleModel{
    _articleModel = articleModel;
    
    self.myIdLabel.text = articleModel.id;
    self.myTitleLabel.text = articleModel.title;
}


@end
