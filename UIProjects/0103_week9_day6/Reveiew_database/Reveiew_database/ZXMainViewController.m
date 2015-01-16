//
//  ZXMainViewController.m
//  Reveiew_database
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXMainViewController.h"
#import "ZXArticleModel.h"

@interface ZXMainViewController ()

@end

@implementation ZXMainViewController
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    int _currentIndex;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    _currentIndex = 0;
    
    
    _dataArray = [[NSMutableArray alloc]init];
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    UIBarButtonItem *leftBBI = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                target:self
                                action:@selector(lefBBIClicked)];
    
    UIBarButtonItem *rigthBBI = [[UIBarButtonItem alloc]
                                 initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks
                                 target:self
                                 action:@selector(rightBBIClicked)];
    
    self.navigationItem.leftBarButtonItem = leftBBI;
    self.navigationItem.rightBarButtonItem  = rigthBBI;
 
#pragma mark  ----// 下载数据
    
    if ([[ZXDatabaseManager sharedDatabaseManager]selectAticleCount]) {
        [self getData];
    }
    else{
    
        [[NSNotificationCenter defaultCenter]addObserver:self
                                                selector:@selector(downloadFinished)
                                                    name:zFIRESTPAGE_URL
                                                  object:nil];
        [[DownloadManager sharedDownloadManager]addDownloadWithDownloadStr:zFIRESTPAGE_URL andDownloadType:0];
    }

}

/**
 *  下载完成,解析数据==>数据模型==>存入数组
 */
-(void)downloadFinished{

    
    NSData *data =   [[DownloadManager sharedDownloadManager]getDataArrayWithDownloadStr:zFIRESTPAGE_URL];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *array = [NSMutableArray array];
    int articleIndex = 0;
    NSArray *columnsArray = [dic objectForKey:@"columns"];
    
    for (id subDic in columnsArray) {
        if ([subDic isKindOfClass:[NSDictionary class]]) {
            
            NSArray *articlesArray = [subDic objectForKey:@"articles"];
            for (id articleDic in articlesArray) {
                if ([articleDic isKindOfClass:[NSDictionary class]]) {

                    ZXArticleModel *articleModel = [[ZXArticleModel alloc]init];
                    articleModel.articleId = [NSString stringWithFormat:@"%@",[articleDic objectForKey:@"id"]];
                    articleModel.articleTitle = [articleDic objectForKey:@"title"];
                    articleModel.articleIndex = articleIndex;
                    [array addObject:articleModel];
                }
            }
        }
        articleIndex++;
    }
    

    //数据存入数据库中.
    for (ZXArticleModel * articleModel in array) {
        [[ZXDatabaseManager sharedDatabaseManager]insertDataWithArticle:articleModel];
    }
    
    [self getData];
   NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

-(void)getData{
    _dataArray = [[ZXDatabaseManager sharedDatabaseManager]selectDataWithArticleIndex:_currentIndex%4];
    [_tableView reloadData];
    _currentIndex++;
    
}


/**
 *  取数据==>表格刷新;
 */
-(void)lefBBIClicked{
    
    //取数据==>表格刷新;
    
    [self getData];
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}
-(void)rightBBIClicked{
    //跳转页面;
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

#pragma mark 表视图-数据源

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = ((ZXArticleModel *)[_dataArray objectAtIndex:indexPath.row]).articleId;
    cell.detailTextLabel.text = ((ZXArticleModel *)[_dataArray objectAtIndex:indexPath.row]).articleTitle;
    
    return cell;
}

@end
