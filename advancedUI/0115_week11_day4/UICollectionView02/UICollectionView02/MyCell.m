//
//  MyCell.m
//  UICollectionView02
//
//  Created by zx on 15/2/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (id)initWithFrame:(CGRect)frame
{
    static int count = 0;
    self = [super initWithFrame:frame];
    if (self) {
        
        NSLog(@"%s [LINE:%d] %d", __func__, __LINE__,count++);
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
