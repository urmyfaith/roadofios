//
//  ZXViewController.m
//  demoMeta
//
//  Created by zx on 15/3/11.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "ZXViewController.h"

#import <objc/runtime.h>


@implementation ZXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    //生成类，添加方法，注册类。
    Class newClass = objc_allocateClassPair([NSError class], "RuntimeErrorSubclass", 0);
    class_addMethod(newClass, @selector(report), (IMP)ReportFunction, "v@:");
    objc_registerClassPair(newClass);
    
    //生成实例对象，调用方法。
    id instanceOfNewClass = [[newClass alloc]initWithDomain:@"some Domain" code:0 userInfo:nil];
    [instanceOfNewClass performSelector:NSSelectorFromString(@"report")];
}

-(void)report{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

void ReportFunction(id self, SEL _cmd)
{
    NSLog(@"This object is %p.",self);
    NSLog(@"Class is %@, and super is %@.",[self class],[self superclass]);
    Class currentClass = [self class];
    for( int i = 1; i < 6; ++i )
    {
        NSLog(@"Following the isa pointer %d times gives %p",i,currentClass);
        currentClass = object_getClass(currentClass);
    }
    NSLog(@"NSObject's class is %p", [NSObject class]);
    NSLog(@"NSObject's meta class is %p",object_getClass([NSObject class]));
}

@end
