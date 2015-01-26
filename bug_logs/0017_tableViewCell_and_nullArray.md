From SZE and ZHH

### 问题:

瀑布流,三个表,显示出的数据不对,有偏移.

### 解决问题:

发现是在创建cell的时候,公用了一个cell


~~~objectivec
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
#if 0
    static NSString *ident = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:ident];
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.tag = 100;
        [cell addSubview:imageView];
    }
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:100];
    if (tableView == self.tableView1) {
        imageView.image = [UIImage imageNamed:self.datas1[indexPath.row]];
        imageView.frame = CGRectMake(0, 0, 90, 90);
    }else if (tableView == self.tableView2){
        imageView.image = [UIImage imageNamed:self.datas2[indexPath.row]];
        imageView.frame = CGRectMake(0, 0, 320-90-90, 180);
    }else{
        imageView.image = [UIImage imageNamed:self.datas3[indexPath.row]];
        imageView.frame = CGRectMake(0, 0, 90, 70);
    }
~~~

### 修改

~~~objectivec
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
#if 0
    static NSString *ident = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:ident];
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.tag = 100;
        [cell addSubview:imageView];
    }
    UIImageView *imageView = (UIImageView *)[self.view viewWithTag:100];
    if (tableView == self.tableView1) {
        imageView.image = [UIImage imageNamed:self.datas1[indexPath.row]];
        imageView.frame = CGRectMake(0, 0, 90, 90);
    }else if (tableView == self.tableView2){
        imageView.image = [UIImage imageNamed:self.datas2[indexPath.row]];
        imageView.frame = CGRectMake(0, 0, 320-90-90, 180);
    }else{
        imageView.image = [UIImage imageNamed:self.datas3[indexPath.row]];
        imageView.frame = CGRectMake(0, 0, 90, 70);
    }
#else

    UITableViewCell *cell = nil;
    if (tableView == self.tableView1) {
        
        static NSString *ident = @"cell";
        cell = [tableView dequeueReusableCellWithIdentifier:ident];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:ident];
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.tag = 100;
            [cell addSubview:imageView];
        }
        UIImageView *imageView = (UIImageView *)[self.view viewWithTag:100];
        imageView.image = [UIImage imageNamed:self.datas1[indexPath.row]];
        imageView.frame = CGRectMake(0, 0, 90, 90);
    }else if (tableView == self.tableView2){
        static NSString *ident = @"cell1";
        cell = [tableView dequeueReusableCellWithIdentifier:ident];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:ident];
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.tag = 101;
            [cell addSubview:imageView];
        }
        UIImageView *imageView = (UIImageView *)[self.view viewWithTag:101];
        imageView.image = [UIImage imageNamed:self.datas2[indexPath.row]];
        imageView.frame = CGRectMake(0, 0, 320-90-90, 180);
    }else{
        static NSString *ident = @"cell2";
        cell = [tableView dequeueReusableCellWithIdentifier:ident];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:ident];
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.tag = 102;
            [cell addSubview:imageView];
        }
        UIImageView *imageView = (UIImageView *)[self.view viewWithTag:102];
        imageView.image = [UIImage imageNamed:self.datas3[indexPath.row]];
        imageView.frame = CGRectMake(0, 0, 90, 70);
    }
    
    
#endif
    
    return cell;
}
~~~

三个表视图不能共用一个cell.

拆成三个就好了.


-----

## 问题

从一个空数据里取出元素,程序崩溃.

## 解决问题

第一步:定位到崩溃处.

第二步:发现空数组.

第三步:发现数据源为nil

第四步:发现文件路径写错了.

另外,需要清空模拟器,防止解压后的数据(数据不对,重新加载压缩包.)存在.


2015-01-26_21_06_45

