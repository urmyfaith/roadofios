## Introduction

Block objects are a C-level syntactic and runtime feature. They are similar to standard C functions, but in addition to executable code they may also contain variable bindings to automatic (stack) or managed (heap) memory. A block can therefore maintain a set of state (data) that it can use to impact behavior when executed.

Block对象是C层次上的语法和运行时特性.它们和标准的C函数点相似,但是除了可以行的代码外,block**包含对自动变量(在stack栈中)变量,手动分配的内存(heap,堆中)的对象绑定**因此,block通过保存一些状态(数据)来执行一些行为.
You can use blocks to compose function expressions that can be passed to API, optionally stored, and used by multiple threads. Blocks are particularly useful as a callback because the block carries both the code to be executed on callback and the data needed during that execution.

block可以用来组成函数表达式,这个函数表达式又可以作为API的可选参数,可以被多个线程同时使用.Blocks**最位广泛的使用是作为回调函数来使用,因为block既携带了在回调函数中执行的代码块(block的定义/赋值),也包含了在代码块中执行的时候的参数(数据)**

Blocks are available in GCC and Clang as shipped with the OS X v10.6 Xcode developer tools. You can use blocks with OS X v10.6 and later, and iOS 4.0 and later. The blocks runtime is open source and can be found in LLVM’s compiler-rt subproject repository. Blocks have also been presented to the C standards working group as N1370: Apple’s Extensions to C. As Objective-C and C++ are both derived from C, blocks are designed to work with all three languages (as well as Objective-C++). The syntax reflects this goal.

Blocks是GCC和Clang里的变量,被移植到了OSX 10.6 以后的Xcode开发工具中.因此,**可以在OSX 10.6和iOS4.0之后的系统上使用block**,block运行时是开发源代码的,可以在LLVM的编译器运行时帮助仓库里找到这些源码.Blocks作为N1370(苹果对C的扩展)引入了标准C.由于OC和C++都是源于C的,所以blocks在设计的时候,就考虑到了C,OC,C++上使用.语法都是一样的.

You should read this document to learn what block objects are and how you can use them from C, C++, or Objective-C.
通过此文档,介绍了block对象是什么,怎么在C,c++,oc中使用.
## Getting Started with Blocks
The following sections help you to get started with blocks using practical examples.
#### Declaring and Using a Block
You use the ^ operator to declare a block variable and to indicate the beginning of a block literal. The body of the block itself is contained within {}, as shown in this example (as usual with C, ; indicates the end of the statement):

使用^操作符来声明一个block变量,^标志着block的开始.block的代码块使用{}来包括(标志着代码块的结束)
```objectivec
int multiplier = 7;int (^myBlock)(int) = ^(int num) {    return num * multiplier;};
```The example is explained in the following illustration:

下面的例子展示了怎么样来声明一个block
Notice that the block is able to make use of variables from the same scope in which it was defined. If you declare a block as a variable, you can then use it just as you would a function:
```objectivec
 int multiplier = 7;  int (^myBlock)(int) = ^(int num) {  
		return num * multiplier;  };  printf("%d", myBlock(3));  // prints "21"
```

注意block可以使用在当前范围内变量.如果声明了一个block变量,那么可以像使用函数一样使用这个block.

## Using a Block Directly 直接使用block
In many cases, you don’t need to declare block variables; instead you simply write a block literal inline where it’s required as an argument. The following example uses the qsort_b function. qsort_b is similar to the standard qsort_r function, but takes a block as its final argument.
```objectivec
￼￼￼￼char *myCharacters[3] = { "TomJohn", "George", "Charles Condomine" };qsort_b(myCharacters, 3, sizeof(char *), ^(const void *l, const void *r) {    char *left = *(char **)l;    char *right = *(char **)r;    return strncmp(left, right, 1);});// myCharacters is now { "Charles Condomine", "George", "TomJohn" }
```

**在很多的情况下,不需要声明block变量.只需要在同意内写blokc的代码块部分,然后作为其他方法的一个参数使用.**下面的例子使用了一个qsort_b方法.qsort_b和qsort_r方法类似,但是需要一个block作为最后的参数.

```objectivec
char *myCharacters[3] = { "TomJohn", "George", "Charles Condomine" };qsort_b(myCharacters, 3, sizeof(char *), ^(const void *l, const void *r) {    char *left = *(char **)l;    char *right = *(char **)r;    return strncmp(left, right, 1);});// myCharacters is now { "Charles Condomine", "George", "TomJohn" }
```

## Blocks with Cocoa

Several methods in the Cocoa frameworks take a block as an argument, typically either to perform an operation on a collection of objects, or to use as a callback after an operation has finished. The following example shows how to use a block with the NSArray method sortedArrayUsingComparator:. The method takes a single argument—the block. For illustration, in this case the block is defined as an NSComparator local variable:

**在Cocoa框架中很多的方法都使用了block作为参数,尤其是在对一系列的对象做操作的时候,或者是当一个操作完成的时候,使用一个回调方法.**下面的例子展示了怎么使用block作为数组排序的方法sortedArrayUsingComparator:的一个参数来进行排序.在这个例子里,block定义为了一个NSComparator的局部变量.```objectivec
NSArray *stringsArray = @[ @"string 1",                             @"String 21",                             @"string 12",                             @"String 11",                             @"String 02" ];static NSStringCompareOptions comparisonOptions = NSCaseInsensitiveSearch |  NSNumericSearch |          NSWidthInsensitiveSearch | NSForcedOrderingSearch;  NSLocale *currentLocale = [NSLocale currentLocale];  NSComparator finderSortBlock = ^(id string1, id string2) {      NSRange string1Range = NSMakeRange(0, [string1 length]);      return [string1 compare:string2 options:comparisonOptions range:string1Range  locale:currentLocale];};NSArray *finderSortArray = [stringsArray sortedArrayUsingComparator:finderSortBlock]; NSLog(@"finderSortArray: %@", finderSortArray);  /*  Output:  finderSortArray: (      "string 1",      "String 02",      "String 11",      "string 12",      "String 21") */
```

## __block Variables (__block变量)
A powerful feature of blocks is that they can modify variables in** the same lexical scope**. You signal that a block can modify a variable using the __block storage type modifier. Adapting the example shown in Blocks with Cocoa (page 6), you could use a block variable to count how many strings are compared as equal as shown in the following example. For illustration, in this case the block is used directly and uses currentLocale as a read-only variable within the block:
**blcok的一个强大的功能是,block内部可以修改在同一个语法范围内的变量.**通过给变量添加一个__block内存类型修改标志,在block内部就可以修改这个变量了.采用上面Cocoa中的blokc里介绍的方法,可以使用block变量来统计相同字符串的出现的次数.这里,直接使用了block变量,使用currentLocale最为block内部的只读的变量.
```objectivec
  NSArray *stringsArray = @[ @"string 1",
@"String 21", // <-@"string 12",@"String 11",@"Strîng 21", // <-@"Striñg 21", // <-@"String 02" ];
NSLocale *currentLocale = [NSLocale currentLocale];__block NSUInteger orderedSameCount = 0;NSArray *diacriticInsensitiveSortArray = [stringsArraysortedArrayUsingComparator:^(id string1, id string2) {    NSRange string1Range = NSMakeRange(0, [string1 length]);    NSComparisonResult comparisonResult = [string1 compare:string2options:NSDiacriticInsensitiveSearch range:string1Range locale:currentLocale];    if (comparisonResult == NSOrderedSame) {        orderedSameCount++;}    return comparisonResult;}];NSLog(@"diacriticInsensitiveSortArray: %@", diacriticInsensitiveSortArray);NSLog(@"orderedSameCount: %d", orderedSameCount);/* Output:diacriticInsensitiveSortArray: (    "String 02","string 1","String 11","string 12","String 21", "Str\U00eeng 21",      "Stri\U00f1g 21"  )  orderedSameCount: 2  */```This is discussed in greater detail in Blocks and Variables (page 14).
这会在第14页的blocks和变量里进行详细的讨论.
-----
## Conceptual Overview 概念性的了解
Block objects provide a way for you to create **an ad hoc function** body as an expression in C, and C-derived languages such as Objective-C and C++. In other languages and environments, a block object is sometimes also called a “closure”. Here, they are typically referred to colloquially as “blocks”, unless there is scope for confusion with the standard C term for a block of code.
block对象提供了创建一个特设的方法体(可以作为c,基于c的语言例如oc,c++的表达式)的方法.在其他的语言和环境中,**一个blokc对象有时也被叫做为"闭包"**,在这里,在不和标准c出现混淆的情况下,通常称为"blocks",#### Block Functionality block基本功能
A block is an anonymous inline collection of code that:
- Has a typed argument list just like a function- Has an inferred or declared return type- Can capture state from the lexical scope within which it is defined- Can optionally modify the state of the lexical scope- Can share the potential for modification with other blocks defined within the same lexical scope- Can continue to share and modify state defined within the lexical scope (the stack frame) after the lexical scope (the stack frame) has been destroyed**block是行内匿名代码的集合**
- 有个指定了类型的参数列表(和函数一样)
- 有一个暗含的或者是直接声明的返回值类型
- 可以捕获从定义开始的相同语法范围内的变量.
- 和在相同的语法范围内的其他代码块共享可以修改的变量.

- 能够在语法范围(栈)内的变量销毁后,继续共享和修改变量.(进行了拷贝工作.)You can copy a block and even pass it to other threads for deferred execution (or, within its own thread, to a runloop). The compiler and runtime arrange that all variables referenced from the block are preserved for the life of all copies of the block. Although blocks are available to pure C and C++, a block is also always an Objective-C object.
你可以拷贝一个block,甚至是作为参数,传递给其他延迟执行的线程.(或者是自己的线程,或者是一个循环的区块(译者注:可以参考NSTimer的执行:http://www.cnblogs.com/tangbinblog/archive/2012/12/07/2807088.html))在所有的block的生命周期内,编译器和运行时会自动安排block所引用的变量.尽管在纯c和c++中可以使用blocks,但是一个block也是一个oc的对象.
#### UsageBlocks represent typically small, self-contained pieces of code. As such, they’re particularly useful as a means of encapsulating units of work that may be executed concurrently, or over items in a collection, or as a callback when another operation has finished.Blocks代表一个很小,自我包含的代码块.因此,**block通常作为封装一些并行执行的工作的一种有效的手段.(译者注:例如,数据下载,网络请求等异步线程的封装操作)**,或者是对集合元素的操作,或者是在一些方法结束后的回调函数.Blocks are a useful alternative to traditional callback functions for two main reasons:

1. They allow you to write code at the point of invocation that is executed later in the context of the method implementation.Blocks are thus often parameters of framework methods.2. They allow access to local variables.Rather than using callbacks requiring a data structure that embodies all the contextual information you need to perform an operation, you simply access local variables directly.
Block可以替代传统的回调函数的两个原因:
- 允许在触发点(在具体的方法实现中调用的到时候触发)编写内容.这个时候block通常是作为其他框架方法的参数使用.
- 可以访问局部变量.

可以直接的方法局部变量,而不是使用包含了一大堆的数据/结构/参数的回调方法.



------


