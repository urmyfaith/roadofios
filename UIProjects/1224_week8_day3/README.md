2014-12-24

# 知识回顾

- 表示数据
- 创建表
- 表头,表尾
- 组头,组尾
 - 高度
- 表的索引
 - 索引的属性,外观
 - 索引触发的方法
- 表格的增删改查
 - 删
	 - 删除一行
     - 删除多行
 - 增
 - 移动
 - 查
	 - 直接查找
	 - 通过搜索类查找

# 昨天遗留的问题


# 今天概览

-  自定义cell
-  IB(Interface Builder)
-  混编-->快速开发的原型
	- 时间的要求<==减少罗列控件的时间

# 自定义cell


MVC:
- Model 表示数据
	- 具体的工作
	- 1.创建一个模型类
	- 2.将字典或者数组的数据通过创建属性的方式表示出来
- View 显示数据
- Controller,Model和View的桥梁,二者通过controller通信.
	- 负责管理View

不好的地方,程序过大的时候,出现过多的Model,出现冗余.


## 自定义cell

方法:
1. 创建一个类,继承UITableViewCell
2. 将自定义的子控件在这个类里创建,生成
3. 在cellForRow方法里使用自定义的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPatho

## weak 的好处

- 当指向的对象被释放之后,weak指针会变成nil指针,不会形成野指针.
- 使用在ARC环境下使用
- 需要需要拥有一个对象的所有权的时候

#nib/xib

不同版本下的叫法.是对同一个文件的不同版本下的称呼,
通过nib/xib可以创建视图控制器,也可以创建视图.前者很少使用,多使用后者
xib只是显示控件

1.  手动创建viewController
2. 创建nib文件
3. 将nib文件的view添加成viewController的view
3. 通过设置,控制子控件.
	
