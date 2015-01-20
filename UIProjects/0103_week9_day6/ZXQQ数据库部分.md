## 创建表


```objectivec
CREATE table IF NOT EXISTS messageInfoTable (messageId INTEGER PRIMARY KEY, userId INTEGER,messageContent varchar(100),messageSendTime varchar(14),isTimeMessage boolean)

CREATE table IF NOT EXISTS messageInfoTable (messageId INTEGER PRIMARY KEY, userId INTEGER,messageContent varchar(100),messageSendTime date,isTimeMessage boolean)



CREATE table IF NOT EXISTS userInfoTable (userId INTEGER PRIMARY KEY,userHeadImage varchar(10),userNickName varchar(10) )

```
## 删除表

```objectivec
drop table messageInfoTable;
```



## 表的schema

```objectivec
.schema ?TABLE?

.schema messageInfoTable
```

## 插入数据

```objectivec
insert into userInfoTable(userId,userHeadImage,userNickName)values(?,?,?)

// INTEGER PRIMARY KEY 
//http://www.sqlite.org/faq.html#q1
//会自动位主键++

insert into userInfoTable(userId,userHeadImage,userNickName)values(1,"zxHeadImage","zx");
insert into userInfoTable(userId,userHeadImage,userNickName)values(2,"youHeadImage","you");

insert into userInfoTable(userHeadImage,userNickName)values("zxHeadImage","zx");
insert into userInfoTable(userHeadImage,userNickName)values("youHeadImage","you");



CREATE table IF NOT EXISTS messageInfoTable (messageId INTEGER PRIMARY KEY, userId INTEGER,messageContent varchar(100),messageSendTime varchar(14),isTimeMessage boolean)




insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(1,"time",datetime('now'),1);
insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(1,"time",strftime('%Y%m%d%H%M%S','now','localtime'),yes);
insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(1,"time",strftime('%Y%m%d%H%M%S','now','localtime'),1);

insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(1,"good!",strftime('%Y%m%d%H%M%S','now','localtime'),0);

select datetime('now');
strftime('%Y%m%d%H%M%S','now','localtime')

```

## 删除数据
```objectivec
 delete  from userInfoTable where userNickName="zx";
sqlite> delete  from userInfoTable where userNickName="you";
```
## 总结:

- 创建表;

```objectivec
CREATE table IF NOT EXISTS messageInfoTable (messageId INTEGER PRIMARY KEY, userId INTEGER,messageContent varchar(100),messageSendTime date,isTimeMessage boolean);

CREATE table IF NOT EXISTS userInfoTable (userId INTEGER PRIMARY KEY,userHeadImage varchar(10),userNickName varchar(10) );
```

- 插入用户信息;

```objectivec
insert into userInfoTable(userHeadImage,userNickName)values("zxHeadImage","zx");
insert into userInfoTable(userHeadImage,userNickName)values("youHeadImage","you");
```


- 插入聊天记录

```objectivec
insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(1,"时间:XXX",strftime('%Y%m%d%H%M%S','now','localtime'),1);
insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(1,“小张，听说你大学的专业是通信工程.",strftime('%Y%m%d%H%M%S','now','localtime'),0);
insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(2,"是的，领导。",strftime('%Y%m%d%H%M%S','now','localtime'),0);
insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(1,"领导，请你尊重这门专业，通信工程是……?",strftime('%Y%m%d%H%M%S','now','localtime'),0);
insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(2,"时间:YY",strftime('%Y%m%d%H%M%S','now','localtime'),1);
insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(2,"那好,小张,请你将这个数字基带信号用差分相移键控（DPSK）方法调制成数字带通信号并求出相干解调系统的带通滤波器输出端的信噪比及误码率。",strftime('%Y%m%d%H%M%S','now','localtime'),0);
insert into messageInfoTable(userId,messageContent,messageSendTime,isTimeMessage)values(1,"领导，充多少？",strftime('%Y%m%d%H%M%S','now','localtime'),0);
```

## 查询表

```objectivec
.header on
.mode column
.width 5 5 80  20 10
select * from userInfoTable;
select * from messageInfoTable;
```


创建


查询:

select * from User order by UserId desc;

链接查询

 select * from User inner join UserInfo where User.UserId = UserInfo.U
 
 select User.UserName,UserInfo.UserAge from User inner join UserInfo where User.UserId = UserInfo.UserId;
 
  select User.UserName,UserInfo.UserPhone from User inner join UserInfo where User.UserId = UserInfo.UserId and  UserInfo.UserAge >20 order by User.UserId desc limi
  
  需要我们做的是,解析json,把vaule0~value4,每组10篇文章,保存在cell里,
  
  
## 数据库操作:
   
roadofios/UIProjects/1227_week8_day6/sqlite3_usage.txt

json==>数据库===>取出===>title,id

左上角,读另外十篇文章,value0-->value1-->value2.

点击第一行,这一行的单篇文件

一张表存40篇文章.

另一张表存单篇文章

右侧,跳到新的界面,显示收藏,


滑动,删除文件===>数据库删除.

2个小时?


导航条,表标签栏,


rwxr-xr-x  2 zx  staff   68 Jan 16 09:10 Documents
drwxr-xr-x  5 zx  staff  170 Jan 16 10:28 Library
drwxr-xr-x  8 zx  staff  272 Jan 16 11:02 Reveiew_database.app
drwxr-xr-x  2 zx  staff   68 Jan 16 10:30 tmp

tmp程序关闭的时候,清空

app目录--->程序所有

iCloud--->同步的云端


数据库存在Documents,数据量过大(>10M)

数据库存在Documents中,云同步太慢.

Documents存plist文件(存放帐号,密码)

数据库和大型的文件存放在Libray/Cachees/

第一,云同步的时候,不同步Library文件夹.

数据库的删除和插入的语句同时执行的时候,会挂起一个.所以,每次都先打开,后关闭.
