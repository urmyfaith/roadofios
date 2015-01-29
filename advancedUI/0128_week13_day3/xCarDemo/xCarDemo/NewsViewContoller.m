//
//  NewsViewContoller.m
//  xCarDemo
//
//  Created by zx on 1/29/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "NewsViewContoller.h"
#import "NewsListItemCell.h"
#import "NewListItem.h"

@interface NewsViewContoller ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation NewsViewContoller
{
    UIView *_indexBarView;
    UITableView *_leftTableView;
    UITableView *_rightTableView;
    NSMutableArray *_leftDataArray;
    NSMutableArray *_rightDataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createNavigationBar];
    [self createIndexBar];
    [self downloadData];
    [self createTableView];
}

-(void)downloadData{
    //下载数据
    [[NSNotificationCenter  defaultCenter] addObserver:self
                                              selector:@selector(downloadFinish)
                                                  name:kNEWS_LIST_NEWS
                                                object:nil];
    [[DownloadManager sharedDownloadManager] addDownloadWithDownloadStr:kNEWS_LIST_NEWS andDownloadType:cNNEWS_LIST_TYPE];
}

-(void)downloadFinish{
    _leftDataArray = [[NSMutableArray alloc ]init];
    _rightDataArray = [[NSMutableArray alloc]init];
    NSMutableArray *tempArray  = [[DownloadManager sharedDownloadManager]getDownloadDataWithDownloadStr:kNEWS_LIST_NEWS];
    for (int i = 0 ; i < tempArray.count; i++) {
        if (i%2==0) {
            [_leftDataArray addObject:[tempArray objectAtIndex:i]];
        }
        else{
            [_rightDataArray addObject:[tempArray objectAtIndex:i]];
        }
    }
    [_leftTableView reloadData];
    [_rightTableView reloadData];
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
    
    _rightTableView  = [[UITableView alloc]initWithFrame:
                       CGRectMake(160,
                                  64+_indexBarView.frame.size.height,
                                  160,
                                  self.view.frame.size.height-64-_indexBarView.frame.size.height)
                                                  style:UITableViewStylePlain];
    _rightTableView.delegate = self;
    _rightTableView.dataSource = self;
    _rightTableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_rightTableView];
    
}

#pragma mark 表视图代理方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _leftTableView)
        return [_leftDataArray count];
    else

        return [_rightDataArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        static NSString *identifier = @"cell";
        NewsListItemCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            //cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell = [[[NSBundle mainBundle]loadNibNamed:@"NewsListItemCell" owner:self options:nil] lastObject];
        }
        return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //高度 = 图片高度+空白高度+文字高度+空白高度+ 时间/评论高度+ 空白高度
    if (_leftDataArray.count >0 && _rightDataArray.count > 0 ) {
        NewListItem *listItem;
        if (tableView == _leftTableView) {
            listItem = [_leftDataArray objectAtIndex:indexPath.row];
        }
        else{
            listItem = [_rightDataArray objectAtIndex:indexPath.row];
        }
        CGFloat height = 0.0f;
        height = height + [listItem.img_h_small floatValue];
        height = height + 10.0f;
        
        CGSize tilteSize = [listItem.newsTitle  sizeWithFont:[UIFont systemFontOfSize:20]
                                           constrainedToSize:CGSizeMake(140, 1000) lineBreakMode:NSLineBreakByCharWrapping];
        height  = height + tilteSize.height;
        height  = height + 15.0f + 20.f + 20.f;
        NSLog(@"%s [LINE:%d] %.f", __func__, __LINE__,height);
        return height;
    }
    else
        return 44.0f;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //设置最大偏移量
    _leftTableView.contentSize = _leftTableView.contentSize.height > _rightTableView.contentSize.height? _leftTableView.contentSize : _rightTableView.contentSize;
    
    _rightTableView.contentSize = _leftTableView.contentSize.height > _rightTableView.contentSize.height ?
    _leftTableView.contentSize : _rightTableView.contentSize;
    
    if (scrollView == _leftTableView) {
        _rightTableView.contentOffset = _leftTableView.contentOffset;
    }
    else{
        _leftTableView.contentOffset = _rightTableView.contentOffset;
    
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
