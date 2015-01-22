//
//  ZXWallPaperCell.m
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "ZXWallPaperCell.h"
#import "ZXPictureView.h"
#import "ZXWallpaperModel.h"
#import "ZXPictureModel.h"


@implementation ZXWallPaperCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        CGFloat WIDTH = 100;
        CGFloat HEIGHT = 180;
        CGFloat gap = 5;
        NSMutableArray *array = [NSMutableArray array];
        
        for (int i = 0;  i < 6; i++) {
            CGFloat x = gap +(WIDTH+gap)*(i%3);
            CGFloat y = 64 + gap +(HEIGHT+gap)*(i/3);
            ZXPictureView *pictureView = [[ZXPictureView alloc]init];
            pictureView.tag = i+100;
            
            pictureView.frame = CGRectMake(x, y, WIDTH, HEIGHT);
            [self.contentView addSubview:pictureView];
            [array addObject:pictureView];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pictureTap:)];
            pictureView.userInteractionEnabled = YES;
            [pictureView addGestureRecognizer:tap];
        }
        self.pictureView_array  = array;
    }
    return self;
}



+(ZXWallPaperCell *)cellWithTableView:(UITableView *)tableView{
    static NSString *ident = @"cell";
    ZXWallPaperCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (!cell) {
        
        cell = [[ZXWallPaperCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
       // cell = [[[NSBundle mainBundle]loadNibNamed:@"projectCell" owner:self options:nil]firstObject];
    }
    return cell;
}
-(void)setMyModel:(ZXWallpaperModel *)myModel{
    _myModel = myModel;

    NSArray *wallPaperModels = myModel.pictureModel_array;
    
    for (int i = 0 ; i < 6 ; i++) {
        ZXPictureView *view = _pictureView_array[i];
        view.pictureModel = wallPaperModels[i];
    }
}



+(ZXWallPaperCell *)cellWithTableView:(UITableView *)tableView andBlock:(BLOCK)myBlock{
//    _myBlock = myBlock;
    static NSString *ident = @"cell";
    ZXWallPaperCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (!cell) {
        
        cell = [[ZXWallPaperCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    cell.myBlock = myBlock;
    return cell;
}


-(void)pictureTap:(UITapGestureRecognizer *)tap{
    UIView *tappedView = (UIView *)tap.view;
//    NSLog(@"%s [LINE:%d]tappedView.tag=%ld", __func__, __LINE__,tappedView.tag);
    //block传值
    self.myBlock([self.myModel.pictureModel_array objectAtIndex:(tappedView.tag -100)]);
}

@end
