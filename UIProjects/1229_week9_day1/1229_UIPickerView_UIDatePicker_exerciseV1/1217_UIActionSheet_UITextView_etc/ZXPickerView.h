//
//  ZXPickerView.h
//  1217_UIActionSheet_UITextView_etc
//
//  Created by zx on 12/30/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXPickerView : UIPickerView
@property (nonatomic,strong)   NSArray            *sex_Array;
-(id)initWithTarget:(id)target andAction:(SEL)selector;
@end
