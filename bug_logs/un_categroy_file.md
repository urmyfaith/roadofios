2、当xcode中代码无法进行索引时

进入该目录下，删除对应工程文件索引目录即可：open ~/Library/Developer/Xcode/DerivedData

3、测试环境可以真机调试，release版本不可以真机调试

 进入这个目录：~/Library/Developer/Xcode/DerivedData，将里面的数据进行删除，然后重启xcode

4、修改程序的Bundle identifier可能会导致程序始终无法启动，一直处在attachApp，需要做的是将模拟器重新启动就可以了，和重启xcode。


5、4.3.3xcode缓存问题很严重，应该属于4.3的一个bug，修改的代码运行起来始终没有变化，重启xcode之后发现之前修改的内容全部没了（另外应该与头文件的引入有问题，相互引用导致文件无法找到目标代码）


6、关于Architectures和Valid Architectures的设置

======================================

Architectures是你打算编译出多少个不同架构的可执行文件来（因为Cocoa的一个应用里面可以包含多个针对不同架构的可执行文件）

Valid Architectures是说编译出来的可执行文件可以在哪些架构的设备上运行，

最终会编译出来多少个可执行文件取决于这两个选项的交集。

所以，如果Architectures设定为armv6，那么不管 Valid Architectures 里面设多少个其他架构，最终都只会生成一个armv6版本的可执行文件。但是，如果Valid Architectures里面没有armv7的话，那么编译出来的可执行文件将不能在armv7的设备上运行，所以，当你装到3GS以后的armv7设备上时，会报那个错：无法在选中的设备上运行。

具体到这个项目，因为大智慧的代码编译成 armv7 就会崩溃，所以只能编译armv6版本，即把Architectures设成armv6这唯一一个值。但是，因为ARM架构是向下兼容的，即新架构的CPU可以运行旧架构的代码，而我们也愿意让编出来的armv6版本可以在新的armv7设备上运行，所以，Valid Architectures里面应该包括 armv6, armv7, armv7s, i386。这个设置固定下来即可，以后不要每次修改。

ARMv7s = iPhone 5, iPad 4

ARMv7  = iPhone 3GS, iPhone 4, iPhone 4S, iPod 3G/4G/5G, iPad, iPad 2, iPad 3, iPad Mini  

ARMv6  = iPhone 2G/3G, iPod 1G/2G

i386 = 模拟器

从Xcode 4.5开始，不支持编译armv6的可执行文件了。所以要想支持armv6，必须用4.5之前的版本。但4.5之前的版本没有iOS 6 SDK。

再顺便说一下Build Active Architecture Only 这个选项。

所谓Active Architecture，就是当前插在你电脑上的，并且你在Xcode里面选中了的那个设备的架构。

这个选项主要是给开发阶段用的，因为假设你的应用需要出编译好几个架构的可执行文件，那么每次编译时间就比较长。但是调试的时候，其实只要编译你用来调试的那台机器的架构就够了，其他的都是浪费时间。所以，你可以在开发用的target里把这个选项设成Yes，最终用来打包的target里设成No。这样可以提高效率。

==============================================================

7、出现Undefined symbols for architecture i386错误

①要么在compile source 中没有引入文件。

②要么在link Binary中没有引入应该引入的类库。

PS:stackOverFlowhttp://stackoverflow.com/questions/6984368/undefined-symbols-for-architecture-i386-objc-class-skpsmtpmessage-refere

8、可以通过给文件加编译标签来决定是否使用ARC

-fno-objc-arc              //不使用ARC
-fobjc-arc                  //使用ARC
在compiler source中的compiler flags中加入以上字段

9、Could not launch 'app name'   

 应用开发相关 
如果你也出現了 
“Could not launch 'app name'”，No such file or directory (/Users/apple/Libra 
ry/Developer/Xcode/DerivedData/mytest-ejkagqxooxgmtdfsdoygtyzflibe/Build/Products/Debug-iphoneos/mytest.app/mytest) 
這樣的訊息的話，有幾個處理方法 
1.刪除DerivedData資料夾法 
1.1 完全離開 Xcode，然後再做下列步驟： 
1.2把/Users/apple/Library/Developer/Xcode/DerivedData/下面的東西全部刪除(DerivedData本身不要刪)， 
1.3再重新啟動 Xcode，再rebuild 
2.重新開機法 
步驟1沒效的話，把手機全關機，重開機一遍 
3.clear法 
可以clear一下 
4.deployment target OS版本更改 
把deployment target改成和實機相同的OS版本 
5.改動build path 
到Targets下的 Build Settings的Build Locations的Build Products Path的build 
把這個地方改成Build Products Path Build/Products 
6.重新開啟xcode，重新連結實機 (乍看很笨，其實很有效) 
7.我也沒招了，請自己再去找google大神吧 
ps:用高版本xcode 调试低系统版本的 设备 出现这种错误   一般用 第4条解决