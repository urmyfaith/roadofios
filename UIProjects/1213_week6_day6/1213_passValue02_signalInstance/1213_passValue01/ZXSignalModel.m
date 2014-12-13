//
//  ZXSignalModel.m
//  1213_passValue01
//
//  Created by zx on 12/13/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ZXSignalModel.h"



@implementation ZXSignalModel


//1.声明一个静态的全局变量
static ZXSignalModel *signalModel = nil;

+(ZXSignalModel *)sharedSignalModel{
    //2.线程安全
    @synchronized(self){
        //3.创建对象
        if (signalModel == nil) {
            signalModel = [[ZXSignalModel alloc]init];
        }
    }
    return signalModel;
}

//4.重写alloc方法:保证在任何情况下都只能生成唯一的对象
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    if (signalModel == nil) {
        signalModel = [super allocWithZone:zone];//调用自己会出现死循环.
    }
    return signalModel;
}

@end
