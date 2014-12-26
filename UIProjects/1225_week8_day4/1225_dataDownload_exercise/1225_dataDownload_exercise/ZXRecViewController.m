//
//  ZXRecViewController.m
//  1225_dataDownload_exercise
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXRecViewController.h"
#import "ZXHttpRequest.h"
#import "ZXConcertModel.h"
#import "ZXConcertTableViewCell.h"

@interface ZXRecViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) ZXHttpRequest       *httpRequest;
@property(nonatomic,strong) NSMutableArray      *concerts;
@property(nonatomic,strong) UITableView         *tabelView;
@end

@implementation ZXRecViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self downloadData];
    [self loadTableView];
}


-(void)downloadData{
    NSString *path = @"http://mapi.damai.cn/proj/HotProj.aspx?CityId=0&source=10099&version=30602";
    self.httpRequest = [[ZXHttpRequest alloc]initWithPath:path target:self andAction:@selector(downloadDataFinished:)];
}

-(void)downloadDataFinished:(ZXHttpRequest *)httpRequest{
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:httpRequest.downloadData options:NSJSONReadingMutableLeaves error:nil];
    NSLog(@"%s [LINE:%d] dic= %@", __func__, __LINE__,dic);
    
    //1.
    self.concerts = dic[@"list"];
    
    //2.
    [self.tabelView reloadData];
    
}

-(void)loadTableView{
    self.tabelView              = [[UITableView alloc]initWithFrame:
                                   CGRectMake(5, 20+44+40, 310, 480-(20+44+40+44))];
    self.tabelView.delegate     = self;
    self.tabelView.dataSource   = self;
    [self.view addSubview:self.tabelView];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_concerts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXConcertTableViewCell *cell = [ZXConcertTableViewCell cellWithTableView:tableView];
    ZXConcertModel *model = self.concerts[indexPath.row];
    cell.concertModel = model;
  //  NSLog(@"%s [LINE:%d] row=%i,%p", __func__, __LINE__,indexPath.row,cell);
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (480-(20+44+40+44))/3;
}


-(void)setConcerts:(NSMutableArray *)concerts{
    _concerts = [NSMutableArray array];
    for (NSDictionary *dic in concerts) {
        ZXConcertModel *concertModel = [ZXConcertModel concertModelWith:dic];
        [_concerts addObject:concertModel];
    }
}
@end
