//
//  ZXPickerView.m
//  1217_UIActionSheet_UITextView_etc
//
//  Created by zx on 12/30/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXPickerView.h"

@interface ZXPickerView()

@property(nonatomic,assign) id                        target;
@property(nonatomic,assign) SEL                     selector;
@end

@implementation ZXPickerView

-(NSArray *)sex_Array{
    if (_sex_Array == nil) {
        _sex_Array = [[NSArray alloc]initWithArray:@[@"男",@"女",@"人妖"]];
    }
    return _sex_Array;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(id)initWithTarget:(id)target andAction:(SEL)selector{
    if (self == [super init]) {
        self.delegate   = self;
        self.dataSource = self;
        self.target     = target;
        self.selector   = selector;
    }
    return self;
}


#pragma  mark UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.sex_Array count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.sex_Array[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"%s [LINE:%d] row=%@", __func__, __LINE__,self.sex_Array[row]);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    if ([self.target respondsToSelector:self.selector]) {
        [self.target performSelector:self.selector withObject:self];
    }
#pragma clang diagnostic pop
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
