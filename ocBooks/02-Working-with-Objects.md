#Working with ObjectsThe majority of work in an Objective-C application happens as a result of messages being sent back and forth across an ecosystem of objects. (OC应用程序的大部分的工作都是在进行对象之间相互的信息传递.传过来啊,传过去.)Some of these objects are instances of classes provided by Cocoa or Cocoa Touch, some are instances of your own classes.(一些是由系统提供的类的实例,一些是自己编写的类的实例.)The previous chapter described the syntax to define the interface and implementation for a class, including the syntax to implement methods containing the code to be executed in response to a message.(之前的章节描述了类的接口,类的实现,在类的实现里有具体的如何响应消息的代码.) This chapter explains how to send such a message to an object, and includes coverage of some of Objective-C’s dynamic features, including dynamic typing and the ability to determine which method should be invoked at runtime.(这章介绍了如何把消息传递到对象中,包括了动态绑定和在运行时再具体指定实际响应的方法.)Before an object can be used, it must be created properly using a combination of memory allocation for its properties and any necessary initialization of its internal values.(**在对象使用之前,必须使用内存分配的方法来分配内存,对成员变量进行合适的初始化**.) This chapter describes how to nest the method calls to allocate and initialize an object in order to ensure that it is configured correctly.(**这章还描述了如何通过方法的嵌套调用,初始化一个对象,确保对象在使用之前成员变量已经进行了正确的配置.**)

##Objects Send and Receive Messages对象如何发送和接收消息
Although there are several different ways to send messages between objects in Objective-C, by far the most common is the basic syntax that uses square brackets, like this:(尽管OC中有多种传递消息的方法,但是最基本的语法是使用方括号,例如:)

```
	[someObject doSomething];
```
The reference on the left, someObject in this case, is the receiver of the message. The message on the right, doSomething, is the name of the method to call on that receiver.(在这个例子中,someObject是消息的接受者,doSomething是所要传递的消息,也就是接受者调用的方法.) In other words, when the above line of code is executed, someObject will be sent the doSomething message.(换句话说,当这行代码执行后,消息doSomething会被发送给消息的接受者someObject)

The previous chapter described how to create the interface for a class, like this:(之前的章节描述了怎么样来定义类的接口)
```
@interface XYZPerson : NSObject- (void)sayHello;@end
```
and how to create the implementation of that class, like this:
(和如何实现一个类,如下:)
```
@implementation XYZPerson- (void)sayHello {    NSLog(@"Hello, world!");}@end```
>Note: This example uses an Objective-C string literal, @"Hello,world!". Strings are one of several class types in Objective-C that allow a shorth and literal syntax for their creation.(这个例子中使用了OC的字符串,这里使用的是一个简便的方法创建了一个字符串.) Specifying @"Hello, world!" is conceptually equivalent to saying “An Objective-C string object that represents the string Hello, world! .”(更加具体的,这个@"Hello world"就等价于说,一个对象代表了字符串Hello,world.)>Literals and object creation are explained further in Objects Are Created Dynamically (page 34), later in this chapter.
Assuming you’ve got hold of an XYZPerson object, you could send it the sayHello message like this:(假设你有了一个XYZPerson对象,那么你可以向它发送一个sayHello的消息,如下)

```
[somePerson sayHello];
```Sending an Objective-C message is conceptually very much like calling a C function.(发送OC消息在概念上很像调用一个C函数.) Figure 2-1 (page 25) shows the effective program flow for the sayHello message.(图显示了消息传递的时候实际上的程序流程图.)
In order to specify the receiver of a message, it’s important to understand how pointers are used to refer to objects in Objective-C.(为了指定消息的接受者,很重要的是理解OC里指向对象的指针.)
### Use Pointers to Keep Track of Objects使用指针来保存(记录,追踪)对象C and Objective-C use variables to keep track of values, just like most other programming languages.(C和OC里,像其他编程语言一样,使用变量来保存值)
There are a number of basic scalar variable types defined in standard C, including integers, floating-point numbers and characters, which are declared and assigned values like this:(标准C中有很多的基本的类型,包括整形,浮点型,字符串,如下)
```
int someInteger = 42;float someFloatingPointNumber = 3.14f;``
Local variables, which are variables declared within a method or function, like this:are limited in scope to the method in which they are defined.(局部变量通常是在一个方法或者函数里声明,它们的作用域也就是它们声明的函数,方法,的范围内部.)
````
- (void)myMethod {    int someInteger = 42;}```
In this example, someInteger is declared as a local variable inside myMethod; once execution reaches the closing brace of the method, someInteger will no longer be accessible.(在这个例子中,someInteger作为一个局部变量声明在myMethond内部,一旦程序执行到大括号的结尾,someInteger就不可以访问了.) When a local scalar variable (like an int or a float) goes away, the value disappears too.(当局部变量不能访问了,它的值也就没有了.)
Objective-C objects, by contrast, are allocated slightly differently.(和C变量对比起来,OC的对象的分配稍有不同.) Objects normally have a longer life than the simple scope of a method call.(**对象通常会有比方法调用的范围更长的生命周期.**) In particular, an object often needs to stay alive longer than the original variable that was created to keep track of it, so an object’s memory is allocated and deallocated dynamically.(**特别的,一个对象经常需要比原有的变量生存的时间更长,因此一个对象的内存是被动态的分配和释放的**.)> Note: If you’re used to using terms like the stack and the heap,alocal variable is allocated on the stack, while objects are allocated on the heap.(如果你对使用stack和heap这样的术语熟悉的话,那么局部变量被分配在stack中,对象被分配在heap中.)
This requires you to use C pointers (which hold memory addresses) to keep track of their location in memory, like this:((出于上面的原因)这就需要使用C指针(指针存储地址)来保存对象在内存中的位置,例如:)
```  - (void)myMethod {      NSString *myString = // get a string from somewhere...      [...]
   }```
Although the scope of the pointer variable myString (the asterisk indicates it’s a pointer) is limited to the scope of myMethod, the actual string object that it points to in memory may have a longer life outside that scope.(尽管myString的作用域正常是在{}内部,但是实际上这个指针所指向的内容,在出了这个作用域后,还是存在的.) It might already exist, or you might need to pass the object around in additional method calls, for example.(这样,在其他的地方,你可能使用什么方法来调用这对象.)
###You Can Pass Objects for Method Parameters可以使用对象作为方法的参数
If you need to pass along an object when sending a message, you supply an object pointer for one of the method parameters. (如果你需要在传递消息的时候使用对象,只需要传递一个对象指针作为参数就可以了.)The previous chapter described the syntax to declare a method with a single parameter:(上面的章节描述了声明一个带参数的方法:)
```
- (void)someMethodWithValue:(SomeType)value;```
The syntax to declare a method that takes a string object, therefore, looks like this:```
- (void)saySomething:(NSString *)greeting;```
You might implement the saySomething: method like this:(使用一个字符串对象作为参数的方法,例如实现saySomething的方法可能如下:)

```
- (void)saySomething:(NSString *)greeting {    NSLog(@"%@", greeting);}
```The greeting pointer behaves like a local variable and is limited in scope just to the saySomething: method, even though the actual string object that it points to existed prior to the method being called, and will continue to exist after the method completes.(greeting指针像一个局部变量一样,被限制在saySomething:方法内部,即使在方法被调用之前,指针所指向真正的字符串对象会在方法调用结束之后仍然存在.)
> Note: NSLog() uses format specifiers to indicate substitution tokens, just like the C standard library printf() function. (NSLog()函数使用特定的字符作为占位符,就像在标准C里的printf()函数一样.)The string logged to the console is the result of modifying the format string (the first argument) by inserting the provided values (the remaining arguments).(控制台输出的字符串就是,通过把后面的参数替代占位符的位置后所输出的.)
> There is one additional substitution token available in Objective-C, %@, used to denote an object. (在OC中,可以使用一个%@来作为打印一个对象时候的占位符)At runtime, this specifier will be substituted with the result of calling either the descriptionWithLocale: method (if it exists) or the description method on the provided object.(在运行的时候,这个占位符会被调用descripttionWithLoacle:方法的输出替代.(如果这个方法存在的话.),或者是被这个对象所提供的description方法所替代.) The description method is implemented by NSObject to return the class and memory address of the object, but many Cocoa and Cocoa Touch classes override it to provide more useful information. (NSOjecte方法所实现的description方法是返回类和对象的内存地址.但是很多的Cocoa和CocoaTouch类,通过重写这个方法来提供更多的有用的信息.)In the case of NSString, the description method simply returns the string of characters that it represents.(比如,NSSring的description方法会返回字符串中的每一个字符.)> For more information about the available format specifiers for use with NSLog() and the NSString class, see String Format Specifiers in String Programming Guide .(了解更多的NSLog()格式化输出的信息和NSString类的信息,参见在<字符串编程指南>"字符串格式化"部分)
### Methods Can Return Values方法可以带返回值
As well as passing values through method parameters, it’s possible for a method to return a value. (既可以通过方法的参数传递值,也可以通过方法返回一个值.)Each method shown in this chapter so far has a return type of void.(迄今为止所介绍的方法的返回值都是void) The C void keyword means a method doesn’t return anything.(void关键字告诉方法,不会返回任何东西)
Specifying a return type of int means that the method returns a scalar integer value:(使用int作为返回值类型,意味着方法会返回一个整形数据.)
```
- (int)magicNumber;```The implementation of the method uses a C return statement to indicate the value that should be passed back after the method has finished executing, like this:(C中方法返回语句,在执行后返回改数据:)
```
- (int)magicNumber {    return 42;}```
It’s perfectly acceptable to ignore the fact that a method returns a value. (方法返回一个值是完全可以接受的.)In this case the magicNumber method doesn’t do anything useful other than return a value, but there’s nothing wrong with calling the method like this:(magicNumber方法只有一个返回值,但是这并不影响方法的调用,如下)￼```￼￼￼[someObject magicNumber];
```
If you do need to keep track of the returned value, you can declare a variable and assign it to the result of the method call, like this:(如果需要保存返回值,你可以声明一个变量,然后接收这个返回值.)
```
￼int interestingNumber = [someObject magicNumbe```
You can return objects from methods in just the same way. (可以使用同样的途径,通过方法来返回对象.)The NSString class, for example, offers an uppercaseString method:(例如,NSString类,提供了一个uppercaseSting方法)
```
- (NSString *)uppercaseString;```
It’s used in the same way as a method returning a scalar value, although you need to use a pointer to keep track of the result:(和使用返回一个标量的值的途径一样,你需要使用一个指针来保存这个返回值.)
```
NSString *testString = @"Hello, world!";NSString *revisedString = [testString uppercaseString];```
When this method call returns, revisedString will point to an NSString object representing the characters HELLO WORLD!.(当这个方法调用之后,revisedString将会指向NSString对象所代表的一个字符串@"HELLO WORLD!")remember that when implementing a method to return an object, like this:(记住,当一个方法返回一个对象的时候,)
```
- (NSString *)magicString {    NSString *stringToReturn = // create an interesting string...    return stringToReturn;}```
the string object continues to exist when it is passed as a return value even though the stringToReturn pointer goes out of scope.(字符串对象在通过stringToReturn指针返回之后,里面的内容仍然是存在的.)
There are some memory management considerations in this situation: a returned object (created on the heap) needs to exist long enough for it to be used by the original caller of the method, but not in perpetuity because that would create a memory leak. 
(在这里有一个内存管理方面的需要考虑:返回的一个对象(在heap上创建)需要在方法调用之后,仍然生存,但是又不是永久的,如果是永久的,就会造成内存泄露.)For the most part, the Automatic Reference Counting (ARC) feature of the Objective-C compiler takes care of these considerations for you.(大部分情况下,OC编译器会使用自动引用计数来为你考虑这方面的问题.)
### Objects Can Send Messages to Themselves对象可以给自己发送消息.
Whenever you’re writing a method implementation, you have access to an important hidden value, self.(当你在写一个类的实现的时候,你需要访问一个重要的隐藏的值,self.) Conceptually, self is a way to refer to “the object that’s received this message.” (在概念上,self可以被看做是一个代表接收方法的对象.)It’s a pointer, just like the greeting value above, and can be used to call a method on the current receiving object.(self是一个指针,就像在上面说的greeting值,可以用来对方法的接受者调用一个方法.)
You might decide to refactor the XYZPerson implementation by modifying the sayHello method to use the saySomething: method shown above, thereby moving the NSLog() call to a separate method.(你可能会,通过修改sayHello方法,使用saySomething:方法来对XYZPerson的实现进行重构.) This would mean you could add further methods, like sayGoodbye, that would each call through to the saySomething: method to handle the actual greeting process.(这意味着在今后,你可以通过增加方法,例如sayGoodbBye,然后在saySomething:方法中调用就可以用来处理现实的中的问候语了.) If you later wanted to display each greeting in a text field in the user interface, you’d only need to modify the saySomething: method rather than having to go through and adjust each greeting method individually.(如果以后你需要在每一个用户界面中显示一个问候的文本框,你只需要修改saySomething:方法,而不是对每一个greeting方法分别修改.)
The new implementation using self to call a message on the current object would look like this:(新实现的 使用self来对当前对象发送一个消息的例子如下)```
@implementation XYZPerson- (void)sayHello {    [self saySomething:@"Hello, world!"];}- (void)saySomething:(NSString *)greeting {    NSLog(@"%@", greeting);} @end```
If you sent an XYZPerson object the sayHello message for this updated implementation, the effective program flow would be as shown in Figure 2-2 (page 31).(如果你对一个XYZPerson对象发送sayHello消息,实际上程序流程图如图所示.)
### Objects Can Call Methods Implemented by Their Superclasses 对象可以调用父类的方法
There’s another important keyword available to you in Objective-C, called super. (在OC中另外的一个重要的关键字是super)Sending a message to super is a way to call through to a method implementation defined by a superclass further up the inheritance chain.(使用super可以调用父类,以及继承链上的方法.) The most common use of super is when overriding a method.(supper最常用的一个地方是重写方法的时候使用.)
Let’s say you want to create a new type of person class, a “shouting person” class, where every greeting is displayed using capital letters. (假设我们创建一个新的人的类,叫做shoutingperson类,在类里面显示大写字母.)You could duplicate the entire XYZPerson class and modify each string in each method to be uppercase, but the simplest way would be to create a new class that inherits from XYZPerson, and just override the saySomething: method so that it displays the greeting in uppercase, like this:(你可以将整个XYZPerson类复制,然后修改字符串,让它大写,不过呢,最简便的方法当然是使用继承创建一个新类,然后重写saySomething:方法让它显示大写的问候字符串,就像这酱紫:)```
@interface XYZShoutingPerson : XYZPerson@end
```

```
 @implementation XYZShoutingPerson  - (void)saySomething:(NSString *)greeting {      NSString *uppercaseGreeting = [greeting uppercaseString];      NSLog(@"%@", uppercaseGreeting);} @end
```This example declares an extra string pointer, uppercaseGreeting and assigns it the value returned from sending the original greeting object the uppercaseString message. (这里例子中声明了一个额外的指针来接收greeting调用uppercaseString方法后的返回值.)As you saw earlier, this will be a new string object built by converting each character in the original string to uppercase.(正如前面所讲的,会返回一个新的字符串,新的字符串内容是把原有的字符串每个字符大写后构成的字符串.)
Because sayHello is implemented by XYZPerson, and XYZShoutingPerson is set to inherit from XYZPerson, you can call sayHello on an XYZShoutingPerson object as well.(由于XYZPerson实现了sayHello方法,XYZShoutingPerson继承自XYZPerson,所以,XYZShoutingPerson对象也可以调用sayHello方法.) When you call sayHello on an XYZShoutingPerson, the call to [self saySomething:...] will use the overridden implementation and display the greeting as uppercase, resulting in the effective program flow shown in Figure 2-3 (page 32).(当XYZShoutingPerson对象调用sayHello方法的时候,"[self saySomething:]"会使用重写的方法,然后显示大写的问候语,实际上的程序流程图就是这酱紫.)
The new implementation isn’t ideal, however, because if you did decide later to modify the XYZPerson implementation of saySomething: to display the greeting in a user interface element rather than through NSLog(), you’d need to modify the XYZShoutingPerson implementation as well.(新的实现的方法也不是完美的,因为如果以后想让XYZPeron类的saySometing:方法在用户界面显示问候语,而不是通过NSLog()方法,这样你**还需要**修改XYZShoutingPeron类的实现.)
A better idea would be to change the XYZShoutingPerson version of saySomething: to call through to the superclass (XYZPerson) implementation to handle the actual greeting:(更好的解决方法是修改XYZShoutingPerson中saySomething:的实现,让它去调用父类的方法来处理实际上的问候语.)
```
@implementation XYZShoutingPerson- (void)saySomething:(NSString *)greeting {    NSString *uppercaseGreeting = [greeting uppercaseString];    [super saySomething:uppercaseGreeting];}@end```The effective program flow that now results from sending an XYZShoutingPerson object the sayHello message is shown in Figure 2-4 (page 34).(向XYZShoutingPeron对象发送sayHello消息的实际上程序的流程图如下.)
￼## Objects Are Created Dynamically对象是动态创建的
As described earlier in this chapter, memory is allocated dynamically for an Objective-C object.(前面的章节已经说过了,对对象来说,内存是动态分配的.) The first step in creating an object is to make sure enough memory is allocated not only for the properties defined by an object’s class, but also the properties defined on each of the superclasses in its inheritance chain.(对象创建的时候,就会给对象的属性和对象的(直接/间接)父类中属性分配足够的空间.)
The NSObject root class provides a class method, alloc, which handles this process for you:(NSObject根类提供了alloc方法来处理分配空间的事情.)
```
￼+ (id)alloc;```
Notice that the return type of this method is id.(注意到alloc方法的返回值是一个id类型的.) This is a special keyword used in Objective-C to mean “some kind of object.” (这是OC里的一个特殊的关键字,意思是说"某种类型的对象".)It is a pointer to an object, like (NSObject *), but is special in that it doesn’t use an asterisk.(id是指向一个对象的指针,就像(NSObject * )一样,但是,特别之处在于id不需要使用星号.) It’s described in more detail later in this chapter, in Objective-C Is a Dynamic Language (page 38).(在后面的章节"OC是一门动态语言"里详细描述.)
The alloc method has one other important task, which is to clear out the memory allocated for the object’s properties by setting them to zero. (**alloc方法有另外的一个重要任务,就是通过设置为0,把分配给对象属性的空间清除.**)This avoids the usual problem of memory containing garbage from whatever was stored before, but is not enough to initialize an object completely.(这样就避免了内存垃圾问题(不需要去管以前这块空间存储的是什么.),但是对象的初始化工作并没有完全完成.)
You need to combine a call to alloc with a call to init, another NSObject method:(调用alloc方法的同时,还需要调用NSOjbect的另外一个方法:init方法)
The init method is used by a class to make sure its properties have suitable initial values at creation, and is covered in more detail in the next chapter.(类使用init方法来让它的属性都有一个合适的初始化值,这将在下章详细阐述.)
Note that init also returns an id.(注意到,init方法的返回值也是一个id类型)
```
￼￼￼￼- (id)init;```
If one method returns an object pointer, it’s possible to nest the call to that method as the receiver in a call to another method, thereby combining multiple message calls in one statement.(如果一个方法返回一个对象指针,那么就可以使用嵌套调用,把对象指针作为另外一个方法的接收器,这就是在一个语句里使用多个消息调用.) The correct way to allocate and initialize an object is to nest the alloc call inside the call to init, like this:(正确的方法来分配空间和初始化对象的方法是,在init方法里嵌套使用alloc方法,如下)
```
NSObject *newObject = [[NSObject alloc] init];```
This example sets the newObject variable to point to a newly created NSObject instance.(这个例子里,创建了一个新的NSObjec类的实例,并让newObject指向了这个实例.)
The innermost call is carried out first, so the NSObject class is sent the alloc method, which returns a newly allocated NSObject instance. (最内层的代调用第一实施,因此,NSObject类调用了alloc方法,返回了新生成的一个NSObject类实例.)This returned object is then used as the receiver of the init message, which itself returns the object back to be assigned to the newObject pointer, as shown in Figure 2-5 (page 35).(alloc方法返回的实例作为init消息的接受者,最后init方法返回的对象被分配给了newObject指针.如图2-5)

> Note: It’s possible for init to return a different object than was created by alloc,so it’s best practice to nest the calls as shown.(注意:**init方法肯能会返回一个与通过alloc方法返回的,不同对象,因此,最好的方法使用上面的嵌套调用.**)> Never initialize an object without reassigning any pointer to that object. (**不要初始化一个(没有任何指针指向该对象的)对象.**)As an example, don’t do this:(也就是不要这样做:)
>> ```
> NSObject *someObject = [NSObject alloc];> [someObject init];> ```>> If the call to init returns some other object, you’ll be left with a pointer to the object that was originally allocated but never initialized.(如果调用对某个对象调用init方法,你会得到一个(分配了空间,但是没有初始化的)对象)
###  Initializer Methods Can Take Arguments初始化方法可以带参数
Some objects need to be initialized with required values. (一些对象需要被初始化为指定的值.)An NSNumber object, for example, must be created with the numeric value it needs to represent.(例如,一个NSNumbr对象,需要在创建的时候就指定它所代表的值.)
The NSNumber class defines several initializers, including:(NSNumber对象定义了几个初始化发方法,包括:)

```- (id)initWithBool:(BOOL)value;- (id)initWithFloat:(float)value;- (id)initWithInt:(int)value;- (id)initWithLong:(long)value;```
Initialization methods with arguments are called in just the same way as plain init methods—an NSNumber object is allocated and initialized like this:(带参数的初始化方法的调用就像一般的初始化方法一样,一个NSNumber对象的内存分配和初始化就是这酱紫的:)￼￼￼```
NSNumber *magicNumber = [[NSNumber alloc] initWithInt:42];```


### Class Factory Methods Are an Alternative to Allocation and Initialization
(类的工厂方法也是一个分配内存和初始化的替代方法.)As mentioned in the previous chapter, a class can also define factory methods. (前面提到了,**类可以定义工厂方法**(**就是使用类工具方法来创建一个对象**))Factory methods offer an alternative to the traditional alloc] init] process, without the need to nest two methods.(工厂方法可以提供传统的 alloc]init]过程,没有两个方法的嵌套.)The NSNumber class defines several class factory methods to match its initializers, including:(NSNumber类定义了几个工厂方法(类中的工具方法)来匹配自己的初始化过程,包括)
```
+ (NSNumber *)numberWithBool:(BOOL)value;+ (NSNumber *)numberWithFloat:(float)value;+ (NSNumber *)numberWithInt:(int)value;+ (NSNumber *)numberWithLong:(long)value;``
A factory method is used like this:(一个工厂方法像这样使用:)

```
NSNumber *magicNumber = [NSNumber numberWithInt:42];
```

This is effectively the same as the previous example using alloc] initWithInt:]. (这和前面的例子中使用alloc]initWithInit:]方法一样简洁有效.)Class factory methods usually just call straight through to alloc and the relevant init method, and are provided for convenience.(**类的工厂方法通常直接调用alloc和相关的init方法,使用类的工厂方法会更加简便.**)
### Use new to Create an Object If No Arguments Are Needed for Initialization

如果初始化对象不需要参数,可以使用new方法
It’s also possible to create an instance of a class using the new class method. (也可以使用new方法来创建一个类的实例.)This method is provided by NSObject and doesn’t need to be overridden in your own subclasses.(new方法由NSObject提供,并且不需要在子类中重写.)
It’s effectively the same as calling alloc and init with no arguments:(使用alloc和不带参数的init方法,与使用new方法是一样的简洁有效.)
```
XYZObject *object = [XYZObject new];// is effectively the same as:XYZObject *object = [[XYZObject alloc] init];```
###Literals Offer a Concise Object-Creation Syntax(简洁的对象创建的语言:直接使用字符串)
Some classes allow you to use a more concise, literal syntax to create instances.(一些类提供了一些简洁的方法来创建类实例.)
You can create an NSString instance, for example, using a special literal notation, like this:(可以像这样创建一个字符串:)

```
NSString *someString = @"Hello, World!";
```
This is effectively the same as allocating and initializing an NSString or using one of its class factory methods:(你也可以使用alloc,init方法,或者是使用一个这个类的工厂方法:)

```
NSString *someString = [NSString stringWithCString:"Hello, World!"                                          encoding:NSUTF8StringEncoding];
```
The NSNumber class also allows a variety of literals:(NSNumber类也提供了简洁的方法来创建其对象) 

```
NSNumber *myBOOL = @YES;NSNumber *myFloat = @3.14f;
NSNumber *myInt = @42;NSNumber *myLong = @42L;```

Again, each of these examples is effectively the same as using the relevant initializer or a class factory method. (你可以使用相关的类工厂方法来创建这些对象.)
You can also create an NSNumber using a boxed expression, like this:(你也可以像这样使用一个组合表达式来创建一个NSNumber:)
```
NSNumber *myInt = @(84 / 2);```
In this case, the expression is evaluated, and an NSNumber instance created with the result.(在这个例子中,会过根据表达式结果来创建一个NSNumber对象.)
Objective-C also supports literals to create immutable NSArray and NSDictionary objects; these are discussedfurther in Values and Collections (page 85).(OC里也支持NSArray和NSDIctionary对象的一个简便的创建,这些将会在后面的"值和集合"里讨论)
## Objective-C Is a Dynamic Language OC是一门动态的语言
As mentioned earlier, you need to use a pointer to keep track of an object in memory.(前面提到了,**需要使用指针来保存,记录,追踪一个对象在内存中的值**) Because of Objective-C’s dynamic nature, it doesn’t matter what specific class type you use for that pointer—the correct method will always be called on the relevant object when you send it a message.(**因为OC的动态特性,不要指定指针的具体类型,当对象调用某个方法的时候,正确的方法就会被调用.**)
The id type defines a generic object pointer.(id类型定义了一个通用的对象指针.) It’s possible to use id when declaring a variable, but you lose compile -time information about the object.(在**声明一个变量的时候,可以使用id类型,但是丢失了对象在编译的时刻信息**)
Consider the following code:(考虑下面的代码)``
id someObject = @"Hello, World!";[someObject removeAllObjects];``
In this case, someObject will point to an NSString instance, but the compiler knows nothing about that instance beyond the fact that it’s some kind of object.(在这个例子中,someObject将会指向一个NSSting类实例,但是编译器除了知道这是某种类型的对象之外,其他的啥也不知道.) The removeAllObjects message is defined by some Cocoa or Cocoa Touch objects (such as NSMutableArray) so the compiler doesn’t complain, even though this code would generate an exception at runtime because an NSString object can’t respond to removeAllObjects.(removeAllObjects方法被一些Cocoa和CocoaTouch对象所定义(例如NSMutableArray),因为编译器不会报错,尽管这段代码在运行的时刻会产生一个异常,因为NSString对象不会响应removeAllObjects对象.)
Rewriting the code to use a static type:(使用静态类型重写上面的代码)
```
NSString *someObject = @"Hello, World!";[someObject removeAllObjects];```means that the compiler will now generate an error because removeAllObjects is not declared in any public NSString interface that it knows about.(这个时候,编译器就报错了,因为编译器知道,NSString类接口里(包括承来的方法)并没有remvoeAllObjects方法.)
Because the class of an object is determined at runtime, it makes no difference what type you assign a variable when creating or working with an instance. (**因为一个对象的类是在运行的时候决定的,所以,当你创建一个对象后,使用什么类型来保存这个对象就无所谓了**)To use the XYZPerson and XYZShoutingPerson classes described earlier in this chapter, you might use the following code:(使用上面的XYZPerson和XYZShoutingPeron类,就是这样的:)

```
XYZPerson *firstPerson = [[XYZPerson alloc] init];XYZPerson *secondPerson = [[XYZShoutingPerson alloc] init];[firstPerson sayHello];[secondPerson sayHello];
```
Although both firstPerson and secondPerson are statically typed as XYZPerson objects, secondPerson will point, at runtime , to an XYZShoutingPerson object. (尽管firstPerson和secondPerson被静态的指定为了XYZPerson对象,但是,在允许的时候,secondePerson将会指向XYZShoutingPerson对象.)When the sayHello method is called on each object, the correct implementations will be used; for secondPerson, this means the XYZShoutingPerson version.(在调用sayHello方法的时候,方法会被正确的调用,对secondPerson对象而言,会使用XYZShoutingPerson的方法.)
###Determining Equality of Objects判断对象是否相等
If you need to determine whether one object is the same as another object, it’s important to remember that you’re working with pointers.(如果需要判断2个对象是否相等,需要记住的就是和你打交道的是指针.)
The standard C equality operator == is used to test equality between the values of two variables, like this:(标准C使用==来判断2个变量的值是否相等,如下)
```
if (someInteger == 42) {    // someInteger has the value 42}```
When dealing with objects, the == operator is used to test whether two separate pointers are pointing to the same object:(**当和对象打交道的时候,==操作用于判断2个指针是否指向的是同一个对象.**)

```
if (firstPerson == secondPerson) {    // firstPerson is the same object as secondPerson}
```If you need to test whether two objects represent the same data, you need to call a method like isEqual:, available from NSObject:(**如果你需要判断2个对象是否代表相同的数据,需要调用类似isEqual:方法来比较**)
```
if ([firstPerson isEqual:secondPerson]) {    // firstPerson is identical to secondPerson}```If you need to compare whether one object represents a greater or lesser value than another object, you can’t use the standard C comparison operators > and <.(**当你需要比较2个对象所代表的值的大小的到时候,不能使用C里的比较符.**) Instead, the basic Foundation types, like NSNumber, NSString and NSDate, provide a compare: method:(**你需要使用的是基础的框架类型的比较方法,例如NSNumber,NSSting,NSDate都提供了compare:方法来比较大小.**)
```
if ([someDate compare:anotherDate] == NSOrderedAscending) {    // someDate is earlier than anotherDate}```### Working with nil使用nil
It’s always a good idea to initialize scalar variables at the time you declare them, otherwise their initial values will contain garbage from the previous stack contents:(在声明变量的时候,对其进行初始化是个很好的方法,否则变量的初始值可能就是之前堆里的垃圾内容.)

```
BOOL success = NO;int magicNumber = 42;```
This isn’t necessary for object pointers, because the compiler will automatically set the variable to nil if you don’t specify any other initial value:(**对于对象指针,则不要进行上面的手动初始化,因为如果你不指定指针的指向的话,编译器会自动将指针变量的值赋值为nil**)
```
XYZPerson *somePerson;// somePerson is automatically set to nil```A nil value is the safest way to initialize an object pointer if you don’t have another value to use, because it’s perfectly acceptable in Objective-C to send a message to nil.(如果不给指针具体的指向,那么nil值对于指针来说是一个很安全的初始化方法.**因为在OC中,给nil发送消息是完全可以接受的.**) If you do send a message to nil, obviously nothing happens.(如果给nil传递消息,显然什么也不会发生.)

> Note:
>>  If you expect a return value from a message sent to nil,the return value will be nil for object return types, 0 for numeric types, and NO for BOOL types. (**如果想得到给nil传递消息的返回值,对于对象来说会是一个nil,对于数值类型,会是0,对于bool类型会是NO.**)Returned structures have all members initialized to zero.(**返回的是结构体的话,所有的成员变量都会被初始化为零**)
If you need to check to make sure an object is not nil (that a variable points to an object in memory), you can either use the standard C inequality operator:(如果需要检查一个对象是否为nil,可以是使用标准c的不等于操作符)
```
if (somePerson != nil) {    // somePerson points to an object}```

or simply supply the variable:(或者是仅仅使用变量)

```
if (somePerson) {    // somePerson points to an object}
```

If the somePerson variable is nil, its logical value is 0 (false). If it has an address, it’s not zero, so evaluates as true.(如果somePerson变量是nil,那么逻辑值就是0(false),如果它有值,也就是不为零,那么表达式为真.)



Similarly, if you need to check for a nil variable, you can either use the equality operator:(类似的,如果需要检查一个变量是否为nil,可以使用等号操作符)

```
if (somePerson == nil) {    // somePerson does not point to an object}
```
or just use the C logical negation operator:(或者仅仅使用C中的逻辑非)
```
if (!somePerson) {    // somePerson does not point to an object}```