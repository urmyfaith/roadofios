//
//  NewsViewContoller.m
//  xCarDemo
//
//  Created by zx on 1/29/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "NewsViewContoller.h"

@interface NewsViewContoller ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation NewsViewContoller
{
    UIView *_indexBarView;
    UITableView *_leftTableView;
    UITableView *_rigthTalbeView;
    NSMutableArray *_leftDataArray;
    NSMutableArray *_rightDataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createNavigationBar];
    [self createIndexBar];
    [self createTableView];
}

#pragma mark 创建表视图
-(void)createTableView{

    _leftTableView  = [[UITableView alloc]initWithFrame:
                       CGRectMake(0,
                                  64+_indexBarView.frame.size.height,
                                  160,
                                  self.view.frame.size.height-64-_indexBarView.frame.size.height)
                                                  style:UITableViewStylePlain];
    _leftTableView.delegate = self;
    _leftTableView.dataSource = self;
    _leftTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_leftTableView];
    
    _rigthTalbeView  = [[UITableView alloc]initWithFrame:
                       CGRectMake(160,
                                  64+_indexBarView.frame.size.height,
                                  160,
                                  self.view.frame.size.height-64-_indexBarView.frame.size.height)
                                                  style:UITableViewStylePlain];
    _rigthTalbeView.delegate = self;
    _rigthTalbeView.dataSource = self;
    _rigthTalbeView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_rigthTalbeView];
    
}

#pragma mark 表视图代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _leftTableView)
        return 10;
    else

        return 15;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        static NSString *identifier = @"cellLeft";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _leftTableView) {
        return 50.0f;
    }
    else
        return 80.0f;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //设置最大偏移量
    _leftTableView.contentSize = _leftTableView.contentSize.height > _rigthTalbeView.contentSize.height? _leftTableView.contentSize : _rigthTalbeView.contentSize;
    
    _rigthTalbeView.contentSize = _leftTableView.contentSize.height > _rigthTalbeView.contentSize.height ?
    _leftTableView.contentSize : _rigthTalbeView.contentSize;
    
    if (scrollView == _leftTableView) {
        _rigthTalbeView.contentOffset = _leftTableView.contentOffset;
    }
    else{
        _leftTableView.contentOffset = _rigthTalbeView.contentOffset;
    
    }
}

#pragma mark  创建导航条
-(void)createNavigationBar{
    [self createMyNavigationBarWithTitle:nil andLeftBtn:@[@"News_Details_Btn_Back.png"] andRightBtn:nil];
    UILabel *label = [[UILabel alloc]init];
    label.frame =CGRectMake(50, 20, 100, 44);
    label.text = @"咨讯";
    label.font = [UIFont systemFontOfSize:25];
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
}

-(void)buttonClick:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark 创建索引条
-(void)createIndexBar{
    _indexBarView = [[UIView alloc]init];
    _indexBarView.frame = CGRectMake(0, 64, 320, 30);
    _indexBarView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_indexBarView];
    
    NSArray *names = @[@"最新",@"新车",@"评测",@"导购",@"详情"];
    for (int i = 0 ; i < names.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*320/names.count, 0, 320/names.count, _indexBarView.frame.size.height);
        [btn setTitle:names[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(indexBarClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i+1;
        [_indexBarView addSubview:btn];
        if (i) {
            UIView *view = [[UIView alloc]init];
            view.frame = CGRectMake(i*320/5, 8, 1, 14);
            view.backgroundColor = [UIColor grayColor];
            [_indexBarView addSubview:view];
        }
        else{
            btn.selected  = YES;
        }
    }
}

#pragma mark  索引条点击事件
-(void)indexBarClick:(UIButton *)button{
    NSLog(@"button.tag=%ld",button.tag);
    
    for (UIView *view in _indexBarView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            ((UIButton *) view).selected = NO;
            if (( (UIButton *) view).tag == button.tag) {
                ((UIButton *) view).selected = YES;
            }
        }
    }
}
@end
