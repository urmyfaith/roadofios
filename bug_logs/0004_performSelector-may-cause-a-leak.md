# performSelector may cause a leak because its selector is unknown



```Objective-c

	//1225_dataDownload02/1225_dataDownload01/ZXHttpRequest.m
    //error handle:将接收完成的数据传出去.
    //pass more data as possible.==>try not to pass proptery.
    if ([self.target respondsToSelector:self.selector]) {
        [self.target performSelector:self.selector withObject:self];
    }
```

修改的方法:
```
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"

    if ([self.target respondsToSelector:self.selector]) {
        [self.target performSelector:self.selector withObject:self];
    }
#pragma clang diagnostic pop
```

## 参考资料

http://stackoverflow.com/questions/7017281/performselector-may-cause-a-leak-because-its-selector-is-unknown