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
It’s also possible to specify optional methods in a protocol. These are methods that a class can implement only if it needs to.