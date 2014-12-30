# duplicate_symbol
 
#### 出错的信息:


```Objective-c
Ld /Users/qianfeng/Library/Developer/Xcode/DerivedData/work-hhyqmwlwuhjfkxfepbxazozqbnkk/Build/Products/Debug-iphonesimulator/work.app/work normal i386
    cd /Users/qianfeng/Desktop/zhhUI/UI第十七天/work
    export IPHONEOS_DEPLOYMENT_TARGET=7.1
    export PATH="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/usr/bin:/Applications/Xcode.app/Contents/Developer/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang -arch i386 -isysroot /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk -L/Users/qianfeng/Library/Developer/Xcode/DerivedData/work-hhyqmwlwuhjfkxfepbxazozqbnkk/Build/Products/Debug-iphonesimulator -F/Users/qianfeng/Library/Developer/Xcode/DerivedData/work-hhyqmwlwuhjfkxfepbxazozqbnkk/Build/Products/Debug-iphonesimulator -filelist /Users/qianfeng/Library/Developer/Xcode/DerivedData/work-hhyqmwlwuhjfkxfepbxazozqbnkk/Build/Intermediates/work.build/Debug-iphonesimulator/work.build/Objects-normal/i386/work.LinkFileList -Xlinker -objc_abi_version -Xlinker 2 -fobjc-arc -fobjc-link-runtime -Xlinker -no_implicit_dylibs -mios-simulator-version-min=7.1 -framework CoreGraphics -framework UIKit -framework Foundation -Xlinker -dependency_info -Xlinker /Users/qianfeng/Library/Developer/Xcode/DerivedData/work-hhyqmwlwuhjfkxfepbxazozqbnkk/Build/Intermediates/work.build/Debug-iphonesimulator/work.build/Objects-normal/i386/work_dependency_info.dat -o /Users/qianfeng/Library/Developer/Xcode/DerivedData/work-hhyqmwlwuhjfkxfepbxazozqbnkk/Build/Products/Debug-iphonesimulator/work.app/work

duplicate symbol _OBJC_CLASS_$_ZHHVSecondiewController in:
    /Users/qianfeng/Library/Developer/Xcode/DerivedData/work-hhyqmwlwuhjfkxfepbxazozqbnkk/Build/Intermediates/work.build/Debug-iphonesimulator/work.build/Objects-normal/i386/ZHHViewController.o
    /Users/qianfeng/Library/Developer/Xcode/DerivedData/work-hhyqmwlwuhjfkxfepbxazozqbnkk/Build/Intermediates/work.build/Debug-iphonesimulator/work.build/Objects-normal/i386/ZHHVSecondiewController.o
duplicate symbol _OBJC_METACLASS_$_ZHHVSecondiewController in:
    /Users/qianfeng/Library/Developer/Xcode/DerivedData/work-hhyqmwlwuhjfkxfepbxazozqbnkk/Build/Intermediates/work.build/Debug-iphonesimulator/work.build/Objects-normal/i386/ZHHViewController.o
    /Users/qianfeng/Library/Developer/Xcode/DerivedData/work-hhyqmwlwuhjfkxfepbxazozqbnkk/Build/Intermediates/work.build/Debug-iphonesimulator/work.build/Objects-normal/i386/ZHHVSecondiewController.o
ld: 2 duplicate symbols for architecture i386

```

#### 出差错的原因:

在包含文件的时候,错误的将.h文件写成了.m文件

```Objective-c
import "ZHHTableViewCell.h"
#import "ZHHModel.h"
#import "ZHHViewController.h"
#import "ZHHVSecondiewController.h"
```

#### 修改

.m改成.h就可以了.
