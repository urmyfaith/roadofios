## Introduction

Block objects are a C-level syntactic and runtime feature. They are similar to standard C functions, but in addition to executable code they may also contain variable bindings to automatic (stack) or managed (heap) memory. A block can therefore maintain a set of state (data) that it can use to impact behavior when executed.

Block对象是C层次上的语法和运行时特性.它们和标准的C函数点相似,但是除了可以行的代码外,block**包含对自动变量(在stack栈中)变量,手动分配的内存(heap,堆中)的对象绑定**因此,block通过保存一些状态(数据)来执行一些行为.


block可以用来组成函数表达式,这个函数表达式又可以作为API的可选参数,可以被多个线程同时使用.Blocks**最位广泛的使用是作为回调函数来使用,因为block既携带了在回调函数中执行的代码块(block的定义/赋值),也包含了在代码块中执行的时候的参数(数据)**



Blocks是GCC和Clang里的变量,被移植到了OSX 10.6 以后的Xcode开发工具中.因此,**可以在OSX 10.6和iOS4.0之后的系统上使用block**,block运行时是开发源代码的,可以在LLVM的编译器运行时帮助仓库里找到这些源码.Blocks作为N1370(苹果对C的扩展)引入了标准C.由于OC和C++都是源于C的,所以blocks在设计的时候,就考虑到了C,OC,C++上使用.语法都是一样的.








使用^操作符来声明一个block变量,^标志着block的开始.block的代码块使用{}来包括(标志着代码块的结束)

int multiplier = 7;
```

下面的例子展示了怎么样来声明一个block


 int multiplier = 7;
		return num * multiplier;
```

注意block可以使用在当前范围内变量.如果声明了一个block变量,那么可以像使用函数一样使用这个block.

## Using a Block Directly 直接使用block


￼￼￼￼
```

**在很多的情况下,不需要声明block变量.只需要在同意内写blokc的代码块部分,然后作为其他方法的一个参数使用.**下面的例子使用了一个qsort_b方法.qsort_b和qsort_r方法类似,但是需要一个block作为最后的参数.

```objectivec
char *myCharacters[3] = { "TomJohn", "George", "Charles Condomine" };
```

## Blocks with Cocoa



**在Cocoa框架中很多的方法都使用了block作为参数,尤其是在对一系列的对象做操作的时候,或者是当一个操作完成的时候,使用一个回调方法.**下面的例子展示了怎么使用block作为数组排序的方法sortedArrayUsingComparator:的一个参数来进行排序.在这个例子里,block定义为了一个NSComparator的局部变量.
NSArray *stringsArray = @[ @"string 1",
```

## __block Variables (__block变量)




@"String 21", // <-













- 能够在语法范围(栈)内的变量销毁后,继续共享和修改变量.(进行了拷贝工作.)








可以直接的方法局部变量,而不是使用包含了一大堆的数据/结构/参数的回调方法.



------

## Declaring and Creating Blocks声明和创建Blocks



Block变量拥有block的所有权?声明的语法和声明函数的指针一样,除了使用^而不是*,blokc和c类型的系统就可以交互了.下面的是一个有效的block变量声明:

~~~objectivec
void (^blockReturningVoidWithVoidArgument)(void);
~~~



Blokcs也支持**?**参数.如果一个block没有参数的时候,需要将参数列表指定为void.


Blocks在设计的时候,就需要告诉编译器,指定所有的安全的类型:有效的形参,有效的返回值类型.可以将block对象的引用转换为任意的类型,反之亦然.然而,决不能通过一个*,来解除对一个对象的引用,这样blokc代码块的大小在编译的时候就不能被计算 了.


你可以创建一个执行某事情的block,这样在多个地方发都可以调用这个block了.

~~~objectivec
~~~


如果使用^操作符来代表一个block表达式的开始,那么后面可能跟随着一个使用括号包含的参数列表.
代码块体使用{}来包含.下面的例子展示了定义一个简单的block和将这个block赋值给之前声明的一个block变量.赋值语句的结尾包含了一个标准c的结束符号";"(分号).

~~~objectivec
float (^oneFrom)(float);
~~~


