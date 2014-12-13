//
//  ZXConfigViewController.h
//  1213_passValue01
//
//  Created by zx on 12/13/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZXConfigViewDelegate <NSObject>

-(void)changeFontSizeWithField:(UITextField *)textField;

@end


@interface ZXConfigViewController : UIViewController
/**
 *  id 任意类型(任意对象),<>代表了这个对象对象必须遵守这个协议,deletgte代表这个对象.
 *  修饰词用assign 防止循环引用引起对象不能释放
 */
@property (nonatomic,assign) id<ZXConfigViewDelegate> delegate;
@end
