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
#import "UIImageView+WebCache.h"


@interface NewsViewContoller ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation NewsViewContoller
{
    UIView *_indexBarView;
    UITableView *_leftTableView;
    UITableView *_rightTableView;
    NSMutableArray *_leftDataArray;
    NSMutableArray *_rightDataArray;
    
    NSMutableArray *_interfaceArray;
    int _downloadIndex;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _interfaceArray = [[NSMutableArray alloc]initWithObjects:kNEWS_LIST_NEWS,kNEWS_LIST_CAR,kNEWS_LIST_BUY,kNEWS_LIST_COMMENT,kNEWS_LIST_PRICE, nil];
    
    [self createNavigationBar];
    [self createIndexBar];
//    [self downloadData];
    _downloadIndex = 0;
    [self downloadDataWithIndex:_downloadIndex];
    [self createTableView];
}



-(void)downloadDataWithIndex:(int)index{
    //下载数据
    int type =  index==4 ? cNNEWS_LIST_PRICE_TYPE :cNNEWS_LIST_TYPE;
    
    [[NSNotificationCenter  defaultCenter] addObserver:self
                                              selector:@selector(downloadFinish)
                                                  name:[_interfaceArray objectAtIndex:index]
                                                object:nil];
    [[DownloadManager sharedDownloadManager] addDownloadWithDownloadStr:[_interfaceArray objectAtIndex:index]andDownloadType:type andItemIndex:[NSString stringWithFormat:@"%d",index]];
}

-(void)downloadFinish{
    
    
    NSLog(@"%s [LINE:%d] %@", __func__, __LINE__,[_interfaceArray objectAtIndex:_downloadIndex]);
    //取消通知
    [[NSNotificationCenter defaultCenter]removeObserver:self name:[_interfaceArray objectAtIndex:_downloadIndex] object:nil];
    
    _leftDataArray = [[NSMutableArray alloc ]init];
    _rightDataArray = [[NSMutableArray alloc]init];
    
    
    //清空数组
    //[_leftDataArray removeAllObjects];
    //[_rightDataArray removeAllObjects];
    
    
    NSMutableArray *tempArray  = [[DownloadManager sharedDownloadManager]getDownloadDataWithDownloadStr:[_interfaceArray objectAtIndex:_downloadIndex]];

    
    if (_downloadIndex == 4) {
        
        //数据源
        for (int i = 0 ; i < tempArray.count; i++) {
            [_rightDataArray addObject:[tempArray objectAtIndex:i]];
        }
        
        //更改frame;
        _rightTableView.frame = CGRectMake(0,
                                           64+_indexBarView.frame.size.height,
                                           320,
                                           self.view.frame.size.height-64-_indexBarView.frame.size.height);
    }
    else{

        //数据源
        for (int i = 0 ; i < tempArray.count; i++) {
            if (i%2==0) {
                [_leftDataArray addObject:[tempArray objectAtIndex:i]];
            }
            else{
                [_rightDataArray addObject:[tempArray objectAtIndex:i]];
            }
        }
        
        //还原frame;
        _rightTableView.frame = CGRectMake(160,
                                           64+_indexBarView.frame.size.height,
                                           160,
                                           self.view.frame.size.height-64-_indexBarView.frame.size.height);
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
    _leftTableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f];
    //表视图的分割线
    [_leftTableView setSeparatorColor:[UIColor clearColor]];
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
    _rightTableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f];
    [_rightTableView setSeparatorColor:[UIColor clearColor]];
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
    if (_downloadIndex == 4) {
        static NSString *identifier = @"defaultcell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.textLabel.text = ((NewListItem *)[_rightDataArray objectAtIndex:indexPath.row]).newsTitle;
        return cell;
    }
    else{
        static NSString *identifier = @"cell";
        NewsListItemCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            //cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell = [[[NSBundle mainBundle]loadNibNamed:@"NewsListItemCell" owner:self options:nil] lastObject];
            //cell选中变色
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        //cell控件重新布局
        //需要重新给控件设置frame
        
        NewListItem *nli;
        if (tableView == _leftTableView) {
            nli = [_leftDataArray objectAtIndex:indexPath.row];
        }
        else{
            nli = [_rightDataArray objectAtIndex:indexPath.row];
        }
        cell.baseView.frame = CGRectMake(5, 0, 150, 0);
        cell.iconImageView.frame = CGRectMake(0, 0, 150, [nli.img_h_small floatValue]);
        [cell.iconImageView setImageWithURL:[NSURL URLWithString:nli.newsImg_small]];
        
        
        //动态计算文字高度
        //动态计算cell高度
        CGSize tilteSize = [nli.newsTitle  sizeWithFont:[UIFont systemFontOfSize:20]
                                      constrainedToSize:CGSizeMake(140, 1000) lineBreakMode:NSLineBreakByCharWrapping];
        cell.titleLabel.frame = CGRectMake(5, cell.iconImageView.frame.size.height+10.f, 140, tilteSize.height);
        cell.titleLabel.text = nli.newsTitle;
        
        cell.dateLabel.frame = CGRectMake(5, cell.titleLabel.frame.origin.y+cell.titleLabel.frame.size.height+15.f, 80, 20);
        
        //日期格式转换
        //时间戳==>时间
        //时间戳,1970到现在的秒数.
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
        //    [dateFormatter setDateFormat:@"yyyy年MM月dd HH:mm:ss"];
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSDate *theday = [NSDate dateWithTimeIntervalSince1970:[nli.createDate intValue]];
        
        cell.dateLabel.text = [dateFormatter stringFromDate:theday];;
        
        cell.commentImageView.frame = CGRectMake(95, cell.titleLabel.frame.origin.y+cell.titleLabel.frame.size.height+15.f+ 3.f, 16, 16);
        
        cell.commentLabel.frame = CGRectMake(115, cell.titleLabel.frame.origin.y+cell.titleLabel.frame.size.height+15.f, 25, 20);
        cell.commentLabel.text = nli.comment;
        
        cell.baseView.frame = CGRectMake(5, 0, 150, cell.commentLabel.frame.origin.y+cell.commentLabel.frame.size.height + 15.f);
        return cell;
    }
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
    
    //新的下载
    _downloadIndex = button.tag -1;
    [self downloadDataWithIndex:_downloadIndex];
}
@end
