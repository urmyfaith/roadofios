# Customizing Existing Classes自定义现有类

Objects should have clearly-defined tasks, such as modeling specific information, displaying visual content or controlling the flow of information. (一个对象应该有明确的任务,例如修改指定的信息,显示某些内容,信息.)As you’ve already seen, a class interface defines the ways in which others are expected to interact with an object to help it accomplish those tasks.(在前面已经介绍了,一个类接口定义了很多接口,这样的话,其他的类就可以这个类来交互,达到一起完成任务的目标.)







 @interface ClassName (CategoryName)
```


Appleseed, John
```
(与其每次需要的时候都去生成,还不如对现有的类添加一个分类:)

```Objective-c
#import "XYZPerson.h"
```

In this example, the XYZPersonNameDisplayAdditions category declares one additional method to return the necessary string.(在这个例子中,XYZPersonNameDisplayAdditions分类添加了一个分类的方法来返回需要的字符串.)




#import "XYZPerson+XYZPersonNameDisplayAdditions.h"
 @implementation XYZPerson (XYZPersonNameDisplayAdditions)
```

Once you’ve declared a category and implemented the methods, you can use those methods from any instance of the class, as if they were part of the original class interface:(一旦声明了分类,实现了类方法,在类的实例和子类的实例中就可以使用分类中的方法了,而且感觉这方法就像在原有的类中一样.)

```Objective-c
#import "XYZPerson+XYZPersonNameDisplayAdditions.h"
```

As well as just adding methods to existing classes, you can also use categories to split the implementation of a complex class across multiple source code files.(正如通过分类可以对现有的类增加方法一样,你也可以使用分类来对一个复杂的类在几个不同的源文件中去实现.) You might, for example, put the drawing code for a custom user interface element in a separate file to the rest of the implementation if the geometrical calculations, colors, and gradients, etc, are particularly complicated. (例如,你可以对某个用户界面的绘制分到不同部分,例如几何计算,颜色,斜坡等等.)Alternatively, you could provide different implementations for the category methods, depending on whether you were writing an app for OS X or iOS.(或者,你可以提供针对不同的平台提供不同的实现方法.)













@interface NSSortDescriptor (XYZAdditions)
 (id)xyz_sortDescriptorWithKey:(NSString *)key ascending:(BOOL)ascending;
```
This means you can be sure that your method will be used at runtime. (这样就可以保证在运行的时候调用的是我们的方法.)The ambiguity is removed because your code now looks like this:(这样就消除了代码的模凌两可的地方:)

```Objective-c
NSSortDescriptor *descriptor =
```
