## Introduction

Block objects are a C-level syntactic and runtime feature. They are similar to standard C functions, but in addition to executable code they may also contain variable bindings to automatic (stack) or managed (heap) memory. A block can therefore maintain a set of state (data) that it can use to impact behavior when executed.

Block对象是C层次上的语法和运行时特性.它们和标准的C函数点相似,但是除了可以行的代码外,block**包含对自动变量(在stack栈中)变量,手动分配的内存(heap,堆中)的对象绑定**因此,block通过保存一些状态(数据)来执行一些行为.
You can use blocks to compose function expressions that can be passed to API, optionally stored, and used by multiple threads. Blocks are particularly useful as a callback because the block carries both the code to be executed on callback and the data needed during that execution.

block可以用来组成函数表达式,这个函数表达式又可以作为API的可选参数,可以被多个线程同时使用.Blocks**最位广泛的使用是作为回调函数来使用,因为block既携带了在回调函数中执行的代码块(block的定义/赋值),也包含了在代码块中执行的时候的参数(数据)**

Blocks are available in GCC and Clang as shipped with the OS X v10.6 Xcode developer tools. You can use blocks with OS X v10.6 and later, and iOS 4.0 and later. The blocks runtime is open source and can be found in LLVM’s compiler-rt subproject repository. Blocks have also been presented to the C standards working group as N1370: Apple’s Extensions to C. As Objective-C and C++ are both derived from C, blocks are designed to work with all three languages (as well as Objective-C++). The syntax reflects this goal.

Blocks是GCC和Clang里的变量,被移植到了OSX 10.6 以后的Xcode开发工具中.因此,**可以在OSX 10.6和iOS4.0之后的系统上使用block**,block运行时是开发源代码的,可以在LLVM的编译器运行时帮助仓库里找到这些源码.Blocks作为N1370(苹果对C的扩展)引入了标准C.由于OC和C++都是源于C的,所以blocks在设计的时候,就考虑到了C,OC,C++上使用.语法都是一样的.

You should read this document to learn what block objects are and how you can use them from C, C++, or Objective-C.
通过此文档,介绍了block对象是什么,怎么在C,c++,oc中使用.
