//
//  Agency.m
//  1205_week5_day5
//
//  Created by zx on 12/5/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Agency.h"

@implementation Agency


#pragma mark    ----------代理的工作
-(void)agencyWork{

#if 0
    //以代理自己的角度考虑问题:
    //帮雇主找房子.(创建雇主对象,雇主设置代理,雇主找帮助)
    Student *student = [[Student alloc]init];
    [student setDelegate:self];
    [student findHelp];
#endif
   
#if 1
    self.student = [[Student alloc]init];
    self.student.delegate = self;
    //************IMPORTANT
    [self.student findHelp];
#endif
    
}


#pragma mark    -------获得/返回雇主对象
//-(void)setStudent:(Student *)student{
//    _student = student;
//}
//-(Student*)student{
//    return _student;
//}

#pragma mark    -------雇主委托的方法
-(void)findHouse{
    NSLog(@"find hourse by Agency");
}
@end
