## 问题,刷新表视图没有反应.


思路:

- 下载数据
- 下载完成
- 解析数据
- 数据===>数据模型===>数组
- 刷表

代码片段

[ZXNewsViewController.m#L122,#L155](https://github.com/urmyfaith/roadofios/blob/master/advancedUI/0112_week11_day3/0112_project_ipaddown/ZXNews/ZXNews/ZXNewsViewController.m#L122,#L155)

~~~objectivec
   
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer  = [AFHTTPResponseSerializer serializer];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%s [LINE=%i] 下载数据完成",__func__,__LINE__);
        [self analyJSON:responseObject];//解析数据
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%s [LINE=%i] 下载数据失败",__func__,__LINE__);
    }];
    
    //结束刷新
    [self.refreshHeaderView endRefreshing];
    [self.refreshFooterView endRefreshing];
    
}

-(void)analyJSON:(NSData *)data{
    
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    if ([self.datas count] > 0) {
        [self.datas removeAllObjects];
    }
    for (NSDictionary *subDic in array) {
        ZXNewsModel *model = [ZXNewsModel modelWithDic:subDic];
        
        [self.datas addObject:model];
    }
   [self.tableView reloadData]; 
}
~~~

## 分析

在block里操作了UI,(即为在异步线程中操作主线程/UI线程)

## 解决方法

将刷UI放到主线程中.

~~~objectivec
    for (NSDictionary *subDic in array) {
        ZXNewsModel *model = [ZXNewsModel modelWithDic:subDic];
        
        [self.datas addObject:model];
    }
    [self performSelectorOnMainThread:@selector(myReloadTable) withObject:nil waitUntilDone:NO];
    
}

-(void)myReloadTable{
    [self.tableView reloadData];
    NSLog(@"%s [LINE=%i] 刷表完成 ",__func__,__LINE__);
}
~~~

## 参考资料(重要)


- 1.)http://stackoverflow.com/questions/25577341/reload-tableview-with-addoperationwithblock
- 2.)http://stackoverflow.com/questions/19812058/uitableview-data-reload-issue
- 3.)http://likid1412.github.io/blog/2013/10/28/ios-stanford-university-ios-shi-pin-bi-ji/



