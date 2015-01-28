//
//  MyNavigationBar.h
//  xCarDemo
//
//  Created by zx on 1/28/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNavigationBar : UIView


-(void)createMyNavigaitonBarWithTitleImag:(NSString * )titleImageName
                    andLeftBtnImagesNames:(NSArray *)leftBtnImagesArray
                   andRightBtnImagesNames:(NSArray *)rightBtnImagesArray
                                 andClass:(id)classObject
                                   andSEL:(SEL)sel;

@end
