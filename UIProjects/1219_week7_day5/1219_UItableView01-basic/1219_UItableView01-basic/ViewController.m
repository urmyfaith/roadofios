//
//  ViewController.m
//  1219_UItableView01-basic
//
//  Created by zx on 12/19/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource>

@property(nonatomic,copy)NSMutableArray *datas;

@end



@implementation ViewController

//lazyLoad
-(NSMutableArray *)datas{
    if (nil == _datas ) {
        _datas = [NSMutableArray array];
        
        //group number
        for (int  i = 0; i < 10; i++) {
            NSMutableArray *subMArray = [NSMutableArray array];
            //person numbers in each group
            for (int j = 0 ; j < 5; j++) {
                NSString  *string = [NSString stringWithFormat:@"group:%i,person:%i",i,j];
                [subMArray addObject:string];
            }
            [_datas addObject:subMArray];
        }
    }
    return _datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //数组打印中文的时候,显示gb2312编码,如果想打印出中文,
    //从数组中出元素,单独进行打印输出,就会转换位utf8编码
    NSLog(@"%s [LINE:%d] datas=%@", __func__, __LINE__,self.datas);
    
    
    //通过建表显示数据
    //两种样式:UITableViewStylePlain,UITableViewStyleGrouped
    //在iOS5.0之后,表格的总体风格变成了扁平化
    UITableView *tableView  = [[ UITableView alloc]initWithFrame:CGRectMake(10, 20, 300, 400) style:UITableViewStyleGrouped];
    tableView.backgroundColor = [UIColor grayColor];
    
    //添加数据
    //1.显示有几个组
    //2.显示每组几行
    //3.显示每行的数据
    
    //显示如何实现
    //通过代理实现
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
}
// 显示有几个组(可选的)
// Default is 1 if not implemented
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.datas count];
}
//显示每组多少行

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *subArray = self.datas[section];//当前正在操作的组号
    return [subArray count];
}


/**
 *  显示每组的数据
 *
 *  @param tableView 当前的表视图
 *  @param indexPath 用来显示位置信息的类,当前行的具体位置信息(组号,行号)
 *
 *  @return 返回每一个行的数据
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取组号
    //indexPath.section
    //获取行号
    //indexPath.row
    //UITableViewCell:表中的一个元素--->表的一行的数据==>显示在表上,继承自UIView
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

    NSArray *subArray = self.datas[indexPath.section];
    
    NSString *rowData =subArray[indexPath.row];
    
    cell.textLabel.text = rowData;
    return cell;
}


@end
