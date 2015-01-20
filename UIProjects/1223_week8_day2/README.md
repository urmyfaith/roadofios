2014-12-23

| 文件名 |  描述 |
| ------------- | ------------ |
|[1223_UITableView02](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1223_week8_day2/1223_UITableView02)| UITableView自定义表视图 ![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1223_week8_day2/1223_UITableView02.png)|
|[1223_UITableView03](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1223_week8_day2/1223_UITableView03)| UITableView表视图-添加行,移动行,删除行 ![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1223_week8_day2/1223_UITableView03_add.png)![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1223_week8_day2/1223_UITableView03_delete.png) ![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1223_week8_day2/1223_UITableView03_move.png)|
|[1223_UITableView04_deleteMulti-lines](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1223_week8_day2/1223_UITableView04_deleteMulti-lines)| UITableView删除多行数据 ![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1223_week8_day2/1223_UITableView04_deleteMulti-lines.png)|
|[1223_UITableView05_search](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1223_week8_day2/1223_UITableView05_search)| UITableVeiw搜索数据:使用两个表视图 ![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1223_week8_day2/1223_UITableView05_search_01.png)![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1223_week8_day2/1223_UITableView05_search_02.png) |
|[1223_UITableView06_search_bar](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1223_week8_day2/1223_UITableView06_search_bar)| UITableVeiw搜索数据:使用单个表视图 ![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1223_week8_day2/1223_UITableView06_search_bar.png)|
|[1223_exercise.key](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1223_week8_day2/1223_exercise.key)| 表视图练习:增,删,移动行 |
|[1223_exercisev1](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1223_week8_day2/1223_exercisev1)| 表视图练习:增,删,移动行![image](https://raw.githubusercontent.com/urmyfaith/roadofios/master/UIProjects/1223_week8_day2/1223_exercise.png) |
|[1223_exercisev1.zip](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1223_week8_day2/1223_exercisev1.zip)| 表视图练习:增,删,移动行 |
|[1223_exercisev2](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1223_week8_day2/1223_exercisev2)| 表视图练习:增,删,移动行 |
|[1223_exercisev2.mov](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1223_week8_day2/1223_exercisev2.mov)| 表视图练习:增,删,移动行-效果图 |
|[Review_UITableView](https://github.com/urmyfaith/roadofios/tree/master/UIProjects/1223_week8_day2/Review_UITableView)| 表视图复习,各种方法,索引条 |



# 上周的知识的复习

- 手势

- UITableView


两个代理-->一个表示数据,一个显示外观

触摸====>封装===>手势

- UITableView的创建 1day
 
- UITableView的操作,增删改查 1day
 
- UITableView,cell的自定义 1day


视图,加载到视图,从视图里取出的时候.
```
UILabel *label = (UILabel *)[cell viewWithTag:100];// 从父视图中取出子控件.
```



## 删除表中的行

- 删除表中相应的行

- 删除这一行对应的数据源(实际开发中,是删除服务器端对应的数据)

- 重新刷新(加载)表视图

##  插入表中的行

//1.将加载的数据行插入到表中
//2.更新数据源===>更新服务器
//3.刷新表

增加按钮,一般在给表格增加/修改元素的时候,不是这样添加的,是通过跳转到下一页

在进行详细的信息编辑之后,之后返回,完成编辑.

将带有编辑状态的数据的行显示到表中.

## 移动cell

1.取出当前的元素
2.将其从原位置删除
3.将其插入新位置
4.刷新表

## 删除多行数据

```
self.tableView.allowsMultipleSelectionDuringEditing = YES;
```


## 作业

- 数据的处理,一行数据==>NSArray,DSDictionay.
- 