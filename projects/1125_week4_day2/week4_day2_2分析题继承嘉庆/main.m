#import <Foundation/Foundation.h>
@interface Animal : NSObject
- (void)test1;
+ (void)test1;
@end

@implementation Animal
- (void)test1
{
    NSLog(@"--test1");
}
+ (void)test1
{
    NSLog(@"++test2");
}
@end

@interface Dog : Animal
- (void)test3;
@end

@implementation Dog
- (void)test3
{
    NSLog(@"--test3");
    [super test1];
}
@end

int main()
{
    Dog *dog = [Dog new];
    [dog test1];
    //[dog test2];//调用了未声明实现的方法,在父类和子类中都没有该方法.
    [dog test3];
    return 0;
}
