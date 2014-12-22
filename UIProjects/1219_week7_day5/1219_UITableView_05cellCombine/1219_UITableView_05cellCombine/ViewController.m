//
//  ViewController.m
//  1219_UITableView_05cellCombine
//
//  Created by zx on 12/19/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *citys;
@end

@implementation ViewController


-(NSMutableArray*)citys{
    if ( nil == _citys) {
        _citys = [NSMutableArray arrayWithObjects:@"北京",@"上海",@"沈阳",@"天津",
                  @"大连",@"香港",@"台北",@"华盛顿",@"柏林",@"巴黎",@"乌鲁木齐",@"拉萨",@"成都",@"广州",@"福州",@"深圳",@"郑州",@"西安",@"石家庄",@"南宁",@"重庆",@"安徽",nil];
    }
    return _citys;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(10,10,300,450) style:UITableViewStylePlain];
    
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
}

#pragma mark 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.citys count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
#if 0
    //非专业版===>未使用复用机制
    //1创建对象
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    //2获取数据
    NSString *city = self.citys[indexPath.row];
    
    
    //3.添加数据到cell上
    cell.textLabel.text = city;

    
    //4.返回数据
    return cell;
#endif
    
#if 0
    
    //1.设置标志符
    static NSString *identifier = @"myCell";// 最好使用static的形式
    
    //2.从缓存里去取
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //3.取不出来的时候创建:
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        //自定的属性放在这里===>自定义的属性这样也不必每次都创建
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100,5,100,44)];
        label.text = @"helloword";
        [cell addSubview:label];
    }
    //4.展示数据
    //如果想使某个cell的某个控件的值始终不显示,就赋值为空/nil
    if (indexPath.row == 0) {
        cell.textLabel.text = @"";
    }
    else{
        cell.textLabel.text = self.citys[indexPath.row];
    }
    NSLog(@"%p",cell);
    
    //5.返回数据
    return cell;
#endif

#if 1
    static NSString *identifier = @"";
    if (indexPath.row < 4) {
        identifier =  @"myCell";
    }else
    {
        identifier =  @"newCell";
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //3.取不出来的时候创建:
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        //自定的属性放在这里===>自定义的属性这样也不必每次都创建
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100,5,100,44)];
        label.text = @"helloword";
        [cell addSubview:label];
    }
    //4.展示数据
    //如果想使某个cell的某个控件的值始终不显示,就赋值为空/nil
    if (indexPath.row == 0) {
        cell.textLabel.text = @"";
    }
    else{
        cell.textLabel.text = self.citys[indexPath.row];
    }
    NSLog(@"%p",cell);
    
    //5.返回数据
    return cell;
#endif
    
}


@end
