//
//  ZXTabBar.h
//  FashionShow
//
//  Created by zx on 15/2/4.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXTabBar : UIView

-(ZXTabBar *)tabBarWithImagesArray:(NSArray *)imagesArray
                          andClass:(id)classObject
                            andSEL:(SEL)sel;

@end
