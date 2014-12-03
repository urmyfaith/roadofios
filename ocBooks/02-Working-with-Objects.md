#Working with Objects

##Objects Send and Receive Messages对象如何发送和接收消息


```
	[someObject doSomething];
```




@interface XYZPerson : NSObject
```



@implementation XYZPerson



```
[somePerson sayHello];
```




int someInteger = 42;


- (void)myMethod {









- (void)someMethodWithValue:(SomeType)value;

- (void)saySomething:(NSString *)greeting;


```
- (void)saySomething:(NSString *)greeting {
```






- (int)magicNumber;

- (int)magicNumber {




￼int interestingNumber = [someObject magicNumbe


- (NSString *)uppercaseString;


NSString *testString = @"Hello, world!";


- (NSString *)magicString {


(在这里有一个内存管理方面的需要考虑:返回的一个对象(在heap上创建)需要在方法调用之后,仍然生存,但是又不是永久的,如果是永久的,就会造成内存泄露.)




@implementation XYZPerson




@interface XYZShoutingPerson : XYZPerson
```

```
 @implementation XYZShoutingPerson
```




@implementation XYZShoutingPerson




￼+ (id)alloc;






￼￼￼￼- (id)init;


NSObject *newObject = [[NSObject alloc] init];



> Note: It’s possible for init to return a different object than was created by alloc,so it’s best practice to nest the calls as shown.(注意:**init方法肯能会返回一个与通过alloc方法返回的,不同对象,因此,最好的方法使用上面的嵌套调用.**)

> NSObject *someObject = [NSObject alloc];




```

NSNumber *magicNumber = [[NSNumber alloc] initWithInt:42];


### Class Factory Methods Are an Alternative to Allocation and Initialization
(类的工厂方法也是一个分配内存和初始化的替代方法.)

+ (NSNumber *)numberWithBool:(BOOL)value;
 (NSNumber *)numberWithFloat:(float)value;
 (NSNumber *)numberWithInt:(int)value;
 (NSNumber *)numberWithLong:(long)value;


```
NSNumber *magicNumber = [NSNumber numberWithInt:42];
```




如果初始化对象不需要参数,可以使用new方法



XYZObject *object = [XYZObject new];




```
NSString *someString = @"Hello, World!";
```


```
NSString *someString = [NSString stringWithCString:"Hello, World!"
```


```
NSNumber *myBOOL = @YES;
NSNumber *myInt = @42;




NSNumber *myInt = @(84 / 2);






id someObject = @"Hello, World!";



NSString *someObject = @"Hello, World!";


```
XYZPerson *firstPerson = [[XYZPerson alloc] init];
```





if (someInteger == 42) {


```
if (firstPerson == secondPerson) {
```

if ([firstPerson isEqual:secondPerson]) {

if ([someDate compare:anotherDate] == NSOrderedAscending) {


```
BOOL success = NO;


XYZPerson *somePerson;





if (somePerson != nil) {

or simply supply the variable:(或者是仅仅使用变量)

```
if (somePerson) {
```

If the somePerson variable is nil, its logical value is 0 (false). If it has an address, it’s not zero, so evaluates as true.(如果somePerson变量是nil,那么逻辑值就是0(false),如果它有值,也就是不为零,那么表达式为真.)



Similarly, if you need to check for a nil variable, you can either use the equality operator:(类似的,如果需要检查一个变量是否为nil,可以使用等号操作符)

```
if (somePerson == nil) {
```


if (!somePerson) {