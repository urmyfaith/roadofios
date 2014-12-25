2014-12-25

# 昨天复习

- bug解决：数组删除
- mvc
- 自定义cell
	- dataModel
	- customCell

- weak
- xib/nib

	- contentView
	- IBoutlet

不要停,不要冷场,要么直说,要临场发挥.


# 今日知识

- 网络请求
- json解析

- 下拉刷新(明天)
- xml解析(明天)
- 数据库(后天)
- 爱心饼(下周)
- block(下下周)


## 代码规范

1. 作业自己写?
2. 注意格式规范
  - 等号,左右两侧留个空隙
  - 括号的前凸后进

# 网络数据的请求下载

- 电阻,反映慢,不能通过手指,需要使用触屏笔
- 电容屏,反应快,响应速度快

### 下载的三种方式

1. 使用字符串的方法进行同步下载
2. 使用NSURLConnection的方法进行同步下载
3. 使用NSURLConnection进行异步下载


|类别| **同步下载** | **异步下载** |
| ------------- | ------------ |-----|
|线程数| 同一时间点,只有**一个**线程在工作  | 同一时间点,只有**多个**线程在工作 |
|工作数|同一时间点,只能做一件事情|同一时间点,同事做多件事情|
|使用|下载数据量少的使用|下载数据量多的时候使用|
|优缺点|耗费资源少|耗费资源多|
|~|用户体验稍差|用户体验好|

**注意**
在实际的开发中,都使用异步,很少使用同步
大部分时间多使用**异步下载数据**


下载信息的时候,不能影响加载UI

### 1.使用字符串的方法进行同步下载

1. 要知道路径
2. 直接用NSString的方法去请求数据



### 2.使用NSURLConnection的方法进行同步下载

### 3.使用NSURLConnection进行异步下载





### 4.对数据进行解:json文件/xlm解析,使用哪一种,根据双方约定的类型处理.

| options | 参数说明 |
| ------------- | ------------ |
| NSJSONReadingMutableContainers  | 最外层是字典/数组 |
| NSJSONReadingMutableLeaves  | 最外层是NSString |
| NSJSONReadingAllowFragments  | 最外层不能是字典/数组 |


```Objective-c
 NSDictionary *dic =  [NSJSONSerialization JSONObjectWithData:self.downloadData
                                                         options:NSJSONReadingMutableContainers
                                                           error:nil];                                                     
```

### 5.数据传出本类**动作-目标设计模式**

**动作-目标设计模式**

- 动作-->方法
- 目标-->执行动作的对象

代理的简化版本


通过初始化方法,将目标,方法,作为参数传入.



### 程序设计流程

-  获取数据
	- 通过ZXHttpRequest类下载数据,
	- 通过解析json串来得到数组/字典
-  表示数据
	- 通过数据模型表示/存储数据 
-  展示数据
	- 通过表视图==>自定义cell

### 将NonARC库转换为ARC环境

在工程文件> Build Phases> Complie Sources中
对非ARC的文件添加编译选项"-fno-objc-arc"

### 使用第三方库下载图片


