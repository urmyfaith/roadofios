//
//  ZXPictureCell.m
//  VistaLookTheWorld
//
//  Created by zx on 1/18/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXPictureCell.h"
#import "ZXPictureItemView.h"
#import "ZXPictureModel.h"
#import "ZXPictureItemModel.h"


@implementation ZXPictureCell

- (void)awakeFromNib {
    // Initialization code
}



+(ZXPictureCell *)cellWithTableView:(UITableView *)tableVeiw{
    static NSString *identifier = @"cell";
    ZXPictureCell *cell  = [tableVeiw dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[ZXPictureCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //anddoid客户端,每页15个,
        int picutureItemCount = 15;
        
        _pictureItemView_array = [NSMutableArray array];
        
        //九宫格布局
        CGFloat WIDTH = 100.0f;
        CGFloat HEIGHT = 100.0f;
        CGFloat gap = 10.0f;
        
        for (int i = 0; i < picutureItemCount ; i++) {
            CGFloat xPos = gap + WIDTH*(i%3);
            CGFloat yPos = gap + HEIGHT*(i/3);
            
            UIImageView *backgourd = [[UIImageView alloc]init];
            backgourd.frame = CGRectMake(xPos, yPos, WIDTH, HEIGHT);
            if (i%3 == 1) {
                backgourd.image = [UIImage imageNamed:@"酷图底2"];
            }else{
                backgourd.image = [UIImage imageNamed:@"酷图底1"];
            }
            [self.contentView addSubview:backgourd];
            
            ZXPictureItemView *itemView = [[ZXPictureItemView alloc]init];
            itemView.frame = CGRectMake(xPos, yPos, WIDTH, HEIGHT);
            [self.contentView addSubview:itemView];
          
            [_pictureItemView_array addObject:itemView];//每个小视图===>添加到数组中.
        }

        
    }
    return self;
}

-(void)setPictureModel:(ZXPictureModel *)pictureModel{
    _pictureModel = pictureModel;
    
    for (int i = 0 ; i < [_pictureItemView_array count]; i ++) {
        ZXPictureItemView *view = _pictureItemView_array[i];
        view.pictureItemModel = _pictureModel.pictureItems_array[i];
    }
}

@end
