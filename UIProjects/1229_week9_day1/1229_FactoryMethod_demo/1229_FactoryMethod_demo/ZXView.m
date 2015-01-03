//
//  ZXView.m
//  1229_FactoryMethod_demo
//
//  Created by zx on 12/29/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXView.h"

@implementation ZXView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
    }
    return self;
}
+(ZXView *)viewWithType:(ZXViewType)type{
    ZXView *view = [[ZXView alloc]init];
    switch (type) {
        case ZXViewTypeWithWhite:
            view.backgroundColor = [UIColor whiteColor];
            break;
        case ZXViewTypeWithYellow:
            view.backgroundColor = [UIColor yellowColor];
            break;
        case ZXViewTypeWithBlue:
            view.backgroundColor = [UIColor blueColor];
            break;
        default:
            break;
    }
    return view;
}

@end
