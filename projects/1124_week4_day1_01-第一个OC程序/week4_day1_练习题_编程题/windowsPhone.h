//
//  windowsPhone.h
//  week4_day1_01-第一个OC程序
//
//  Created by zx on 11/24/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    white,blue,black,
}COLOR;

@interface windowsPhone : NSObject
{
    @public
    COLOR _color;
    int  _size;
    int  _memory;
    int  _CPU;
}
-(void)playMusic:(char *)musicName;
-(void)playMovie:(char *)movieName;
-(void)sendMail;
-(char *)takePicture;
@end
