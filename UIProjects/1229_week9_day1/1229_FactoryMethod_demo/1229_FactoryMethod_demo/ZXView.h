//
//  ZXView.h
//  1229_FactoryMethod_demo
//
//  Created by zx on 12/29/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ZXViewTypeWithWhite =  1,
    ZXViewTypeWithYellow,
    ZXViewTypeWithBlue
}ZXViewType;

@interface ZXView : UIView

+(ZXView *)viewWithType:(ZXViewType)type;

@end
