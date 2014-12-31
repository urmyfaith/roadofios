2014-12-31

## 知识复习

- 简单介绍
- 捕获对象
- 简单应用	
	- 排序
	- 自定义的button(点击方法在类内部)
	- 实现动画(动画的过程在block内部)
- 反向传值
- GCD(多任务,多线程,并发任务)
	
代码块的声明和调用在两个不同类==>block作为另外一个类的参数===>在另一个类中调用====>实现了传值.

通过触发一个界面的控件===>修改另外一个界面的内容.

## 音频

-  导入系统库
-  导入头文件
-  创建音频播放器对象
-  导入音频文件
-  播放

```Objective-c
-(void)testAudio{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"lalala" ofType:@"mp3"];
    
    //取文件的时候需要使用fileURLWithPath,而不是之前的urlwithString之类的.
    NSURL *url = [NSURL fileURLWithPath:path];
    
    self.player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
    [self.player prepareToPlay];
    [self.player play];
}
```

声音调节,进度调节,

滑块===>进度

progress表示进度

## 视频的播放

- 导入系统库
- 导入头文件
- 找到视频文件
- 创建视频播放器对象
- 播放


## 简版微博示例

分析:

- 获取数据
	- 从数据库获取
	- 从本地文件获取
	- 从网络获取数据
	- 假数据
- 解析数据
	- json
	- xml
- 表示数据
	- 将数据放入数据模型,再放入数组
- 展示数据
  - 通过tableView显示数据
  - 自定义cell
  

