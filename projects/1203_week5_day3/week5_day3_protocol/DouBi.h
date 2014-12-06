//
//  DouBi.h
//  1203_week5_day3
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

//将协议和类的声明同事放在.h文件中.
@protocol study <NSObject>
-(void)study;
@end

@interface DouBi : NSObject<study>

@end
