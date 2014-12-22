# UITabBarController

```Objective-c
/Documents/documentation/UIKit/Reference/UITabBarController_Class/index.html
```


The UITabBarController class implements a specialized view controller that manages a radio-style selection interface. (UITabBarController类实现了一个特别的视图控制器,这个视图控制器管理了一个多选样式的接口)This tab bar interface displays tabs at the bottom of the window for selecting between the different modes and for displaying the views for that mode. (这个标签栏(tab bar)接口在窗口底部显示不同的标签(tab))This class is generally used as-is but may be subclassed in iOS 6 and later.(这个类通常就是这样使用的,但是在iOS6之后,可能会被继承.)

Each tab of a tab bar controller interface is associated with a custom view controller.(标签栏(tab bar)接口中的每一个标签(tab)都和一个自定义的视图控制器相关联.) When the user selects a specific tab, the tab bar controller displays the root view of the corresponding view controller, replacing any previous views. (当用户选择一个特定的标签到时候,标签栏控制器显示对应视图控制器的根视图控制器,这个根视图控制器会替换原有的视图.)(User taps always display the root view of the tab, regardless of which tab was previously selected. This is true even if the tab was already selected.用户单击的时候,总是显示标签的根视图控制器,不管之前选择的是什么.即使这个标签已经选择了,也是这样的.) Because selecting a tab replaces the contents of the interface, the type of interface managed in each tab need not be similar in any way.(**因为选择一个标签的时候,会替换接口内容,所以每个标签所管理的接口的类型不必相同.**) In fact, tab bar interfaces are commonly used either to present different types of information or to present the same information using a completely different style of interface.(**事实上,标签栏接口通常要么用于显示不同的类型的信息,要么用不同类型的接口来显示同样的信息.**) Figure 1 shows the tab bar interface presented by the Clock application, each tab of which presents a type of time based information.(图1中,标签栏接口显示了时钟应用,每个标签都显示了一种时间信息.)



You should never access the tab bar view of a tab bar controller directly.(**绝不要直接通过标签栏控制器去获取标签栏视图**) To configure the tabs of a tab bar controller, you assign the view controllers that provide the root view for each tab to the viewControllers property. (为了配置标签栏的每一个标签,你可以指定视图控制器,让视图控制器来作为每个一标签的根视图控制器.)The order in which you specify the view controllers determines the order in which they appear in the tab bar. (指定视图控制器的顺序,决定了它们在标签栏栏上显示的顺序.)When setting this property, you should also assign a value to the selectedViewController property to indicate which view controller is selected initially.(设置好后,还需要**指定哪个视图控制器是最初的*选中的视图控制器*(selectedViewController)**) (You can also select view controllers by array index using the selectedIndex property.(也可以通过使用数组下标(selectedIndex)来选择视图控制器)) When you embed the tab bar controller’s view (obtained using the inherited view property) in your application window, the tab bar controller automatically selects that view controller and displays its contents, resizing them as needed to fit the tab bar interface.(当把标签栏控制器嵌套在应用窗口后,(可以通过继承view来活的标签栏视图),标签栏会自动选择一个视图控制器,显示它的内容,并且把标签均匀分布在标签栏接口上.)

Tab bar items are configured through their corresponding view controller. (**标签栏的每个标签是通过对应的视图控制器来配置的.**)To associate a tab bar item with a view controller, create a new instance of the UITabBarItem class, configure it appropriately for the view controller, and assign it to the view controller’s tabBarItem property.(为了将一个标签栏的标签和一个视图控制器连接起来,可以:创建一个UITabBarItem对象,然后配置这个对象,最后指定给这个视图控制器的tabBarItem属性.) If you do not provide a custom tab bar item for your view controller, the view controller creates a default item containing no image and the text from the view controller’s title property.(需要不提供一个自定义的标签栏的标签的话,视图控制器会创建一个默认的没有图片,只有标题(标题是视图控制器的title属性)的标签.)

As the user interacts with a tab bar interface, the tab bar controller object sends notifications about the interactions to its delegate. (当用户和一个标签栏接口互动的时候,标签栏控制器对象发送给他的代理一个关于互动的通知.)The delegate can be any object you specify but must conform to the UITabBarControllerDelegate protocol.(这个代理可以是任何遵守UITabBarControllerDelegate协议的对象.) You can use the delegate to prevent specific tab bar items from being selected and to perform additional tasks when tabs are selected. (你可以使用代理来防止特定的标签栏中特定的标签被选中,这样在标签选中的时候,可以执行额外任务.)You can also use the delegate to monitor changes to the tab bar that are made by the More navigation controller, which is described in more detail in The More Navigation Controller.(可以使用代理来监测 使用导航控制器对标签栏的改变,这将会在"更多导航控制器")

For more information about using tab bar controllers to build your user interface, see View Controller Programming Guide for iOS.(更多的使用标签控制器来创建用户接口的信息,参考"视图控制器编程指南")

# The Views of a Tab Bar Controller 标签控器起的视图

Because the UITabBarController class inherits from the UIViewController class, tab bar controllers have their own view that is accessible through the view property. (由于UITabBarController继承自UIViewController类,所以UITabBarController有自己的视图,这个视图可以通过视图属性来获取.)When deploying a tab bar interface, you must install this view as the root of your window. (**当使用标签控制器接口的时候,必须将标签控制器作为窗口的根视图.**)Unlike other view controllers, a tab bar interface should never be installed as a child of another view controller.(**不像其他的视图控制器,标签栏控制器接口决不能作为其他视图控制器的子接口**)

The view for a tab bar controller is just a container for a tab bar view and the view containing your custom content. (标签栏控制器的视图,仅仅是对一个标签栏视图和自定义视图的容器.)The tab bar view provides the selection controls for the user and consists of one or more tab bar items.(标签栏视图提供用户的选择控制器和一组标签对象.) Figure 2 shows how these views are assembled to present the overall tab bar interface.(图2显示了这些视图是怎么样组成一个完整的标签栏控制器接口的.) Although the items in the tab bar and toolbar views can change, the views that manage them do not. (**尽管标签栏上的标签,工具栏视图可以被改变,但是却不是通过管理它们的视图来改变的.**)Only the custom content view changes to reflect the view controller for the currently selected tab.(只有自定义的内容视图的改变才反应了对应选中的标签.)



You can use navigation controllers or custom view controller as the root view controller for a tab. (**对每个一标签的根视图控制器,可以是一个导航控制器,也可以是一个自定义的视图控制器.**)If the root view controller is a navigation controller, the tab bar controller makes further adjustments to the size of the displayed navigation content so that it does not overlap the tab bar.(**如果标签的根视图控制器是一个导航控制器,标签栏控制器就会做出一个些更加深入的改变,例如改变导航的内容显示尺寸,这样就不会和标签栏重叠.**) Any views you display in a tab bar interface should therefore have their autoresizingMask property set to resize the view appropriately under any conditions.( 这样话,任何显示在标签栏接口上的视图,都需要有一个autoresizingMask属性,在任何情况下来自动调整视图的大小.)

# The More Navigation Controller
The tab bar has limited space for displaying your custom items.(标签栏只有有限的空间来显示自定义的视图.) If you add six or more custom view controllers to a tab bar controller, the tab bar controller displays only the first four items plus the standard More item on the tab bar. (当超出6个标签的时候,标签栏只会显示前4个和一个标准的"More".)Tapping the More item brings up a standard interface for selecting the remaining items.(单击更多项目的时候,跳出一个标准接口用于选择剩下的项目.)

The interface for the standard More item includes an Edit button that allows the user to reconfigure the tab bar. (标准的More项目包含了一个Edit按钮,用户通过这个按钮可以配置标签栏.)By default, the user is allowed to rearrange all items on the tab bar.(默认的情况下,用户可以排列所有在标签栏上的标签.) If you do not want the user to modify some items, though, you can remove the appropriate view controllers from the array in the customizableViewControllers property.(**如果不希望用户更改某个标签的位置,可以将这个标签从customizableViewControllers属性(数组)中移除.**)

# State Preservation状态展示

In iOS 6 and later, if you assign a value to this view controller’s restorationIdentifier property, it preserves a reference to the view controller in the selected tab. At restore time, it uses the reference to select the tab with the same view controller.(**在iOS6以后的版本中,可以通过给视图控制器的restorationIdentifier属性指定一个值,它保存了当前选择的标签的视图控制器,在需要恢复的时候,可以通过对这个属性的引用来恢复现场.**)

When preserving a tab bar controller, assign unique restoration identifiers to the child view controllers you want to preserve. (当保存一个标签栏控制器的时候,给需要保存标签对应的视图控制器一个唯一的恢复标志.)Omitting a restoration identifier from a child view controller causes that tab to return to its default configuration.(如果视图控制器缺少恢复标志,那么恢复的时候就是默认值,也就是说和创建的时候一样.) Although the tab bar controller saves its tabs in the same order that they are listed in the viewControllers property, the save order is actually irrelevant. (**尽管标签栏控制器保存标签后的顺序 和在viewControllers里添加的顺序一致,但是实际上的保存顺序是没有关联的.**)Your code is responsible for providing the new tab bar controller during the next launch cycle, so your code can adjust the order of the tabs as needed.(因此,在下次启动程序的时候,需要自己编写代码来调整标签的循序.) The state preservation system restores the contents of each tab based on the assigned restoration identifier, not based on the position of the tab.(**系统会根据指定的恢复标志来恢复每个标签的内容,而不是根据标签在标签栏的位置.**)

For more information about how state preservation and restoration works, see App Programming Guide for iOS.(了解更多的关于保存和恢复状态的信息,可以参考"iOS应用编程指南.")


### Accessing the Tab Bar Controller Properties获取标签栏控制器的属性
delegate
tabBar

### Managing the View Controllers管理视图控制器

viewControllers
setViewControllers:animated:
customizableViewControllers
moreNavigationController

### Managing the Selected Tab管理选择的标签

selectedViewController
selectedIndex
