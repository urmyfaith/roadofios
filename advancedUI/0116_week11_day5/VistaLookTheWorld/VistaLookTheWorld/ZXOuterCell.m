//
//  ZXOuterCell.m
//  VistaLookTheWorld
//
//  Created by zx on 1/19/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXOuterCell.h"
#import "ZXOuterModel.h"
#import "ZXInnerView.h"


@implementation ZXOuterCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andModel:(ZXOuterModel *)outModerl
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        //
        UIImageView *backgouround_cat_name = [[UIImageView alloc]init];
        backgouround_cat_name.frame = CGRectMake(0, 0, 320, 50);
        backgouround_cat_name.image = [UIImage imageNamed:@"列表上"];
        [self.contentView addSubview:backgouround_cat_name];
        
        _lable_cat_name = [[UILabel alloc] init];
        _lable_cat_name.frame = CGRectMake(10, 0, 100, 50);
        [self.contentView addSubview:_lable_cat_name];
        
        _outerModel = outModerl;
        
        if (_outerModel !=nil) {
        
            int row_count = (int)[_outerModel.innerModel_array count];
            NSLog(@"%s [LINE:%d] row_count=%i", __func__, __LINE__,row_count);
            _innerViews_array = [NSMutableArray array];
            for (int i = 0 ; i < row_count; i++) {
                CGFloat xPos = 20;
                CGFloat yPos = i* 30  + CGRectGetMaxY(_lable_cat_name.frame);//一个innerView高度30;
                
                //一行
                ZXInnerView *innerView = [[ZXInnerView alloc]initWithFrame:CGRectMake(xPos, yPos, 320, 30 )];
                [self.contentView addSubview:innerView ];
                
                [_innerViews_array addObject:innerView];
                
                
                if (i != (row_count - 1)) {
                    //分割图片
                    UIImage *image_line_break = [UIImage imageNamed:@"分割线2"];
                    UIImageView *imageView_line_break = [[UIImageView alloc]init];
                    imageView_line_break.frame = CGRectMake(20, 2, image_line_break.size.width, image_line_break.size.height);
                    [self.contentView addSubview:imageView_line_break];
                }
            }
            
            if (row_count >0 ) {
                UIImage *buttomImage = [UIImage imageNamed:@"列表下"];
                UIImageView *buttomImageView = [[UIImageView alloc]init];
                
                CGFloat linebreak_heiht = row_count>1 ? 0: 2*(row_count-1);
                
                buttomImageView.frame = CGRectMake(20, CGRectGetMaxY(backgouround_cat_name.frame)+30*row_count + linebreak_heiht, 320, 30       );
                buttomImageView.image = buttomImage;
                
                [self.contentView addSubview:buttomImageView];
            }
        }
        
        
        NSLog(@"%s [LINE:%d]cell嵌套完成", __func__, __LINE__);
        
    }
    return self;
}

+(ZXOuterCell *)cellWithTableView:(UITableView *)tableView andBlock:(BLOCK)myBlock{
    static NSString *identifier = @"cell";
    ZXOuterCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell){
        cell = [[ZXOuterCell alloc]init];
        cell.myBlock = myBlock;
        ZXOuterModel *outModerl =  cell.myBlock(cell.outerModel);
        cell = [[ZXOuterCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier andModel:(ZXOuterModel *)outModerl];
    }
    return cell;

}


-(void)setOuterModel:(ZXOuterModel *)outerModel{
    _outerModel = outerModel;
    
    _lable_cat_name.text  = outerModel.cat_name;
    _lable_cat_name.textAlignment = NSTextAlignmentLeft;
    _lable_cat_name.textColor = [UIColor redColor];
    
    int innerViewCount = (int)[_innerViews_array count];
    
    for (int i  = 0  ; i < innerViewCount ; i++) {
        ZXInnerView *innerView = [_innerViews_array objectAtIndex:i];
        innerView.innerModel = [_outerModel.innerModel_array objectAtIndex:i];
    }
    
}




@end
