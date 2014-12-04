# Encapsulating Data封装数据









@interface XYZPerson : NSObject





NSString *firstName = [somePerson firstName];




￼@property (readonly) NSString *fullName;






￼￼@property (getter=isFinished) BOOL finished;

￼￼@property (readonly, getter=isFinished) BOOL finished;





## Dot Syntax Is a Concise Alternative to Accessor Method Calls 点语法是存取器方法一个简便的替代方法.

As well as making explicit accessor method calls, Objective-C offers an alternative dot syntax to access an object’s properties.(除了使用清晰的存取器方法,OC提供了点语法来访问一个对象的属性.)










- (void)someMethod {


- (void)someMethod {




```
@implementation YourClass
```

@synthesize firstName = ivar_firstName;


>> ```











- (id)init {

An init method should assign self to the result of calling the superclass’s initialization method before doing its own initialization.(**在初始化方法内,在对本类初始化之前,调用父类的初始化方法之后的返回值必须赋值给self.**)) A superclass may fail to initialize the object correctly and return nil so you should always check to make sure self is not nil before performing your own initialization.(在对本类进行初始化之前,需要检查self对象是否为nil,因为父类可能会初始化失败!)




- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName;


- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName {


- (id)initWithFirstName:(NSString *)aFirstName 
						lastName:(NSString *)aLastName 
					dateOfBirth:(NSDate *)aDOB;


- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName { 
	return [self initWithFirstName:aFirstName lastName:aLastName dateOfBirth:nil];


```
- (id)init {
```

If you need to write an initialization method when subclassing a class that uses multiple init methods, you should either override the superclass’s designated initializer to perform your own initialization, or add your own additional initializer.(当子类有很多的init方法的时候,要么重写父类的指定的初始化方法,要么添加额外的初始化方法.) Either way, you should call the superclass’s designated initializer (in place of [super init];) before doing any of your own initialization.(在重写init方法的时候,在开始自己的初始化之前,应该使用[super init])

## You Can Implement Custom Accessor Methods  可以自定义存储器方法

Properties don’t always have to be backed by their own instance variables.(属性不必都保存在它们的实例变量之中)

As an example, the XYZPerson class might define a read-only property for a person’s full name:(XYZPerson类可能会定义一个只读的属性:)

```
@property (readonly) NSString *fullName;
```





> Note: 
> > Although this is a convenient example,it’s important to realize that it’s locale-specific,and is only suitable for use in countries that put a person’s given name before the family name.(不同国家姓名的顺序不一样,这点需要注意.)


If you need to write a custom accessor method for a property that does use an instance variable, you must access that instance variable directly from within the method.(如果需要写一个自定义的存取器方法,需要在方法内部直接使用实例变量.) For example, it’s common to delay the initialization of a property until it’s first requested, using a “lazy accessor,” like this:(例如,**经常可以看到,直到对象第一次被调用的时候,才去初始化属性,这就是懒加载**)


```
- (XYZObject *)someImportantObject {
```
Before returning the value, this method first checks whether the _someImportantObject instance variable is nil; if it is, it allocates an object.(在返回对象之前,检查对象是否为nil,如果是nil,那么就给对象分配空间,进行初始化)

>Note: 
>>The compiler will automatically synthesize an instance variable in all situations where it’s also synthesizing at least one accessor method.(编译器会在任何情况下都会自动生成存取器方法,至少是一个存取器方法.) If you implement both a getter and a setter for a readwrite property, or a getter for a readonly property, the compiler will assume that you are taking control over the property implementation and won’t synthesize an instance variable automatically.(**如果你手动生成了某个属性的setter和getter方法,编译器就会认为你自己在管理这两个方法,它就不会自动生成实例变量了.**)

@synthesize property = _property;

## Properties Are Atomic by Default 属性默认是atomic原子的


```
@interface XYZObject : NSObject
```



@interface XYZObject : NSObject




> Note: 
> > Property atomicity is not synonymous with an object’s thread safety.(注意:**属性原子化与一个对象的线程安全并不是等同的.**)









When the user clicks the Update button, the badge preview is updated with the relevant name information.(当用户单击更新按钮的时候,标签就显示用户相关的信息.)

When the user modifies the person’s first name, the object graph changes to look like Figure 3-5 (page 57).(当用户修改姓名后,对象图变为下面的样子:)

The badge display view maintains a strong relationship to the original @"John" string object, even though the XYZPerson object now has a different firstName.(标记视图和原来的字符串@"John"有一个强关系.) This means the @"John" object stays in memory, used by the badge view to print the name.(这就意味着,使用标记视图来打印姓名的时候,打印的是仍然存留在内存内的@"John")











This means that the delegate object will be deallocated, thereby releasing the strong reference on the table view, as shown in Figure 3-11 (page 61).(因此,在释放代理对象的时候,释放对表格视图类的强关系引用的时候,如图:)







@property id delegate;



@property (weak) id delegate;




```
NSDate *originalDate = self.lastModificationDate;
```

In this example, the local variable originalDate maintains a strong reference to the initial lastModificationDate object. (在这个例子中,局部变量origianlDate维持了对lastModificationDate对象的强引用.)When the lastModificationDate property is changed, the property no longer keeps a strong reference to the original date, but that date is still kept alive by the originalDate strong variable.(当lastModificationDate改变的时候,属性就不在对原有的对象有一个强引用,但是日期值仍然保存在originalDate中.)