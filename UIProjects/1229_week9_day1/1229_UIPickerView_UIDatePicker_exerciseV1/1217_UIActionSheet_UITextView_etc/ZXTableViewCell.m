//
//  ZXTableViewCell.m
//  1217_UIActionSheet_UITextView_etc
//
//  Created by zx on 12/30/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXTableViewCell.h"
#import "ZXUserInfoModel.h"

#define SYSFONT12 [UIFont systemFontOfSize:12]


@implementation ZXTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UILabel *keyLabel = [[UILabel alloc]initWithFrame:CGRectMake(10,
                                                                     5,
                                                                     40,
                                                                     40)];
        [self.contentView addSubview:keyLabel];
        self.label4keyname = keyLabel;
        keyLabel.font = SYSFONT12;
       
#if 0
        UILabel *valueLabel = [[UILabel alloc]initWithFrame:CGRectMake(60,
                                                                       5,
                                                                       200,
                                                                       40)];
        [self.contentView addSubview:valueLabel];
        self.label4keyvalue = valueLabel;
        valueLabel.textAlignment = NSTextAlignmentRight;
        valueLabel.font = SYSFONT12;
#endif
        
        
        UITextView *tv = [[UITextView alloc]initWithFrame:CGRectMake(60,
                                                                    5,
                                                                    200,
                                                                    40)];
        [self.contentView addSubview:tv];
        self.textView4keyvalue = tv;
        tv.textAlignment = NSTextAlignmentRight;
        tv.font = SYSFONT12;

    }
    return self;
}

+(ZXTableViewCell *)cellWithTableView:(UITableView *)tableView{
    
    static NSString *identifier = @"cell";
    ZXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (nil == cell) {
        cell = [[ZXTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}
-(void)setUserInfoModel:(ZXUserInfoModel *)model{
    
    _userInfoModel = model;
    self.label4keyname.text = model.keyname;
   // self.label4keyvalue.text = model.keyvalue;
    self.textView4keyvalue.text = model.keyvalue;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
