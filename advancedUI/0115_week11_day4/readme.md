OSI七层模型

每一层有不同的设备.

为了让不同的设备之间可以进行数据传输,

定义7七层模型来进行封装和拆封的过程,以便适应数据在不同设备的传输.

TCP/IP

如果单独解释,TCP位传输层的协议,IP为网络层的协议.

TCP---->传输控制协议
IP----->(英特网互联协议)为网络层协议.

代表网络协议族.



hTTP协议,超文本协议.

1. 应用层协议.
2. 是TCP的协议的一个高级封装
3. 是一个短链接协议.(下载数据之后连接断开)
4. 有GET和POST两种请求方法

get 显式请求,只有请求头,参数只能拼接到地址栏,不能上传文件.
post 隐式请求,有请求头和请求体,参数可以拼接到地址栏或者请求体中,可以上传文件.

ASIHTTPRequest 第三方协议.




id >28 降序,前2位

select User.UserName,UserInfo.UserPhone form User inner join UserInfo where User.UserId=UserInfo.UserId and UserInfo.UserAge>28 order by UserInfo.UserAge desc limit 2;


