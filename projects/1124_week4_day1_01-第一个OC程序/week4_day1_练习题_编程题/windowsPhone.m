//
//  windowsPhone.m
//  week4_day1_01-第一个OC程序
//
//  Created by zx on 11/24/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "windowsPhone.h"

@implementation windowsPhone
-(void)playMusic:(char *)musicName{
    NSLog(@"play music \t%s",musicName);
}
-(void)playMovie:(char *)movieName{
    NSLog(@"play movie \t%s",movieName);
}
-(void)sendMail{
    NSLog(@"sending a emali");
}
-(char *)takePicture{
    return "this is picture name";
}
@end
