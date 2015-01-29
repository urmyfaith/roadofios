//
//  RootViewController.h
//  xCarDemo
//
//  Created by zx on 1/28/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

-(void)createMyNavigationBarWithTitle:(NSString *)tilteImage
                           andLeftBtn:(NSArray *)leftBtnArray
                          andRightBtn:(NSArray *)rightBtnArray;

-(void)buttonClick:(UIButton *)button;

@end
