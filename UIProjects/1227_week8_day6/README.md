2014-12-27

| 文件名 |  描述 |
| ------------- | ------------ |
|[databases-keywords.pages](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1227_week8_day6/databases-keywords.pages)| 数据库操作基本步骤 |
|[databases.pages](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1227_week8_day6/databases.pages)| 常见数据库操作 |
|[1227_database01_basicOperations](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1227_week8_day6/1227_database01_basicOperations)| 数据库的基础操作 |
|[1227_database_readdata-and-showtable-by-code](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1227_week8_day6/1227_database_readdata-and-showtable-by-code)| 数据库读取,表格显示 |
|[1227_database_readdata-and-showtable-by-codeV1_getData.zip](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1227_week8_day6/1227_database_readdata-and-showtable-by-codeV1_getData.zip)| 数据库读取,表格显示,完成第一部分 |
|[1227_database_readdata-and-showtable-by-codeV2_complete.zip](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1227_week8_day6/1227_database_readdata-and-showtable-by-codeV2_complete.zip)| 数据库读取,表格显示,完成功能 |
|[1227_database_readdata-and-showtable-by-xib](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1227_week8_day6/1227_database_readdata-and-showtable-by-xib)| 数据库读取,表格显示,通过xib实现 |
|[1227_database_readdata-and-showtable-by-xib.zip](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1227_week8_day6/1227_database_readdata-and-showtable-by-xib.zip)| 数据库读取,表格显示,通过xib实现-done |



每天坚持一小时,复习?

每天坚持一小时,敲代码?

没电脑==>看视频,准备面试,读文档


考试:

1. 考试的时候没有拿到成绩,不要灰心,


# 知识回顾

1. xml的解析

2. Xpath

3. 下拉刷新

# sqlite

- 创建数据库
- 打开数据库
- 操作表
- 插入数据
- 删除数据
- 修改数据
- 查询数据
- 关闭数据库

- 数据的来源:
	- 本地文件==>城市信息(固定的信息)
- 数据的持久化
	- =>sqlite
	- User Defaulst
	- Property List
	- Object archives
	- SQLite 3
	- Core Data

- 一些网站资源
	- code4ap
	- cocoaChina
	- 葵花宝典???
	
#### 数据库的创建

-  纯代码创建数据库
-  通过软件/终端创建数据	


主键(PrimaryKey) -->唯一标识一行数据的字段,学号,编号,手机号,身份证号

外键()--->与别的表相联系的字段.

//打开或者创建数据

//如果在给定的路径下有,则打开,如果不存在,则创建.
    
```Objective-c
    NSString *databasePath = [NSString stringWithFormat:@"%@/Documents/student.rdb",NSHomeDirectory()];
    self.database = [[FMDatabase alloc]initWithPath:databasePath];
    if (self.database.open == NO) {
        NSLog(@"open failed!");
    }
    else{
        NSLog(@"%s [LINE:%d] open success!", __func__, __LINE__);
    }
```


### 创建表的sql

创建表,表示学生的信息:id,姓名,密码,成绩

- sql语句不区分大小写
- 创建表的结构 表名,字段名,字段类型
- 不要出现中文(中文标点)

```Objective-c
-(void)testCreateTable{

    NSString *createTableString = @"create table if not exists studentInfo(SId INTEGER,username varchar(32),password varchar(32),score INTEGER)";//sql 语句
    BOOL isSuc = [self.database executeUpdate:createTableString];//执行语句
    NSLog(@"%s [LINE:%d],%i", __func__, __LINE__,isSuc);
}
```

除了在对表进行查询的时候,使用executeQuery:方法.

除此之外,修改,添加,删除,都使用executeUpdate:方法

即为不修改数据的时候,使用一个方法,涉及到修改数据的都使用另一个方法.

####  插入数据

注意,通过sql语句,修改数据的时候,字段的类型都要临时转换为字符串.

```Objective-c
-(void)testInsertTable{
    NSInteger Sid = 1;
    NSString *username = @"tom";
    NSString *password = @"123";
    NSInteger score = 100;
    
    NSString *insertSqlString = @"insert into studentInfo(SId,username,password,score) values(?,?,?,?)";
    BOOL isSuc = [self.database executeUpdate:insertSqlString,
                  [NSString stringWithFormat:@"%d",Sid],
                  username,
                  password,
                  [NSString stringWithFormat:@"%d",score]];//执行语句
    NSLog(@"%s [LINE:%d],%i", __func__, __LINE__,isSuc);
    
}
```

#### 从数据库中查询数据

查询数据有两种方法:

- 根据字段名去取值
- 根据字段索引号去取值

```Objective-c
-(void)testSelectTable{
    NSString *selectSqlString = @"select * from studentInfo";
    
    FMResultSet *results = [self.database executeQuery:selectSqlString];
    //在值的时候,变量在表结构中是什么字段,就用类型去接收.
    while (results.next) {
        
        NSInteger myID = [results intForColumn:@"SId"];
        NSString *myUsername = [results stringForColumn:@"username"];
        NSString *myPassword = [results stringForColumn:@"password"];
        NSInteger myScore = [results intForColumn:@"score"];
        
        NSLog(@"%s [LINE:%d]\n id = %i\nname=%@\npass=%@\nsocre=%i", __func__, __LINE__,myID,myUsername,myPassword,myScore);
        
        NSInteger myID1 = [results intForColumnIndex:0];//通过字段的索引序号去取值.
    }
}
```

#### 从数据库中修改值

```Objective-c
-(void)testUpdateTable{
    NSString *username = @"tom";
    NSString *newPassword = @"789";
    
    NSString *updateSqlString = @"update studentInfo set password = ? where username = ?";
    BOOL isSuc = [self.database executeUpdate:updateSqlString,newPassword,username];
    NSLog(@"%s [LINE:%d] isSuc = %i", __func__, __LINE__,isSuc);
 }
```

### 从数据库删除数据

```Objective-c
-(void)testDeleteTable{
    NSString *username = @"kate";
    
    NSString *deleteSqlString = @"delete from studentInfo where username = ?";
    BOOL isSuc = [self.database executeUpdate:deleteSqlString,username];
    NSLog(@"%s [LINE:%d] isSuc = %i", __func__, __LINE__,isSuc);
    [self testSelectTable];
}
```


### 总结:简单基本的sql语句,数据库的增删改查

```
(1) 数据记录筛选：

sql="select * from 数据表 where 字段名=字段值 order by 字段名 [desc]/[asc]"
　　
sql="select * from 数据表 where 字段名 like '%字段值%' order by 字段名 [desc]"
　　
sql="select top 10 * from 数据表 where 字段名=字段值 order by 字段名 [desc]"
　　
sql="select top 10 * from 数据表 order by 字段名 [desc]"
　　
sql="select * from 数据表 where 字段名 in ('值1','值2','值3')"
　　
sql="select * from 数据表 where 字段名 between 值1 and 值2"
 
 
(2) 更新数据记录：
　　
sql="update 数据表 set 字段名=字段值 where 条件表达式"
　　
sql="update 数据表 set 字段1=值1,字段2=值2 …… 字段n=值n where 条件表达式"
　　
 
(3) 删除数据记录：
　　
sql="delete from 数据表 where 条件表达式"
　　
sql="delete from 数据表" (将数据表所有记录删除)
　　
(4) 添加数据记录：
　　
sql="insert into 数据表 (字段1,字段2,字段3 …) values (值1,值2,值3 …)"
　　
sql="insert into 目标数据表 select * from 源数据表" (把源数据表的记录添加到目标数据表)
　　
(5) 数据记录统计函数：
　　
AVG(字段名) 得出一个表格栏平均值
　　
COUNT(*;字段名) 对数据行数的统计或对某一栏有值的数据行数统计
　　
MAX(字段名) 取得一个表格栏最大的值
　　
MIN(字段名) 取得一个表格栏最小的值
　　
SUM(字段名) 把数据栏的值相加
　　
引用以上函数的方法：
　　
sql="select sum(字段名) as 别名 from 数据表 where 条件表达式"
　　
//set rs=conn.excute(sql)
　　
用 rs("别名") 获取统计的值，其它函数运用同上。
　　
查询去除重复值：select distinct * from table1
　　
(6) 数据表的建立和删除：
　　CREATE TABLE 数据表名称(字段1 类型1(长度),字段2 类型2(长度) …… )
```

### 沙盒

拖动文件--->文件已经传送(存temp)--->如果拖动完成(取temp)--->显示完全

相册
画图
涂鸦
socket




