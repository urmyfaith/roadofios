# 2015年第一个bug,iOS数据库操作问题

## 问题描述


> 之前运行程序正常,今日整理资料,居然发现运行不出来,从数据读取内容,然后使用表格时候显示.结果程序运行后,模拟器一片空白,囧.

## 解决过程

使用终端命令可以正常读取出数据库内容:


```objectivec
zx:1227_database_readdata-and-showtable zx$ sqlite3 data.sqlite
SQLite version 3.8.5 2014-08-15 22:37:57
Enter ".help" for usage hints.
sqlite> .header on
sqlite> .mode column
sqlite> .table
firstlevel   leaflevel    secondlevel  studytable   testtable  
sqlite> select * from firstlevel;
serial      pid         pname                                               pcount    
----------  ----------  --------------------------------------------------  ----------
1           1           道路交通安全法律、法规和规章(185题)  16        
2           2           交通信号及其含义(158题)                    8         
3           3           安全行车、文明驾驶知识(159题)           8         
4           4           高速公路、山区道路、桥梁、隧道、?  10        
5           5           出现爆胎、转向失控、制动失灵等紧?  23        
6           6           机动车总体构造和主要安全装置常识?  6         
7           7           发生交通事故后的自救、急救等基本?  4
```

可以正常打开数据库:

```objectivec
-(id)init{
    if (self  = [super init]) {
        NSString *databasePath = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"sqlite"];
        _database = [[FMDatabase alloc]initWithPath:databasePath];
        if (_database.open == NO) {
            NSLog(@"%s [LINE:%d] open database from %@ failed.", __func__, __LINE__,databasePath);
        }
        else
        {
            NSLog(@"%s [LINE:%d] open database successed", __func__, __LINE__);
        }
    }
    return self;
}
```
输出:

```objectivec
2015-01-02 21:22:18.996 1227_database_readdata-and-showtable[28988:1117979] -[ZXDatabase init] [LINE:52] open database successed
2015-01-02 21:22:18.997 1227_database_readdata-and-showtable[28988:1117979] -[ZXDatabase firstLevelTable_Marray] [LINE:69] resultSet=(null)
2015-01-02 21:22:18.997 1227_database_readdata-and-showtable[28988:1117979] -[ZXDatabase firstLevelTable_Marray] [LINE:75] _firstLevelTable_Marray=(
)
```

初步判定.1)数据库打开成功.2)没有从数据库中读取出内容来.


-  难道和数据库sql查询语句的大小写有关?

```objectivec
NSString *selectAllFromFirstLevelTable_sqlString = @"SELECT * FROM firstlevel";
```
修改后仍然没有查找到错误出处.

- 在数据库对象处设置断点,发现数据库对象path为空.

```objectivec
-(NSMutableArray *)firstLevelTable_Marray{
    
    if(_firstLevelTable_Marray == nil){
        _firstLevelTable_Marray = [[NSMutableArray alloc]init];
        NSString *selectAllFromFirstLevelTable_sqlString = @"SELECT * FROM firstlevel";
        NSLog(@"%s [LINE:%d] _database=%@", __func__, __LINE__,_database);
        FMResultSet *resultSet = [_database executeQuery:selectAllFromFirstLevelTable_sqlString];
        NSLog(@"%s [LINE:%d] resultSet=%@", __func__, __LINE__,resultSet);
        while (resultSet.next) {
            ZXFirstLevelDataModel *firstLevelDataModel = [ZXFirstLevelDataModel modelWithOneRow:resultSet];
            NSLog(@"%s [LINE:%d] firstLevelDataModel = %@", __func__, __LINE__,firstLevelDataModel);
            [_firstLevelTable_Marray addObject:firstLevelDataModel];
        }
        NSLog(@"%s [LINE:%d] _firstLevelTable_Marray=%@", __func__, __LINE__,_firstLevelTable_Marray);
    }
    return _firstLevelTable_Marray;
}
```

![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/bug_logs/0008_database_can_not_read_data01.png)

- 如果数据库对象地址为空?ok,打印下你的地址.

```objectivec
        NSString *databasePath = [[NSBundle mainBundle]pathForResource:@"data" ofType:@"sqlite"];
        NSLog(@"%s [LINE:%d] databasePath=%@", __func__, __LINE__,databasePath);
``` 

输出

```objectivec
2015-01-02 21:38:52.899 1227_database_readdata-and-showtable[29249:1128299] -[ZXDatabase init] [LINE:46] databasePath=(null)
2015-01-02 21:38:52.900 1227_database_readdata-and-showtable[29249:1128299] -[ZXDatabase init] [LINE:53] open database successed
2015-01-02 21:38:52.901 1227_database_readdata-and-showtable[29249:1128299] -[ZXDatabase firstLevelTable_Marray] [LINE:69] _database=<FMDatabase: 0x7a82eee0>
```

![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/bug_logs/0008_database_can_not_read_data02.png)

- **数据库对象地址不为空,但是数据库对象的路径字符串为空?**没有找到文件?难道在工程中没有这么文件?

- 那么,删除这个文件,然后重新导入,


发现问题了:

![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/bug_logs/0008_database_can_not_read_data02.png)

文件没有添加target!!!!!



> 问题的原因:

>> 由于之前导入的时候,没有使用拷贝.今天整理文档,之前的工程文件路径发生了改变,然而此工程的数据库没有拷贝,出现了找不到文件错误.
>>
>> 重新导入了下了文件,**确认勾选了**拷贝的选项.
>> 
>> 今天的错误出现在没有将文件添加到target中.


![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/bug_logs/0008_database_can_not_read_data04.png)

## 总结:

在向工程添加已有文件的时候.

![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/bug_logs/0008_database_can_not_read_data05.png)

 aa)处,如果不勾选,文件就不会拷贝到本工程中.(当原始文件路径变化的时候,就会找不到文件)
 
 bb)处,也就是今天的错误之处,如果不勾选,就不会添加到目标工程文件中.
 
 





