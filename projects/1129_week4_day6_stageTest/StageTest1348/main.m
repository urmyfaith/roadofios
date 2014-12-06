//
//  main.m
//  StageTest1348
//
//  Created by zx on 12/2/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "stageTest.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
/*
 

 1. 简答题(每道2分) 总分20
 1.1 简述什么是面向对象
 一切皆对象===>属性和方法的集合
 
 1.2 简述什么是+方法和-方法
 +类方法<==由类,实例对象来调用
 -实例方法<==由实例对象来调用
 
 1.3 enum和宏的区别
 enum 枚举,枚举就是用一些名称来代表指定的整数,在程序中使用名称可以方便程序书写
 宏  语法替换 ，用于说明某一特定输入如何根据预定义的规则转换成对应的输出（通常也是字符串)
 
 1.4 定义一个MAX和MIN的宏
 #define MAX(a,b)  ((a)>(b)?(a):(b))
 #define MIN(a,b)  ((a)>(b)?(a):(b))
 
 1.5 #import和#include区别
 #import 可以防止重复包含头文件
 
 1.6 @class作用

 如果两个类相互包含,可以使用 @class可以防止重复引用,
 这个时候,告诉编译器我有这个类,但是你不要去包含?
 (如果需要使用对象,还是需要使用#import,然后使用)
 
 
 1.7 什么是Category
 分类就是对现有类和系统的类进行扩充
 可以写匿名的分类.
 
 1.9 self.age = 100和_age = 100区别
 self.age = 100 是使用当前的对象的Set方法来设置值,
 _age = 100,是直接使用实例变量来设置值.
 

 1.10 alloc和init dealloc各自含义
 
 alloc开辟存储空间,对成员变量进行初步初始化
 init生成对象实例,返回对象实例的地址
 dealloc ======problem====
 
 
 // 以下编程题可以使用任何计算机编程语言实现
 2. 实现一个字符串类别, 判断字符串时候是email(iOS开发判断email时候合法)(10分)
 // email必须是类似 xxx@yyy.zzz 什么的格式
 - (BOOL) isEmail(NSString *)srcString;
 
 3. 实现一个字符串类别, 可以实现字符串反转(10分)
 - (NSString *) reverse(NSString *)srcString;
 
 4. 将字符串按照单词进行逆序(10分)
 // 将字符串按照单词进行逆序，空格作为划分单词的唯一条件
 
 //如@"Welcome to Qianfeng in Beijing" 改为 @"Beijing in Qianfeng to Welcome"
 +(NSString *) reveseWordsOfString:(NSString *)string;
 
 5. 去除字符串里面连续的空白 (10)
 // 把>=2个的空白变成1个空白
 - (NSString *) chop:(NSString *)s;
 
 6. 替换字符串s中从startKey到endKey之间的字符串(10分)
 
 //替换成newString
 
 - (NSString *) replaceString:(NSString *)s betweenStartKey:(NSString* )startKey  andEndKey:(NSString*)endKey toString:(NSString *)newString;
 
 7. 实现数组指定关键字排序(20分)
 // 数组里面每一项都存放的是字典NSDictionary对象
 // 写一排序函数 可以针对字典中某个key进行升序，降序排序
 // 参数1: arr表示要排序的数组
 // 参数2: key表示字典的关键字key
 // 参数3: asc=yes表示升序, 否则表示降序
 - (NSArray *) sortArray:(NSArray *)arr withKey:(NSString *)key withAsc:(BOOL)asc
 // 把上述方法转化成类别的形式
 
 8. 类设计(30分)
 面向对象设计
 设计2个独立的类
 人 Person, 狗Dog 自己设计字段和方法
 在设计一个动作类 类Action, 动作类里面有方法 run跑, jump调, eat吃
 // 设计这3个类，和类之间的关系
*/
        stageTest *st = [[stageTest alloc]init];
#if 1
        //第二题
        NSString *emailString = @"zuoxue@qq.com";
        NSLog(@"%i",[st isEmail:emailString]);
        
#endif
       
#if 1
        //第三题
        NSString *string = @"helloworld";
        
#endif
    }
    return 0;
}
