# Defining Classes定义类















Gorillas, humans, and orangutans, for example, have a number of obvious similarities.(例如,大猩猩,人类,猿类有很多的相似之处.) Although they each belong to different species, and even different genera, tribes, and subfamilies, they are taxonomically related since they all belong to the same family (called “Hominidae”), as shown in Figure 1-1 (page 13).(尽管,大猩猩,人,猿可能分属于不同种类,或者属,甚至子科,但是它们都可以共同属于一个"人科".)


In the world of object-oriented programming, objects are also categorized into hierarchical groups. (在面向对象编程的领域,对象也被分类为分层次的组.)Rather than using distinct terms for the different hierarchical levels such as genus or species, objects are simply organized into classes.(对象不像分类学里被分类为种,属等,对象仅仅被组织为类.) In the same way that humans inherit certain characteristics as members of the Hominidae family, a class can be set to inherit functionality from a parent class.(就像人类继承了人科的某些特性一样,一个类也可以继承父类的功能属性.)




All of the functionality provided by NSString is available in NSMutableString, such as querying specific characters or requesting new uppercase strings, but NSMutableString adds methods that allow you to append, insert, replace or delete substrings and individual characters.(在NSString里提供的所有的功能,NSMutableString都有,例如查询特定的字符,转换大小写,除此之外,NSMutableString还增加了例如字符串添加,替换,删除子串,删除特定字符等功能.)













@interface SimpleClass : NSObject



#Properties Control Access to an Object’s Values 属性控制了一了对象值的访问



(在这个例子里,声明了2个公开的属性,它们都是NSString类的实例)


```
@property NSNumber *yearOfBirth;
```
@property int yearOfBirth;






@interface Person : NSObject






void SomeFunction();


```
￼￼- (void)someMethod;
```






void SomeFunction(SomeType value);

- (void)someMethodWithValue:(SomeType)value;



```
- (void)someMethodWithFirstValue:(SomeType)value1 secondValue:(AnotherType)value2;
```


someMethodWithFirstValue:secondValue:



1和value2值名称不是方法声明中严格的一部分,这就意味着,在声明里使用的名称不必和在实现里使用的名称相同.)(就是说,声明的时候的形参和实现的时候的形参的名称可以不同.)The only requirement is that the signature matches, which means you must keep the name of the method as well as the parameter and return types exactly the same.(唯一的要求是,标志比配,这就意味着方法名需要完全相同,返回这也需要完全相同.)

 (void)someMethodWithFirstValue:(SomeType)info1 secondValue:(AnotherType)info2;

```
- (void)someMethodWithFirstValue:(SomeType)info1 anotherValue:(AnotherType)info2;
```





@interface XYZPerson : NSObject










#import "XYZPerson.h"


## Implementing Methods(类的实现)

```

(这个类的实现就是像这酱紫的:)
```




- (void)sayhello {



- (void)sayHello






```
