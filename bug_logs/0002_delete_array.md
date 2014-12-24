problem4:数组,添加,删除引起的程序崩溃

1223_UITableView04_deleteMulti-lines/1223_UITableView03/ZXViewController.m

```Objective-c
#if 0
            for (NSInteger index = 0 ; index <[self.seleectedCellsIndexes count]; index++) {
                NSIndexPath *path = self.seleectedCellsIndexes[index];
                [self.datas[path.section] removeObject:self.datas[path.section][path.row]];
            }
#endif
            
#if 1
            for (NSIndexPath *path in self.seleectedCellsIndexes) {
                [self.datas[path.section] removeObject:self.datas[path.section][path.row]];
            }
#endif
```


array=@[@“111”,@“222”,@”333”];

从前往后删除—>数组变化—>

从后往前删除—>数组变化—>

>解决办法
>> 不是删除,而是进行特殊标记—>例如替换成nil/或者是某个非常特殊的方法—>最后执行删除—>removeOjbect
