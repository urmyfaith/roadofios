//
//  ZXPictureView.m
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "ZXPictureView.h"
#import "UIKit+AFNetworking.h"
#import "ZXPictureModel.h"


@implementation ZXPictureView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor grayColor];
        
        self.thumbImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 140)];
        [self addSubview:self.thumbImageView];
        self.thumbImageView.userInteractionEnabled = YES;

        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 140, 100, 25)];
        [self addSubview:self.titleLabel];
    
    }
    return self;
}



#if 0

//滚动视图内容的大小
self.snapshotScrollView.contentSize = CGSizeMake(10+count*(w+5), 80);

}

-(void)snapTap:(UITapGestureRecognizer *)tap{
    UIImageView *imageView  =     (UIImageView *)tap.view;
    NSLog(@"snapTapped tag=%li",(long)imageView.tag);
    
    ZKLookSnapshotViewController *look = [[ZKLookSnapshotViewController alloc]init];
    look.index = (int)(imageView.tag - 100);
    
    //    look.lookModel = self.detailModel;
    
    look.pageTitle = self.detailModel.name;
    
    look.photos_Array = self.detailModel.snapshotArray;
    
    [self.navigationController pushViewController:look
                                         animated:YES];
}
#endif

-(void) setPictureModel:(ZXPictureModel *)pictureModel{
    _pictureModel = pictureModel;
    
    //NSLog(@"%s [LINE:%d],_pictureModel.thumb=%@", __func__, __LINE__,_pictureModel.thumb);
    [self.thumbImageView setImageWithURL:[NSURL URLWithString:_pictureModel.thumb]];
    self.titleLabel.text = pictureModel.title;
    
}

@end
