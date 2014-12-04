# Encapsulating Data封装数据
In addition to the messaging behavior covered in the previous chapter, an object also encapsulates data through its properties.(除了之前章节介绍的**信息传递的特性,一个对象还有的作用就是通过它的属性来封装数据.**)

This chapter describes the Objective-C syntax used to declare properties for an object and explains how those properties are implemented by default through synthesis of accessor methods and instance variables.(这章节描述了怎么通过OC的语法来声明一个对象的属性,怎么实现这些属性的存储器方法和实例变量.) If a property is backed by an instance variable, that variable must be set correctly in any initialization methods.(如果一个属性存储在一个实例变量中,那么这个实例的变量必须通过初始化方法,正确的做好初始化工作.)
If an object needs to maintain a link to another object through a property, it’s important to consider the nature of the relationship between the two objects. (**如果一个对象通过一个指针保存了另外一个对象的,就需要去认真考虑这两个对象之间的关系**)Although memory management for Objective-C objects is mostly handled for you through Automatic Reference Counting (ARC), it’s important to know how to avoid problems like strong reference cycles, which lead to memory leaks. (尽管OC对象大多是时候可以通过ARC来实现内存管理,但是,必须知道**怎么样来避免像使用强引用循环而导致的内存泄露出现**)This chapter explains the lifecycle of an object, and describes how to think in terms of managing your graph of objects through relationships.(这章描述了对象的生存周期,讲解了关于怎么处理对象之间的关系.)
#  Properties Encapsulate an Object’s Values属性封装了对象的值
Most objects need to keep track of information in order to perform their tasks. (大多数的对象需要通过保存信息来完成它们的任务.)Some objects are designed to model one or more values, such as a Cocoa NSNumber class to hold a numeric value or a custom XYZPerson class to model a person with a first and last name. (一个对象设计出来就是未来抽象出一个或者更多的值,例如NSNumber类抽象出来是为了保存一个数值,一个自定义的XYZPerson类抽象出来,是为了保存一个人的姓,名.)Some objects are more general in scope, perhaps handling the interaction between a user interface and the information it displays, but even these objects need to keep track of user interface elements or the related model objects.(更一般的情况是,一些对象用于处理一个用户界面和信息显示之间的交互,这也需要保存用户界面元素或者与之相关的对象的信息.)
## Declare Public Properties for Exposed Data(声明公共的属性以暴露数据提供外部访问)
Objective-C properties offer a way to define the information that a class is intended to encapsulate.(OC的属性提供了一个方便的方法供类来封装数据) As you saw in Properties Control Access to an Object’s Values (page 15), property declarations are included in the interface for a class, like this:(如你在"属性控制了对对对象值的访问"看到的,属性在类中的声明如下:)
```
@interface XYZPerson : NSObject@property NSString *firstName;@property NSString *lastName;@end```
In this example, the XYZPerson class declares string properties to hold a person’s first and last name.(在这个例子中,XYZPerson类声明了字符串属性来保存一个人的姓名.)
Given that one of the primary principles in object-oriented programming is that an object should hide its internal workings behind its public interface, it’s important to access an object’s properties using behavior exposed by the object rather than trying to gain access to the internal values directly.(**面向对象编程的一个很基本的原则就是,一个对象应该对外部公开接口,隐藏其内部属性,通过对象提供的的方法来访问内部数据,而不是直接访问内部数据.**)
##Use Accessor Methods to Get or Set Property Values使用存取器方法来得到或者设置属性值
You access or set an object’s properties via accessor methods:(可以使用存取器方法来访问和设置一个对象属性的值.)
```
NSString *firstName = [somePerson firstName];[somePerson setFirstName:@"Johnny"];```
By default, these accessor methods are synthesized automatically for you by the compiler, so you don’t need to do anything other than declare the property using @property in the class interface.(默认的情况下,通过使用在类接口里使用@property声明属性就可以了,编译器就会自动生成存取器方法)The synthesized methods follow specific naming conventions:(自动生成的方法遵循下面的命名约定.))- The method used to access the value (the getter method) has the same name as the property. The getter method for a property called firstName will also be called firstName.(getter方法的名称和属性的名称一样.例如,firstName属性的getter方法名称就是firstName)
- The method used to set the value (the setter method) starts with the word “set” and then uses the capitalized property name.(setter方法名称会以set开头,然后使用属性的每个单词第一个字母大写的方法.)
- The setter method for a property called firstName will be called setFirstName:.(firstName属性的setter方法的名称就是setFirstName:)If you don’t want to allow a property to be changed via a setter method, you can add an attribute to a property declaration to specify that it should be readonly:(**如果不想通过setter方法来修改一个属性的值,可以添加一个readonly来修饰这个属性**)
```
￼@property (readonly) NSString *fullName;```As well as showing other objects how they are supposed to interact with the property, attributes also tell the compiler how to synthesize the relevant accessor methods.(和之前显示的,其他对象是如何与属性交互的,属性告诉编译器怎么样合成相关的存取器方法.)
In this case, the compiler will synthesize a fullName getter method, but not a setFullName: method.(使用readonly之后,编译器会自动合成一个fullName属性的getter方法,但是不会生成setFullName:方法)
> Note:
>>  The opposite of readonly is readwrite. There’s no need to specify the readwrite attribute explicitly, because it is the default.(注意,与readonly相反的是readwrite,但是没有必要显式的指定一个属性为readwrite,因为这是默认的属性修饰.)
If you want to use a different name for an accessor method, it’s possible to specify a custom name by adding attributes to the property. (**如果想给存取器方法取一个不同的名称,可以通过给属性增加一个自定名称的修饰符.**)In the case of Boolean properties (properties that have a YES or NO value), it’s customary for the getter method to start with the word “is.” (在布尔类型的属性,自定义的getter方法是以is开头.)The getter method for a property called finished, for example, should be called isFinished.(例如,如果属性名称为finished,那么,getter方法的名称就会是isFinished)
Again, it’s possible to add an attribute on the property:(可以给属性增加修饰符)
```
￼￼@property (getter=isFinished) BOOL finished;```
If you need to specify multiple attributes, simply include them as a comma-separated list, like this:(如果需要指定多个修饰符,只需要在之间使用逗号分割就行了)```
￼￼@property (readonly, getter=isFinished) BOOL finished;```In this case, the compiler will synthesize only an isFinished method, but not a setFinished: method. (上面的代码,编译器仅仅会自动合成一个isFinished方法,因为指定了readonly,所以没有setFinished:方法.)

> Note: 
> In general,property accessor methods should be Key Value Coding(KVC)compliant,which means that they follow explicit naming conventions.(总的来说,属性存取器方法应该遵循key-value编码,也就是说严格的遵循约定.)
See Key-Value Coding Programming Guide for more information.(参考"键值对编程指南")

## Dot Syntax Is a Concise Alternative to Accessor Method Calls 点语法是存取器方法一个简便的替代方法.

As well as making explicit accessor method calls, Objective-C offers an alternative dot syntax to access an object’s properties.(除了使用清晰的存取器方法,OC提供了点语法来访问一个对象的属性.)
Dot syntax is purely a convenient wrapper around accessor method calls. (**点语法仅仅是对存取器方法的一个简单的包装.**)When you use dot syntax, the property is still accessed or changed using the getter and setter methods mentioned above:(当使用点语法的时候,属性还是通过getter方法来访问,通过setter方法来修改.)- Getting a value using somePerson.firstName is the same as using [somePerson firstName](使用somePerson.firstName和使用[somePerson firstName]得到值都是一样的.)
- Setting a value using somePerson.firstName = @"Johnny" is the same as using [somePerson setFirstName:@"Johnny"](使用somePerson.firstName = @"Johnny"和使用[somePerson setFirstName:@"Johnny"]是一样的)
This means that property access via dot syntax is also controlled by the property attributes. (这意味着通过点语法访问属性也被@property的修饰符所限制.)If a property is marked readonly, you’ll get a compiler error if you try to set it using dot syntax.(如果一个属性被设置为readonly,当你视图通过点语法设置对象的值的时候,编译器就会报错.)
# Most Properties Are Backed by Instance Variables(大多数的属性被保存在实例变量中)
By default, a readwrite property will be backed by an instance variable, which will again be synthesized automatically by the compiler.(默认情况下,可读可写的属性保存在一个实例变量之中,使用@property的时候,编译器会自动合成这个实例变量)
An instance variable is a variable that exists and holds its value for the life of the object.(**实例变量在对象的生存周期内存在,保存值.**))The memory used for instance variables is allocated when the object is first created (through alloc), and freed when the object is deallocated.(当对象在通过alloc方法生成的时候,实例变量就被分配了存储空间,当对象被deallocte的时候,实例变量也被释放.)
Unless you specify otherwise, the synthesized instance variable has the same name as the property, but with an underscore prefix. (除非自己指定实例变量的名称,否则自动生成的实例变量和属性的名字一样,并且带有一个下划线.)For a property called firstName, for example, the synthesized instance variable will be called _firstName.(例如,对于一个名为firstName的属性,自动生成的实例变量叫做_firstName)

Although it’s best practice for an object to access its own properties using accessor methods or dot syntax, it’s possible to access the instance variable directly from any of the instance methods in a class implementation. (在实际应用中最好的方法是通过使用存取器方法或者点语法来访问自己的属性,在实例方法中也可以访问这些实例变量.)The underscore prefix makes it clear that you’re accessing an instance variable rather than, for example, a local variable:(**通过使用下划线,可以更加清晰的看到,使用的是实例变量而不是使用的局部变量**)
```
- (void)someMethod {    NSString *myString = @"An interesting string";    _someString = myString;}```
In this example, it’s clear that myString is a local variable and _someString is an instance variable.(在这个例子中,可以清楚的看到myString是一个i饿局部变量,_someString是一个实例变量)In general, you should use accessor methods or dot syntax for property access even if you’re accessing an object’s properties from within its own implementation, in which case you should use self:(一般的话,**应该使用存取器方法或者点语法来访问一个属性,即使是在本类的实现之中也应如此.在本类之中就需要使用到self**)
```
- (void)someMethod {    NSString *myString = @"An interesting string";    self.someString = myString;  // or    [self setSomeString:myString];}```
The exception to this rule is when writing initialization, deallocation or custom accessor methods, as described later in this section.(**上面的规则的例外是在初始化,dealloc或者自定义的存取器方法中,在下一节会讨论这个问题.**)### You Can Customize Synthesized Instance Variable Names(可以自定义实例变量的名称)
As mentioned earlier, the default behavior for a writeable property is to use an instance variable called _propertyName.(前面提到了,默认的可写的属性会使用名为_property的实例))
If you wish to use a different name for the instance variable, you need to direct the compiler to synthesize the variable using the following syntax in your implementation:(如果需要使用不同的实例名称,可以通过下面的语法告诉编译器:)

```
@implementation YourClass@synthesize propertyName = instanceVariableName;...@end
```For example:(例如)
```
@synthesize firstName = ivar_firstName;```In this case, the property will still be called firstName, and be accessible through firstName and setFirstName: accessor methods or dot syntax, but it will be backed by an instance variable called ivar_firstName.(**在这个例子中,属性名为firstName,可以通过firstName和setFirstName:存取器方法或者点语法来访问,但是值被存储在名为ivar_firstName的实例变量之中.**)> Important: 
>> If you use @synthesize without specifying an instance variable name,like this:(**如果只提供了属性名称,没有指定实例变量名称,那么实例变量将会和属性是同一个名字,并且没有下划线.**)
>> ```>> synthesize firstName;
>> ```>> the instance variable will bear the same name as the property.>> In this example, the instance variable will also be called firstName, without an underscore.### You Can Define Instance Variables without Properties也定义没有属性的实例变量
It’s best practice to use a property on an object any time you need to keep track of a value or another object.(实际中,最好使用一个对象的属性来保存一个值或者是另外的一个对象.)
If you do need to define your own instance variables without declaring a property, you can add them inside braces at the top of the class interface or implementation, like this:(如果需要定义一个没有实例变量的属性,你可以在类的接口声明中的大括号里添加实例变量)
```
@interface SomeClass : NSObject {
    NSString *_myNonPropertyInstanceVariable;  }... 
@end  @implementation SomeClass {      NSString *_anotherCustomInstanceVariable;} ... @end```> Note: 
>> You can also add instance variables at the top of a class extension, as described in Class Extensions Extend the Internal Implementation (page 72).(**另外的一个方法是在类扩充的时候,添加实例变量,这会在"内部实现的类扩充"**)
## Access Instance Variables Directly from Initializer Methods在初始化方法内直接使用实例变量
Setter methods can have additional side-effects. They may trigger KVC notifications, or perform further tasks if you write your own custom methods.(**setter方法有一个负面的影响,在实现我们的自定义方法的时候,可能会导致KVC提示(键值对编码)**)
You should always access the instance variables directly from within an initialization method because at the time a property is set, the rest of the object may not yet be completely initialized. (**在初始化方法内部,应该使用实例变量,因为这个时候属性才被赋值,其他的一些对象可能还没有被完全赋值.**)Even if you don’t provide custom accessor methods or know of any side effects from within your own class, a future subclass may very well override the behavior.(如果你不提供自定义的存取器方法,并且知道在内部使用的副作用,那么在以后的子类中,就需要重写方法.)A typical init method looks like this:(典型的一个init方法肯能会像这样子)
```
- (id)init {    self = [super init];    if (self) {        // initialize instance variables here}    return self;}```

An init method should assign self to the result of calling the superclass’s initialization method before doing its own initialization.(**在初始化方法内,在对本类初始化之前,调用父类的初始化方法之后的返回值必须赋值给self.**)) A superclass may fail to initialize the object correctly and return nil so you should always check to make sure self is not nil before performing your own initialization.(在对本类进行初始化之前,需要检查self对象是否为nil,因为父类可能会初始化失败!)
By calling [super init] as the first line in the method, an object is initialized from its root class down through each subclass init implementation in order.(第一次调用[super init]方法的时候,对象的初始化会从根类一路初始化下来.(初始化根类-->初始化间接父类-->初始化父类-->初始化本类.)) Figure 3-1 (page 49) shows the process for initializing an XYZShoutingPerson object.(图3-1显示了XYZShoutingPerson对象的初始化过程.)
As you saw in the previous chapter, an object is initialized either by calling init, or by calling a method that initializes the object with specific values.(前面的章节介绍了,一个对象的初始化要么调用的是init方法,要么调用的是带参数的初始化方法.)
In the case of the XYZPerson class, it would make sense to offer an initialization method that set the person’s initial first and last names:(在XYZPerson类中,提供一个方法初始化一个人的姓名会是个很好的习惯.)
```
- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName;```
You’d implement the method like this:(你可能会像这样来实现这个方法.)
```
- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName {      self = [super init];      if (self) {          _firstName = aFirstName;			  _lastName = aLastName;      }      return self;  }```### The Designated Initializer is the Primary Initialization Method(指定初始化方法是最主要的初始化方法.)
If an object declares one or more initialization methods, you should decide which method is the designated initializer. (当一个对象声明了很多的初始化方法的时候,就需要决定哪个才是指定的初始化方法.)This is often the method that offers the most options for initialization (such as the method with the most arguments), and is called by other methods you write for convenience. (最常见的是使用参数最多的初始化方法作为指定的初始化方法.)You should also typically override init to call your designated initializer with suitable default values.(应该带着合适的默认值来重写指定的初始化方法.)If an XYZPerson also had a property for a date of birth, the designated initializer might be:(如果一个XYZPerson还有一个生日的属性,那么指定的初始化方法可能就是:)
```
- (id)initWithFirstName:(NSString *)aFirstName 
						lastName:(NSString *)aLastName 
					dateOfBirth:(NSDate *)aDOB;```
This method would set the relevant instance variables, as shown above.(这个方法会设置相关的实例变量.) If you still wished to provide a convenience initializer for just first and last names, you would implement the method to call the designated initializer, like this:(如果仍然想只便捷的初始化姓名,那么可以使用像这样的初始化方法:)
```
- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName { 
	return [self initWithFirstName:aFirstName lastName:aLastName dateOfBirth:nil];}```
You might also implement a standard init method to provide suitable defaults:(你可能会使用标准的init方法来提供默认的值.)

```
- (id)init {    return [self initWithFirstName:@"John" lastName:@"Doe" dateOfBirth:nil];}
```

If you need to write an initialization method when subclassing a class that uses multiple init methods, you should either override the superclass’s designated initializer to perform your own initialization, or add your own additional initializer.(当子类有很多的init方法的时候,要么重写父类的指定的初始化方法,要么添加额外的初始化方法.) Either way, you should call the superclass’s designated initializer (in place of [super init];) before doing any of your own initialization.(在重写init方法的时候,在开始自己的初始化之前,应该使用[super init])

## You Can Implement Custom Accessor Methods  可以自定义存储器方法

Properties don’t always have to be backed by their own instance variables.(属性不必都保存在它们的实例变量之中)

As an example, the XYZPerson class might define a read-only property for a person’s full name:(XYZPerson类可能会定义一个只读的属性:)

```
@property (readonly) NSString *fullName;
```

Rather than having to update the fullName property every time the first or last name changed, it would be easier just to write a custom accessor method to build the full name string on request:(如果每次在姓名更新的时候,都去更改first和lastname的话,更简单的方法是使用一个自定义的存储器方法去得到全名)
```- (NSString *)fullName {    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];}```
This simple example uses a format string and specifiers (as described in the previous chapter) to build a string containing a person’s first and last names separated by a space.(这个例子中使用了字符串格式化方法将一个人的姓名用空格连接起来了)

> Note: 
> > Although this is a convenient example,it’s important to realize that it’s locale-specific,and is only suitable for use in countries that put a person’s given name before the family name.(不同国家姓名的顺序不一样,这点需要注意.)


If you need to write a custom accessor method for a property that does use an instance variable, you must access that instance variable directly from within the method.(如果需要写一个自定义的存取器方法,需要在方法内部直接使用实例变量.) For example, it’s common to delay the initialization of a property until it’s first requested, using a “lazy accessor,” like this:(例如,**经常可以看到,直到对象第一次被调用的时候,才去初始化属性,这就是懒加载**)


```
- (XYZObject *)someImportantObject {    if (!_someImportantObject) {        _someImportantObject = [[XYZObject alloc] init];    }    return _someImportantObject;}
```
Before returning the value, this method first checks whether the _someImportantObject instance variable is nil; if it is, it allocates an object.(在返回对象之前,检查对象是否为nil,如果是nil,那么就给对象分配空间,进行初始化)

>Note: 
>>The compiler will automatically synthesize an instance variable in all situations where it’s also synthesizing at least one accessor method.(编译器会在任何情况下都会自动生成存取器方法,至少是一个存取器方法.) If you implement both a getter and a setter for a readwrite property, or a getter for a readonly property, the compiler will assume that you are taking control over the property implementation and won’t synthesize an instance variable automatically.(**如果你手动生成了某个属性的setter和getter方法,编译器就会认为你自己在管理这两个方法,它就不会自动生成实例变量了.**)>> If you still need an instance variable, you’ll need to request that one be synthesized(如果你还需要一个实例变量,这个时候可以请求编译器给你生成一个)
```
@synthesize property = _property;```

## Properties Are Atomic by Default 属性默认是atomic原子的
By default, an Objective-C property is atomic:(默认情况下,属性是原子的)

```
@interface XYZObject : NSObject@property NSObject *implicitAtomicObject;          // atomic by default@property (atomic) NSObject *explicitAtomicObject; // explicitly marked atomic@end
```This means that the synthesized accessors ensure that a value is always fully retrieved by the getter method or fully set via the setter method, even if the accessors are called simultaneously from different threads.(这就意味着,通过存取器方法可以确保在使用get,set方法的时候,总是能够完全返回值,即使是通过不同的线程同时调用.)
Because the internal implementation and synchronization of atomic accessor methods is private, it’s not possible to combine a synthesized accessor with an accessor method that you implement yourself.(由于内部原子化的存取器方法的实现和合成是私有的,你可能自己来将一个生成器和生成器方法结合起来.) You’ll get a compiler warning if you try, for example, to provide a custom setter for an atomic, readwrite property but leave the compiler to synthesize the getter.(如果你尝试着去对一个原子化的属性提供一个自定义的set方法,编译器就会报错咯.)
You can use the nonatomic property attribute to specify that synthesized accessors simply set or return a value directly, with no guarantees about what happens if that same value is accessed simultaneously from different threads. (**可以使用nonatomic修饰符,这就意味着编译器生成的存取器方法仅仅是设置和返回值,并不去管在不同线程里同时访问存取器方法的情况.**)For this reason, it’s faster to access a nonatomic property than an atomic one, and it’s fine to combine a synthesized setter, for example, with your own getter implementation:(出于这个原因,访问nonatomic属性的时候,会比访问atomic的属性速度要快.这样的话,让编译器去生成set方法,自己编写get方法是可行的.)
```
@interface XYZObject : NSObject@property (nonatomic) NSObject *nonatomicObject;@end
  - (NSObject *)nonatomicObject {      return _nonatomicObject;  }  // setter will be synthesized automatically  @end
  ```


> Note: 
> > Property atomicity is not synonymous with an object’s thread safety.(注意:**属性原子化与一个对象的线程安全并不是等同的.**)> > Consider an XYZPerson object in which both a person’s first and last names are changed using atomic accessors from one thread.(假设一个XYZPerson的对象,通过一个线程来对一个人的姓名做修改.) If another thread accesses both names at the same time, the atomic getter methods will return complete strings (without crashing), but there’s no guarantee that those values will be the right names relative to each other.(如果另外的一个线程也去在这个时候访问姓名,那么原子话的get方法会返回一个完整的字符串,不会出现崩溃,但是不能保证返回的值是正确的.) If the first name is accessed before the change, but the last name is accessed after the change, you’ll end up with an inconsistent, mismatched pair of names.(如果fisrtName先被修改,latName后被修改,你就可能会得到一些不匹配的结果.)
This example is quite simple, but the problem of thread safety becomes much more complex when considered across a network of related objects. (这个例子比较简单,在考虑一系列的相关的对象的时候,线程安全就变得非常的复杂了.)Thread safety is covered in more detail in Concurrency Programming Guide .(线程安全可以在"并发性编程指南"里有更详细的描述.)
# Manage the Object Graph through Ownership and Responsibility通过所属和责任来管理对象图
As you’ve already seen, memory for Objective-C objects is allocated dynamically (on the heap), which means you need to use pointers to keep track of an object’s address.(前面已经看到了,OC对象是动态来分配内存的(在堆里),可以使用指针来保存对象的地址.) Unlike scalar values, it’s not always possible to determine an object’s lifetime by the scope of one pointer variable. Instead, an object must be kept active in memory for as long as it is needed by other objects.(不像标量值一样,通过指针变量并不能判断一个对象的生存周期.**对象必须在内存中保存足够长的时间,以便其他对象在需要的时候,能够引用到.**)
Rather than trying to worry about managing the lifecycle of each object manually, you should instead think about the relationships between objects.(关注的问题不应该是担心手动管理对象的生存周期,而应该关注的是对象之间的关系.)
In the case of an XYZPerson object, for example, the two string properties for firstName and lastName are effectively “owned” by the XYZPerson instance.(对与XYZPerson对象来说,两个字符串属性由实例所拥有.) This means they should stay in memory as long as the XYZPerson object stays in memory.(也就是说,只要XYZPerson对象在内存中存在,属性就应该保持在内存中.)
When one object relies on other objects in this way, effectively taking ownership of those other objects, the first object is said to have strong references to the other objects. (**当一个对象作为另外一个对象的属性的时候,前面的对象就对后面的对象有strong依赖.**)In Objective-C, an object is kept alive as long as it has at least one strong reference to it from another object. (在OC里,只要一个对象对另外一个对象有强依赖,那么另外的这个对象就必须在内存里存留足够长的时间.)The relationships between the XYZPerson instance and the two NSString objects is shown in Figure 3-2 (page 54).(XYZPersno实例和2个字符串对象的关系图如图3-2)
When an XYZPerson object is deallocated from memory, the two string objects will also be deallocated, assuming there aren’t any other strong references left to them.(假设没有其他的任何强依赖,当XYZPerson对象从内存中释放的时候,这两个字符串属性也会被释放.)
To add a little more complexity to this example, consider the object graph for an application like that shown in Figure 3-3 (page 55).(对于一个应用的对象图,在上面的例子中添加一个更加复杂的标题)

When the user clicks the Update button, the badge preview is updated with the relevant name information.(当用户单击更新按钮的时候,标签就显示用户相关的信息.)￼The first time a person’s details are entered and the update button clicked, the simplified object graph might look like Figure 3-4 (page 56).(当用户姓名的第一次被输入后,点击按钮,更新内容,简化的对象图可能如下:)

When the user modifies the person’s first name, the object graph changes to look like Figure 3-5 (page 57).(当用户修改姓名后,对象图变为下面的样子:)

The badge display view maintains a strong relationship to the original @"John" string object, even though the XYZPerson object now has a different firstName.(标记视图和原来的字符串@"John"有一个强关系.) This means the @"John" object stays in memory, used by the badge view to print the name.(这就意味着,使用标记视图来打印姓名的时候,打印的是仍然存留在内存内的@"John")Once the user clicks the Update button a second time, the badge view is told to update its internal properties to match the person object, so the object graph looks like Figure 3-6 (page 58).(一旦用户单击了更新按钮,标记视图就会更新相应的内部属性,匹配用户对象.这个时候的对象图如下.)￼￼
At this point, the original @"John" object no longer has any strong references to it, so it is removed from memory.(这个时候,原始的@"John"对象没有任何强关系了,因此它被从内存里移除.)
By default, both Objective-C properties and variables maintain strong references to their objects.(**默认情况下,OC属性和变量都会与它们的对象维持一个强关系.**.) This is fine for many situations, but it does cause a potential problem with strong reference cycles.(**在大多数的情况下都是ok的,但是这确实会到导致强关系循环引用的潜在的问题.**)
## Avoid Strong Reference Cycles避免强关系的循环引用
Although strong references work well for one-way relationships between objects, you need to be careful when working with groups of interconnected objects.(强关系引用对于两个对象之间单向的关系可以很好适应.在处理多个相互之间有联系的对象的时候,需要小心处理.) If a group of objects is connected by a circle of strong relationships, they keep each other alive even if there are no strong references from outside the group.(**在一组对象之间,如果存在强关系的循环引用,这就会导致即使外部没有任何的强关系引用,组内有强关系循环引用的对象会一直存留在内存之中.**)
One obvious example of a potential reference cycle exists between a table view object (UITableView for iOS and NSTableView for OS X) and its delegate. (一个典型的强关系循环引用的例子就是一个tableView和它的代理之间.)In order for a generic table view class to be useful in multiple situations, it delegates some decisions to external objects.(为了让一个通用的表格视图类能够在多种情形下使用,这个表格视图类会代理一些外部类的决定.) This means it relies on another object to decide what content it displays, or what to do if the user interacts with a specific entry in the table view.(也就是说,表格视图类依赖于另外的一个对象来决自身 显示什么,换句话说,需要根据用户对表格视图的交互来显示具体的内容.)
A problem occurs if the other objects give up their strong relationships to the table view and delegate, as shown in Figure 3-8 (page 59).(如果其他对象放弃了对表格对象和它们的代理的强引用,这时候问题就出现了.)
Even though there is no need for the objects to be kept in memory—there are no strong relationships to the table view or delegate other than the relationships between the two objects—the two remaining strong relationships keep the two objects alive. (**即使这两个对象没有必要存在在内存里,并且除了表格视图和它的代理之间的强关系之外,没有其他强关系与这两个对象有关系.**)This is known as a strong reference cycle.(这就是所说的强关系循环引用.)
The way to solve this problem is to substitute one of the strong references for a weak reference.(解决这问题的一个方法是替换其中的一个强关系引用替换为弱关系引用.) A weak reference does not imply ownership or responsibility between two objects, and does not keep an object alive.(一个弱关系引用并不暗含了两个对象之间的拥有,责任关系,不会一直对象保持在内存中.)
If the table view is modified to use a weak relationship to its delegate (which is how UITableView and NSTableView solve this problem), the initial object graph now looks like Figure 3-9 (page 60).(如果表格视图修改之后,对它的代理使用弱关系(这就是UITableView和NSTableView怎么解决这个问题的.),初始化对象图现在像这样子.)
When the other objects in the graph give up their strong relationships to the table view and delegate this time, there are no strong references left to the delegate object, as shown in Figure 3-10 (page 60).(当其他的对象图放弃他们与 表格视图和代理之间的关系的时候,这时候就不存在对代理对象的强关系引用.)

This means that the delegate object will be deallocated, thereby releasing the strong reference on the table view, as shown in Figure 3-11 (page 61).(因此,在释放代理对象的时候,释放对表格视图类的强关系引用的时候,如图:)
￼
Once the delegate is deallocated, there are no longer any strong references to the table view, so it too is deallocated.(一旦代理对象释放之后,就没有对表格对象强的关系引用.)
## Use Strong and Weak Declarations to Manage Ownership使用强,弱关系声明来管理对象之间的关系

By default, object properties declared like this:(默认的对象的属性声明如下)

```
@property id delegate;```

use strong references for their synthesized instance variables. (对它们生成的实例变量使用强关系引用)To declare a weak reference, add an attribute to the property, like this:(为了声明一个弱关系引用,给属性添加一个修饰符.)
```
@property (weak) id delegate;```
>Note: 
>> The opposite to weak is strong. There’s no need to specify the strong attribute explicitly, because it is the default.(注意,week的反面是strong,默认的是strong,因为没有必要显式的声明强关系的属性.)
Local variables (and non-property instance variables) also maintain strong references to objects by default. (**局部变量(飞属性实例变量)默认的情况下也和属性有强关系引用.**)This means that the following code will work exactly as you expect:

```
NSDate *originalDate = self.lastModificationDate;self.lastModificationDate = [NSDate date];NSLog(@"Last modification date changed from %@ to %@",                    originalDate, self.lastModificationDate);
```

In this example, the local variable originalDate maintains a strong reference to the initial lastModificationDate object. (在这个例子中,局部变量origianlDate维持了对lastModificationDate对象的强引用.)When the lastModificationDate property is changed, the property no longer keeps a strong reference to the original date, but that date is still kept alive by the originalDate strong variable.(当lastModificationDate改变的时候,属性就不在对原有的对象有一个强引用,但是日期值仍然保存在originalDate中.)