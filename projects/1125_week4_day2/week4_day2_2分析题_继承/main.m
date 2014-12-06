#import <Foundation/Foundation.h>
@interface Animal : NSObject
- (void)test1;
- (void)test2;
- (void)test3;
@end

@implementation Animal
- (void)test1
{
    NSLog(@"Animal-test1");
}
- (void)test2
{
    NSLog(@"Animal-test2");
}
@end

@interface Dog : Animal
@end

@implementation Dog
- (void)test1
{
    NSLog(@"Dog-test1");
}

- (void)test3
{
    NSLog(@"Dog-test3");
}
@end

int main()
{
    Dog *dog = [Dog new];
    [dog test1];//继承父类的时候,重写了对象方法,优先采用对象方法
    [dog test2];//继承后,没有重写方法,采用的是从父类继承过来的方法.
    [dog test3];//同test1.
    return 0;
}

