
# property's synthesized getter follows Cocoa naming convention for returning 'owned' objects

```Objective-c
error: property's synthesized getter follows Cocoa naming convention for returning 'owned' objects
In file included from /Users/zx/desktop/day12-homeWork－2/day12-homeWork－2/TWMCells.m:9:
/Users/zx/desktop/day12-homeWork－2/day12-homeWork－2/TWMCells.h:14:38: note: property declared here
@property(nonatomic,strong)NSString *newPrice;
                                     ^
1 error generated.
```
~

```Objective-c
@property(nonatomic,strong)NSString *newPrice;
```

ARC环境下变量的命名规则不能包含new等关键字。

> 违犯了ARC命名规则，成员变量不要以new,copy作为前缀。
关于ARC规则，请参考http://mobile.51cto.com/iphone-313122.htm
基本的ARC使用规则：

> 1。代码中不能使用retain, release, retain, autorelease
> 
> 2。不重载dealloc（如果是释放对象内存以外的处理，是可以重载该函数的，但是不能调用[super dealloc]）
> 
> 3。不能使用NSAllocateObject, NSDeallocateObject
> 
> 4。不能在C结构体中使用对象指针
> 
> 5。id与void *间的如果cast时需要用特定的方法（__bridge关键字）
> 
> 6 。不能使用NSAutoReleasePool、而需要@autoreleasepool块
> 
> 7 。不能使用“new” "copy"开始的属性名称 （如果使用会有下面的编译错
> 误”Property’s synthesized getter follows Cocoa naming convention for returning ‘owned’ objects”）

> 例如：newName,copyName都是错误的，违反了第7条

##参考资料
－ http://stackoverflow.com/questions/6327448/semantic-issue-propertys-synthesized-getter-follows-cocoa-naming-convention-fo
－ http://www.cocoafans.com/?p=30
－ http://www.cnblogs.com/vagrantatbeijing/p/3450088.html
－ http://blog.csdn.net/shijiucdy/article/details/8747568