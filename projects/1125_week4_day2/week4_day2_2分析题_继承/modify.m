#import <Foundation/Foundation.h>
@interface Dog : Animal
{
    int _age; //子类继承父类的时候,成员变量不能和父类同名
    double _height; // 子类继承父类的时候,成员变量不能和父类同名
}

@end

@implementation Dog
- (void)test1
{
    NSLog(@"test1----");
    [super test2];
}
@end

@interface Animal : NSObject
{
    int _age;
    double _weight;
}
- (void)test1;
+ (void)test2;
@end

@implementation Animal
- (void)test1
{
    NSLog(@"test1----");
}
+ (void)test2
{
    NSLog(@"test2----");
}
@end
