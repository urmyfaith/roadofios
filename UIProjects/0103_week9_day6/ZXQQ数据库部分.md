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
``

## 查询表

```objectivec
.header on
.mode column
.width 5 5 80  20 10
select * from userInfoTable;
select * from messageInfoTable;
```