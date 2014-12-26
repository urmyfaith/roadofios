2014-12-26

## 知识回归

- 三种从网络下载数据方式
 - 字符串的方法下载
 - NSURLConnection的同步方法
 - NSURLCOnneciton的异步方法
- json 解析
	- 注意接受数据的类型
- 下载过程的封装
	- 动作目标传输数据
- 实例,异步下载数据的应用
	- 自定义的cell
	- 自定义的model
	- 下载数据使用异步传输

- 软件开发流程
 
-  软件版本管理
	- svn
	- git
	
## 今天要点
	
- 下拉刷新
- xml解析
- html解析


- 什么叫xml
- 解析xml
- 写个例子,解析xml
- 顺便下拉刷新,上拉刷新
- 阶段性的请求数据.
- 故事版,storyboard

## 解析html

##### 第三方库的配置

- 第一步:添加框架/库文件

Xcode_import_framework.png
- 第二布:将非ARC文件添加编译选项

Xcode_import_framework_NonARC2ARC.png"-fno-objc-arc"
- 第三步:添加编译的头文件的路径:
Xcode_import_framework_add_path.png
## 实例

使用xml完成一个tiny的项目

- 获取数据
	- 从网络获取数据
- 表示数据
	- 解析xml
	- 用户模型保存数据
- 显示数据
	- 使用表视图表示数据
	- 使用下拉刷新,上啦刷新数据



