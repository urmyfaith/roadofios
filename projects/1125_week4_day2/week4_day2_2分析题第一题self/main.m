#import <Foundation/Foundation.h>
@interface Person : NSObject
{
    int _age;
}
- (void)test1;
- (void)test2;
+ (void)test2;

+ (void)test3;
+ (void)test4;
- (void)test4;
@end


//知识点,方法内的局部变量和成员变量同名的时候,采用就近原则
@implementation Person
- (void)test1
{
    _age = 20;
    
    int _age = 10;
    NSLog(@"调用了-test1方法-%d", _age);
    [self test2];
}

- (void)test2
{
    int _age = 10;
    NSLog(@"调用了-test2方法-%d", self->_age);
}

+ (void)test2
{
    int _age = 20;
    NSLog(@"调用了+test2方法-%d", _age);
}

//类对象调用类方法
//使用self,self代表的是类名
//self调用类方法.
+ (void)test3
{
    NSLog(@"调用了+test3方法");
    [self test4];
}

+ (void)test4
{
    NSLog(@"调用了+test4方法");
}

- (void)test4
{
    NSLog(@"调用了-test4方法");
}
@end

int main()
{
    [Person test3];
    
    Person *p = [Person new];
    [p test1];
    return 0;
}