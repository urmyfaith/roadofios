//
//  ViewController.m
//  1219_UItableView01-basic
//
//  Created by zx on 12/19/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ViewController.h"
#import "ZXFirstViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

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
   // NSLog(@"%s [LINE:%d] datas=%@", __func__, __LINE__,self.datas);
    
    
    //通过建表显示数据
    //两种样式:UITableViewStylePlain,UITableViewStyleGrouped
    //在iOS5.0之后,表格的总体风格变成了扁平化
    UITableView *tableView  = [[ UITableView alloc]initWithFrame:CGRectMake(10, 20, 300, 400) style:UITableViewStyleGrouped];
    tableView.backgroundColor = [UIColor grayColor];
    
    //设置背景颜色
    UIImage *backImage = [UIImage imageNamed:@"fenjing.jpg"];
    UIImageView *backgroundView = [[UIImageView alloc]initWithImage:backImage];
    tableView.backgroundView = backgroundView;
    
    
    //设置分割线
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    tableView.separatorColor = [UIColor redColor];//线的颜色
    tableView.separatorInset = UIEdgeInsetsMake(0,-10,0,0);//将线向左拉伸10像素,系统整体对齐
    
    
    
    //添加数据
    //1.显示有几个组
    //2.显示每组几行
    //3.显示每行的数据
    
    //显示如何实现
    //通过代理实现dataSource===>负责数据的显示
    tableView.dataSource = self;
    
    //负责表的外观和事件的处理.
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    //添加表头===>这是一个view,所有任何view都可以
    UIImageView *headerView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,300,300)];
    headerView.image = [UIImage imageNamed:@"head1.jpg"];
    [tableView setTableHeaderView:headerView ];
    
    //添加表尾===>这是一个view,所有任何view都可以
    UIImageView *footerView = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,300,300)];
    footerView.image = [UIImage imageNamed:@"head2.jpg"];
    [tableView setTableFooterView:footerView ];
    
}

#pragma mark  delegate代理方法==>外观和行为

//点击某一个行进行跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXFirstViewController *first = [[ZXFirstViewController alloc]init];
    [self presentViewController:first animated:YES completion:nil];
 //   NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

//取消选择的时候执行的方法
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

//设置行高,默认是44pt,这个像素是适合点击的最小的像素
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 2) {
        return 100;
    }
    return 44;
}

//组头的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
//组尾的高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20;
}



#pragma mark  dataSource代理方法==>数据的处理
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
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    NSArray *subArray = self.datas[indexPath.section];
    
    NSString *rowData =subArray[indexPath.row];
    
    //通过内置的标签显示数据
    cell.textLabel.text = rowData;
    
    //左侧图片
    cell.imageView.image = [UIImage imageNamed:@"head2.jpg"];
    
    //背景图
    //挑点,10px像素内的点
    UIImage *cellImage = [[UIImage imageNamed:@"table_cell_bg"] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    UIImageView *cellImageView = [[UIImageView alloc]initWithImage:cellImage];
    cell.backgroundView = cellImageView;
    
    //详细说明===>需要设置
    cell.detailTextLabel.text = @"detail description";
    
    
    //指示按钮===> 系统的样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    //指示按钮===> 自己的样式
    UIImage *imageAcc = [UIImage imageNamed:@"head2.jpg"];
    UIImageView *imageViewAcc = [[UIImageView alloc]initWithImage:imageAcc];
    imageViewAcc.frame = CGRectMake(280,5,20,20);
    imageViewAcc.center = CGPointMake(280+10,44/2);
    
    cell.accessoryView = imageViewAcc;
    
    //添加自定义的子控件===>cell是一个视图===>在视图上添加子视图
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,100,100,44)];
    label.text = @"custom view";
    
    [cell addSubview:label];

    return cell;
}


@end
