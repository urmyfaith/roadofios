//
//  ZXTableViewCell.m
//  1224_custom-cell-by-xib
//
//  Created by zx on 12/24/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXTableViewCell.h"
#import "ZXBookDataModel.h"

@implementation ZXTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //layout UI
    if (self) {
        
        UIImageView *imageView      = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 60, 60)];
        [self.contentView addSubview:imageView];
        self.iconImageView          = imageView;
        
        UILabel *lable4BookTitle    = [[UILabel alloc] init];
        lable4BookTitle.frame       = CGRectMake(CGRectGetMaxX(imageView.frame) + 10,5,200,30);
        [self.contentView addSubview:lable4BookTitle];
        self.bookTitleLabel         = lable4BookTitle;
        
        UILabel *lable4BookPrice    = [[UILabel alloc]init];
        lable4BookPrice.frame       = CGRectMake(CGRectGetMaxX(imageView.frame) + 10, 35, 200, 30);
        [self.contentView addSubview:lable4BookPrice];
        self.bookPriceLabel         = lable4BookPrice;
        
        UILabel *lable4BookDetail   = [[UILabel alloc]init];
        lable4BookDetail.frame      = CGRectMake(CGRectGetMaxX(imageView.frame) + 10, 65, 200, 30);
        [self.contentView addSubview:lable4BookDetail];
        self.bookDetailLabel        = lable4BookDetail;
        
    }
    return self;
}

-(void)setBookDataModel:(ZXBookDataModel *)bookDataModel{
    _bookDataModel              = bookDataModel;
    self.iconImageView.image    = [UIImage imageNamed:bookDataModel.bookImageString];
    self.bookTitleLabel.text    = bookDataModel.bookTitle;
    self.bookPriceLabel.text    =  bookDataModel.bookPrice;
    self.bookDetailLabel.text   = bookDataModel.bookDetail;
}

+(ZXTableViewCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *indentifier = @"cell";
    ZXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (nil == cell) {
        cell = [[ZXTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    return  cell;
}

@end
