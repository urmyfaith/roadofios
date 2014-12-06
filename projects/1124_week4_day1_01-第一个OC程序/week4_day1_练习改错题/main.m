// 第1题：类的声明和实现、对象的创建
#if 0
#import <Foundation/Foundation.h>
@interface Person : NSObject
{
  @public
    int age;
    
    double height;

}
- (void)study;
@end


@implementation Person
- (void)study
{
    NSLog(@"年龄为%d的人在学习", age);
}
@end

int main()
{
    
    Person *p = [Person new];
    p->age = 10;
    p->height = 1.78f;
    [p study];
    return 0;
}
#endif

#if 0
#import <Foundation/Foundation.h>
@interface Test : NSObject

- (int)addNum1:(int)num1 andNum2:(int)num2;

- (double)pi;

- (void)test;
@end

@implementation Test
- (int)addNum1:(int)num1 andNum2:(int)num2
{
    return num1 + num2;
}

- (double)pi
{
    return 3.14;
}

- (void)test
{
    
}
@end

int main()
{
    return 0;
}

#endif

#if 0
#import <Foundation/Foundation.h>
@interface Car : NSObject
{
@public
    int wheels;
}
- (void)run;
- (void)test;
- (void)haha;
@end

@implementation Car
- (void)test
{
    NSLog(@"测试一下车子：%i", wheels);
}

- (void)run
{
    NSLog(@"%i个轮子的车跑起来了", wheels);
}

- (void)haha
{
    NSLog(@"调用了haha");
}

@end

int main()
{
    Car *c = [Car new];
    [c run];
    [c test];
    
    return 0;
}

#endif

#if 1
#import <Foundation/Foundation.h>
@interface Person : NSObject
{
    int _age;
}
- (void)test1;
+ (void)test2;
@end

@implementation Person
- (void)test1
{
    NSLog(@"调用了test1方法");
}

+ (void)test2
{
   // [self test1];
 //   NSLog(@"调用了test2方法-%d", _age);
}
@end

int main()
{
    Person *p = [Person new];
  //  [p test2];
    
  //  [Person test1];
    [p test1];
}

#endif

