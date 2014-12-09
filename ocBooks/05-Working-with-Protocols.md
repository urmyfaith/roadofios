#Working with ProtocolsIn the real world, people on official business are often required to follow strict procedures when dealing with certain situations. (在现实生活的商务活动中,人们在特定的情况下通常需要遵循一些严格的步骤.)Law enforcement officials, for example, are required to “follow protocol” when making enquiries or collecting evidence.(例如,法律强制执行官方的命令,在收集犯罪证据的时候需要遵循一些协议.)
In the world of object-oriented programming, it’s important to be able to define a set of behavior that is expected of an object in a given situation. (在OO编程中,对于一些对象,很重要的就是定义一系列的行为.)As an example, a table view expects to be able to communicate with a data source object in order to find out what it is required to display. (例如,一个表格 对象就需要和其他的数据源对象来沟通,以便自身来正确的显示.)This means that the data source must respond to a specific set of messages that the table view might send.(这就意味数据源对象必须能够响应表格视图所发送的一些方法.)The data source could be an instance of any class, such as a view controller (a subclass of NSViewController on OS X or UIViewController on iOS) or a dedicated data source class that perhaps just inherits from NSObject.(数据源可能是任何一个类的实例,例如一个视图控制器,或者是专们来提供数据源的类,这个类可能仅仅继承了NSObject.) In order for the table view to know whether an object is suitable as a data source, it’s important to be able to declare that the object implements the necessary methods.(对于表格视图类来说,知道一个对象是否适合作为一个数据源,这就需要这个对象实现一些必要的方法.)Objective-C allows you to define **protocols**, which declare the methods expected to be used for a particular situation. (OC允许你定一些在特定的情况下使用的方法列表,这些方法列表可以看做是一种协议.)This chapter describes the syntax to define a formal protocol, and explains how to mark a class interface as **conforming** to a protocol, which means that the class must implement the required methods.(这章描述了定义一个标准类的一些语法,解释了怎么定义一个类接口去遵循这个协议,遵循这个协议的意思就是说这个类必须实现指定的需要实现的方法.)

## Protocols Define Messaging Contracts协议定义了消息的格式
A class interface declares the methods and properties associated with that class.(一个类包含了属性和方法.) A protocol, by contrast, is used to declare methods and properties that are independent of any specific class.(相比较的话,一个协议只声明独立于任何类的属性和方法)
The basic syntax to define a protocol looks like this:(协议的基本语法如下:)

```
@protocol ProtocolName// list of methods and properties@end
```Protocols can include declarations for both instance methods and class methods, as well as properties.(**协议能够包含实例方法,类方法和属性!!!**)
As an example, consider a custom view class that is used to display a pie chart, as shown in Figure 5-1 (page 78).(举个例子,考虑一个自定义的视图类,用来显示一个饼状图)
To make the view as reusable as possible, all decisions about the information should be left to another object, a data source.(为了尽可能的让视图可以重复使用,所有的决定信息都应该留给另外的一个对象/数据源.) This means that multiple instances of the same view class could display different information just by communicating with different sources.(这就意味着,同一个视图类的多个实例能够通过和不同的数据源沟通来显示不同的信息.)
The minimum information needed by the pie chart view includes the number of segments, the relative size of each segment, and the title of each segment.(对于个饼状图来说,至少需要知道分为几部分,每部分的相对大小,以及每部分的标题.) The pie chart’s data source protocol, therefore, might look like this:(饼状图数据源协议,可能就是想这样子的)
```Objective-c
@protocol XYZPieChartViewDataSource  - (NSUInteger)numberOfSegments;  - (CGFloat)sizeOfSegmentAtIndex:(NSUInteger)segmentIndex;  - (NSString *)titleForSegmentAtIndex:(NSUInteger)segmentIndex; @end
```
>Note:
>>  This protocol uses the NSUInteger value for unsigned integer scalar values. This type is discussed in more detail in the next chapter.(注意:这里用到了一个将会在下章讲解的NSUInteger作为一个无符号的标量值.)

The pie chart view class interface would need a property to keep track of the data source object.(饼状图类接口需要一个属性来保存这个数据源对象.) This object could be of any class, so the basic property type will be id.(这个对象可能是任意类型的类,因此基本属性类型是id) The only thing that is known about the object is that it conforms to the relevant protocol.(唯一知道的是,这个对象需要遵循相关的协议.)
The syntax to declare the data source property for the view would look like this:(一个视图类声明数据源属性的话,可能就是像这个样子)
```Objective-c
@interface XYZPieChartView : UIView@property (weak) id <XYZPieChartViewDataSource> dataSource;...@end
```

Objective-C uses angle brackets to indicate conformance to a protocol. (OC中使用尖括号来代表遵循一个协议.)This example declares a weak property for a generic object pointer that conforms to the XYZPieChartViewDataSource protocol.(上面的代码意思是对一个通用的对象指针声明了一个弱属性,并且这个对象指针遵循XYZPieChartViweDataSource协议.)
>Note:
>>Delegate and data source properties are usually marked as weak for the object graph management reasons described earlier, in Avoid Strong Reference Cycles (page 58).(一个对象的代表和数据源属性,通常是作为弱关系的.在之前的对象图管理中,避免强关系循环引用已经说明了这里为什么要使用弱关系.)
By specifying the required protocol conformance on the property, you’ll get a compiler warning if you attempt to set the property to an object that doesn’t conform to the protocol, even though the basic property class type is generic.(通过指定某个属性遵循了指定的协议,编译器这个时候会给你一个警告,这个警告说的是试图给一个不遵循协议的对象添加遵循协议的属性.) It doesn’t matter whether the object is an instance of UIViewController or NSObject. (这与对象是否是UIViewController和NSObject对象的实例无关.)All that matters is that it conforms to the protocol, which means the pie chart view knows it can request the information it needs.(重要是,遵循协议就意味着饼状图知道它能够请求所需要的信息.)
### Protocols Can Have Optional Methods 协议有可选方法
By default, all methods declared in a protocol are required methods. This means that any class that conforms to the protocol must implement those methods.(默认情况下,方法列表中所有的方法都是使用@required修饰的,这就意味着某个类只要引用了该协议,就必须实现该协议的所有方法)
It’s also possible to specify optional methods in a protocol. (也可以给协议指定一个可选的方法)These are methods that a class can implement only if it needs to.(遵循了协议的类对可选的方法可以实现,可以不实现.)
You can mark protocol methods as optional using the @optional directive, like this:(可以使用@optional来标记协议方法列表中的方法:)
```Objective-c
@protocol XYZPieChartViewDataSource- (NSUInteger)numberOfSegments;- (CGFloat)sizeOfSegmentAtIndex:(NSUInteger)segmentIndex;@optional- (NSString *)titleForSegmentAtIndex:(NSUInteger)segmentIndex;@end
```
In this case, only the titleForSegmentAtIndex: method is marked optional.( 在上面,仅仅是titleForSegmentAtIndex:方法被标为可选方法.) The previous methods have no directive, so are assumed to be required.(前面的2个方法没有标记,默认是需要实现的.)

The @optional directive applies to any methods that follow it, either until the end of the protocol definition, or until another directive is encountered, such as @required. You might add further methods to the protocol like this:(**@optional的作用域是遇到@end结束,或者是遇到下一个@required就结束了**)```Objective-c
@protocol XYZPieChartViewDataSource- (NSUInteger)numberOfSegments;- (CGFloat)sizeOfSegmentAtIndex:(NSUInteger)segmentIndex;@optional- (NSString *)titleForSegmentAtIndex:(NSUInteger)segmentIndex;- (BOOL)shouldExplodeSegmentAtIndex:(NSUInteger)segmentIndex;@required- (UIColor *)colorForSegmentAtIndex:(NSUInteger)segmentIndex;@end
```

This example defines a protocol with three required methods and two optional methods.(上面的例子定义了有三个必须实现的方法,两个可选的方法的一个协议.)

#### Check that Optional Methods Are Implemented at Runtime 可选方法在允许时刻被实现
If a method in a protocol is marked as optional, you must check whether an object implements that method before attempting to call it.(如果协议中的一个方法被标记为可选方法,那么你必须在调用这个方法之前,检查这个方法是否被实现了.)
As an example, the pie chart view might test for the segment title method like this:(举个例子,在饼状图视图类测试饼状图的每部分的标题的方法:)
```Objective-c
    NSString *thisSegmentTitle;    if ([self.dataSource respondsToSelector:@selector(titleForSegmentAtIndex:)]){        thisSegmentTitle = [self.dataSource titleForSegmentAtIndex:index];}
```

The respondsToSelector: method uses a selector, which refers to the identifier for a method after compilation. (respondsToSelector:方法是用来一个selector参数,selector参数代表了一个方法在编译后的唯一的标志符.)You can provide the correct identifier by using the @selector() directive and specifying the name of the method.(可以通过把方法名传入@selector(),这样就可以得到响应的方法.)

If the data source in this example implements the method, the title is used; otherwise, the title remains nil.(如果数据源实现 了这个方法,标题就被使用,否则title仍然为nil)
> Remember: Local object variables are automatically  initialized to nil.(注意:局部对象变量自动初始化位nil)
If you attempt to call the respondsToSelector: method on an id conforming to the protocol as it’s defined above, you’ll get a compiler error that there’s no known instance method for it. (**如果试图在一个遵循上面的方法协议的id,你就会得到一个编译错误:未知的实例方法.**)Once you qualify an id with a protocol, all static type-checking comes back; you’ll get an error if you try to call any method that isn’t defined in the specified protocol.(**让一个id遵循协议,所有的静态类型检测就会生效,在调用一个协议里没有的方法的时候,就会得到一个编译错误.**) One way to avoid the compiler error is to set the custom protocol to adopt the NSObject protocol.(**一个避免编译错误是对自定义的协议采用NSobject协议**)## Protocols Inherit from Other Protocols协议可以继承协议
In the same way that an Objective-C class can inherit from a superclass, you can also specify that one protocol conforms to another.(和OC中的类的继承一样,协议也可以来继承(遵循)另外的一个协议.)
As an example, it’s best practice to define your protocols to conform to the NSObject protocol (some of the NSObject behavior is split from its class interface into a separate protocol; the NSObject class adopts the NSObject protocol)(最好让自定义的协议去
遵守NSObject协议.(NSOject类的的一些方法接口从类中分离出来了成为了一个单独
的协议,NSOjbect类采用了NSObject协议.)).
By indicating that your own protocol conforms to the NSObject protocol, you’re indicating that any object that adopts the custom protocol will also provide implementations for each of the NSObject protocol methods.(在自定义的类中采用NSObject协议的话,采用自定义协议的类就可以去实现NSObject协议的一些方法.) Because you’re presumably using some subclass of NSObject, you don’t need to worry about providing your own implementations for these NSObject methods. (但是你不需要担心去实现NSObject类的方法)The protocol adoption is useful, however, for situations like that described above.(对于上面描述的情况下,采用NSOjbect协议是很有用的.)
To specify that one protocol conforms to another, you provide the name of the other protocol in angle brackets, like this:(一个类遵循哪些协议需要写在类声明的类名后尖括号中,多个协议的时候,使用逗号分隔:)
```Objective-c
 @protocol MyProtocol <NSObject>... @end
```

In this example, any object that adopts MyProtocol also effectively adopts all the methods declared in the NSObject protocol.(在这个例子中,任何采用了MyProtocol协议的对象,都可以使用NSObject中的方法)
## Conforming to Protocols 遵循协议
The syntax to indicate that a class adopts a protocol again uses angle brackets, like this(一个类采用协议的语法:使用尖括号)

```Objective-c
@interface MyClass : NSObject <MyProtocol>...@end
```
This means that any instance of MyClass will respond not only to the methods declared specifically in the interface, but that MyClass also provides implementations for the required methods in MyProtocol.(这样的话,MyClass类的实例就会不仅响应自己类中的方法,而且也会响应MyProtocol中的@required方法.) There’s no need to redeclare the protocol methods in the class interface—the adoption of the protocol is sufficient.(没有必要在类的接口中去声明这些方法,采用协议就够了.)
> Note: The compiler does not automatically synthesize properties declared in adopted protocols.(注意,**编译器不会自动合成采用协议中的属性声明**)If you need a class to adopt multiple protocols, you can specify them as a comma-separated list, like this:(如果你需要一个类采用多个协议,你可以使用一个逗号分隔符:)
```Objective-c
@interface MyClass : NSObject <MyProtocol, AnotherProtocol, YetAnotherProtocol>...@end
```

> Tip: If you find yourself adopting a large number of protocols in a class,it maybe asign that you need to refactor an overly-complex class by splitting the necessary behavior across multiple smaller classes, each with clearly-defined responsibilities.(如果发现自己在一个类中采用了很多的协议,可能这个时候,你就需要考虑对这个过于复杂的类进行重构,也就是把这个类中的方法分割,分组到多个小的类中,每个小的类完成自己的方法/功能.)
> One relatively common pitfall for new OS X and iOS developers is to use a single application delegate class to contain the majority of an application’s functionality (managing underlying data structures, serving the data to multiple user interface elements, as well as responding to gestures and other user interaction).(对新手来说,一个相对常见的问题是使用一个应用代表类来维护应用的大部分的功能(管理底层数据结构,对多用户界面元素提供数据,响应用户手势等互动.)) As complexity increases, the class becomes more difficult to maintain.(随着复杂程度的增加,类的管理也变得越来越难.)
Once you’ve indicated conformance to a protocol, the class must at least provide method implementations for each of the required protocol methods, as well as any optional methods you choose. (一旦使用了协议,这个类就需要实现协议中要求的方法,还有自己需要使用的可选方法.)The compiler will warn you if you fail to implement any of the required methods.(如果忘记实现了一些必须的方法,编译器就会给你一个警告.)
> Note: The method declaration in a protocol is just like any other declaration. The method name and argument types in the implementation must match the declaration in the protocol.(注意:协议中的方法声明和类声明一样.采用协议的类在实现的时候,方法名和参数的类型必须和协议中的一样(**也就说参数的名称可以不一样.**))
### Cocoa and Cocoa Touch Define a Large Number of Protocols Cocoa和CocoaTouch中定义了一大堆的协议
Protocols are used by Cocoa and Cocoa Touch objects for a variety of different situations. (在Cocoa和CocoaTouch的对象里,中,在很多情况下都使用了协议.)For example, the table view classes (NSTableView for OS X and UITableView for iOS) both use a data source object to supply them with the necessary information.(例如,表格视图类使用了一个数据源对象来提供必须的信息.) Both define their own data source protocol, which is used in much the same way as the XYZPieChartViewDataSource protocol example above.(定义各自的数据源协议,就像上面XYZPieChartViewDataSource协议一样.) Both table view classes also allow you to set a delegate object, which again must conform to the relevant NSTableViewDelegate or UITableViewDelegate protocol. (表格视图类允许设置一些代理对象,这些代理对象需要遵循相关的协议,例如:NSTableVIewDelegae,UITableViewDelegate)The delegate is responsible for dealing with user interactions, or customizing the display of certain entries.(代理负责处理和用户的交互,例如显示特定的接入点.)
Some protocols are used to indicate non-hierarchical similarities between classes.(一些协议用在没有层次关系的类之间.) Rather than being linked to specific class requirements, some protocols instead relate to more general Cocoa or Cocoa Touch communication mechanisms that may be adopted by multiple, unrelated classes.(一些协议在多个不相关的类之间被采用,用于实现框架内部的通信机制.)
For example, many framework model objects (such as the collection classes like NSArray and NSDictionary) support the NSCoding protocol, which means they can encode and decode their properties for archival or distribution as raw data.(例如,很多的框架模型对象(例如像NSArray和NSDictionary等集合类)都支持NSCoding协议,也就是可以对它们的属性通过编码和解码达到压缩和) NSCoding makes it relatively easy to write entire object graphs to disk, provided every object within the graph adopts the protocol.(对于使用了NSCoding协议的对象,可以很容易的将整个对象图写入磁盘.)
A few Objective-C language-level features also rely on protocols.(一些OC对象的语言层次上的特性也依赖于协议.) In order to use fast enumeration, for example, a collection must adopt the NSFastEnumeration protocol, as described in Fast Enumeration Makes It Easy to Enumerate a Collection (page 101). (为了使用快速列举,一个集合类必须采用NSFastEnumeration协议,采用这个协议可以快速的遍历集合.)Additionally, some objects can be copied, such as when using a property with a copy attribute as described in Copy Properties Maintain Their Own Copies (page 64).(再举个例子,一些对象可以被赋值,例如一个属性,使用了copy修饰词的时候) Any object you try to copy must adopt the NSCopying protocol, otherwise you’ll get a runtime exception.(任何试图copy的对象都需要采用NSCopying协议,不然的话就会得到一个运行时异常.)
## Protocols Are Used for Anonymity 匿名协议的使用
Protocols are also useful in situations where the class of an object isn’t known, or needs to stay hidden.(协议也在用于不知道对类的情况或者是需要隐藏对象的类的情况下.)
As an example, the developer of a framework may choose not to publish the interface for one of the classes within the framework.(举个例子,系统框架的开发者肯能不会公开框架的类的接口.) Because the class name isn’t known, it’s not possible for a user of the framework to create an instance of that class directly. (因为类的名称不知道,所以使用者不能直接通过类来创建实例.)Instead, some other object in the framework would typically be designated to return a ready-made instance, like this:(相反的,一些框架里的对象通常被设计为已经生成好的实例,例如:)
```Objective-c
id utility = [frameworkObject anonymousUtility];
```
In order for this anonymousUtility object to be useful, the developer of the framework can publish a protocol that reveals some of its methods.(为了让匿名工具对象更加有用,框架的设计者可能会公开一些协议,这样就可以公开一些它的方法.) Even though the original class interface isn’t provided, which means the class stays anonymous, the object can still be used in a limited way:(即使类的接口没有公开,也就说类是匿名的,这个时候的对象也有一些方法可以使用:)
```Objective-c
id <XYZFrameworkUtility> utility = [frameworkObject anonymousUtility];
```
If you’re writing an iOS app that uses the Core Data framework, for example, you’ll likely run into the NSFetchedResultsController class.(如果使用CoreData框架来写iOS应用的话,很可能会碰到NSFetchedResultsController类.) This class is designed to help a data source object supply stored data to an iOS UITableView, making it easy to provide information like the number of rows.(设计这个类就是用来帮助一个数据源对象给UITableView提供存储的数据,例如可以很轻松的提供一些行的信息.)
If you’re working with a table view whose content is split into multiple sections, you can also ask a fetched results controller for the relevant section information.(如果一个表格视图的内容被分为多个部分,那么这每个部分都需要一个抓取结果控制.) Rather than returning a specific class containing this section information, the NSFetchedResultsController class instead returns an anonymous object, which conforms to the NSFetchedResultsSectionInfo protocol. (不是返回一个包含这个部分信息的特定的类,NSFectchedResultsController类返回一个匿名对象,这个对象遵守了NSFetchedResultsSectionInfo协议.)This means it’s still possible to query the object for the information you need, such as the number of rows in a section:(也就是说,可以通过这个匿名对象来查询一些需要的信息,例如在一个部分里的行数是多少.)
```Objective-c
NSInteger sectionNumber = ...id <NSFetchedResultsSectionInfo> sectionInfo =        [self.fetchedResultsController.sections objectAtIndex:sectionNumber];NSInteger numberOfRowsInSection = [sectionInfo numberOfObjects];
```
Even though you don’t know the class of the sectionInfo object, the NSFetchedResultsSectionInfo protocol dictates that it can respond to the numberOfObjects message.(即使你不知道sectionInfo对象的类信息,让是通过遵守NSFetchedResultsSectionInfo这个协议,可以知道这个对象是可以响应numberOfObjects消息的)
