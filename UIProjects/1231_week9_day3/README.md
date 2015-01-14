2014-12-31

| 文件名 |  描述 |
| ------------- | ------------ |
|[1231_audio_video_basic](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1231_week9_day3/1231_audio_video_basic)| 音频的播放--进度条实例--视频的播放 |
|[1231_simple_weibo](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1231_week9_day3/1231_simple_weibo)| 网络获取数据,表示数据,显示数据-->自定义cell,可变高度的内容 |
|[1231_simple_weiboV1.zip](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1231_week9_day3/1231_simple_weiboV1.zip)| 网络获取数据,表示数据,显示数据-->自定义cell,可变高度的内容(V1) |
|[1231_simple_weiboV2.zip](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1231_week9_day3/1231_simple_weiboV2.zip)| 网络获取数据,表示数据,显示数据-->自定义cell,可变高度的内容(V2整理可变高度的内容.) |



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
	- "#import <AVFoundation/AVFoundation.h>"
-  导入头文件
-  创建音频播放器对象
-  导入音频文件
-  播放
-  另外,音频也有代理方法(例如在播放完成的时候执行的方法/中断,高优先级的方法)

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

| 属性 | 说明 |
| ------------- | ------------ |
| playing  | 是否正在播放 |
|duration |音频的长度|
| currentTime  | 当前播放的时间 |

~

| 方法 | 说明 |
| ------------- | ------------ |
| prepareToPlay  | 即将播放 |
|pause|暂停波烦恼歌|
|play|恢复播放/播放|

## 视频的播放

- 导入系统库
	- "#import <MediaPlayer/MediaPlayer.h>"
- 导入头文件
- 找到视频文件
- 创建视频播放器对象
- 播放


```Objective-c
-(void)testVideo{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"dzs" ofType:@"mp4"];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    self.moviePlayer = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
    self.moviePlayer.view.frame  = self.view.bounds;
    [self.view addSubview:self.moviePlayer.view];
}
```


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
  
  
#### 自定义的cell
  

- a)子控件的加载根据具体需要(是否进行加载子控件)(如果数据源中没有===>隐藏子控件)
- b)子控件的内容根据数据量进行自适应(文本较多===>换行处理)
- c)cell的高度根据需要进行调整
- d)表格加载的顺序

```Objective-c
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXTweetCell *cell = [ZXTweetCell cellWithTableView:tableView];
    
 -(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
```

是先执行的高度,然后加载的cell的创建.

- e)QQ的聊天界面



  

