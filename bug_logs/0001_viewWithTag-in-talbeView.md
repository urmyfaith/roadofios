
 
# 下拉的时候,表格出现重复的时候.

问题的解决办法:

```
static NSString *identifier = @"cell";

UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

if (nil == cell) {
	cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];

	//自定义的控件,放在if里面
	UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100,5,210,34)];
	label.tag = 100;
	[cell addSubview:label];
}
cell.textLabel.text = self.datas[indexPath.row];

UILabel *label = (UILabel *)[cell viewWithTag:100];// 从父视图中取出子控件.
label.text = self.datas[indexPath.row];

```
即为在cell创建的时候,给子控件添加tag值

在cell复用的时候,根据tag值,给子控件重新赋值

```
    UILabel *label = (UILabel *)[cell viewWithTag:100];
```

这里是cell,而不是self.view


## 参考

http://stackoverflow.com/questions/9371061/uitableview-custom-view-and-load-more-in-the-same-cell


