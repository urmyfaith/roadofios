//
//  ZXMainViewController.m
//  1225_dataDownload01
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXMainViewController.h"
#import "ZXHttpRequest.h"
#import "ZXUserModel.h"
#import "ZXUserCell.h"


@interface ZXMainViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)    UITextView       *textView;
@property(nonatomic,strong)    ZXHttpRequest    *httpRequest;
@property(nonatomic,strong)    NSMutableArray   *users;
@property(nonatomic,strong)    UITableView      *tableView ;
@end

@implementation ZXMainViewController

////防止得到空指针nil
//-(NSMutableArray *)users{
//    if (_users == nil) {
//        _users = [NSMutableArray array];
//    }
//    return _users;
//}

-(void)setUsers:(NSMutableArray *)users{
    
    _users = [NSMutableArray array];
    for (NSDictionary *dic in users) {
        ZXUserModel *userModel = [ZXUserModel userModelWith:dic];
        [_users addObject:userModel];
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = @"http://10.0.8.8/sns/my/user_list.php?page=1&number=10";
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    self.httpRequest = [[ZXHttpRequest alloc] initWithRequest:request target:self andAction:@selector(downloadFinished:)];
    //[self loadUI];
    
    //如果立即打印数据的话
    //因为UI加载在主线程
    //下载数据是另开的线程
    //这两个线程是独立执行的,通知执行这两个线程.
    //由于下载需要时间,所以打印数据时,数据还没有被正确赋值,所以打印出来会是nil
    //[self performSelector:@selector(myPrint:) withObject:nil afterDelay:5];//等待下载完成.
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 320, 460) style:UITableViewStylePlain];
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}
-(void)myPrint:(id)test{
    NSLog(@"%s [LINE:%d] users=%@", __func__, __LINE__, self.users);

}

-(void)loadUI{
    self.textView = [[UITextView alloc]init];
    self.textView.backgroundColor = [UIColor grayColor];
    self.textView.frame = CGRectMake(10, 20, 300, 400);
    [self.view addSubview:self.textView];
}

-(void)downloadFinished:(ZXHttpRequest*)httpRequest{
    NSDictionary *dic =  [NSJSONSerialization JSONObjectWithData:httpRequest.downloadData
                                                         options:NSJSONReadingMutableContainers
                                                           error:nil];
//    NSLog(@"%s [LINE:%d] dic=%@", __func__, __LINE__,dic);
    self.users = dic[@"users"];
//  NSLog(@"%s [LINE:%d] users=%@", __func__, __LINE__, self.users);
    [self.tableView reloadData];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [self.users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZXUserCell *cell = [ZXUserCell cellWithTableView:tableView];
    //赋值;
    ZXUserModel *model = self.users[indexPath.row];
    cell.userModel = model;
    NSLog(@"%s [LINE:%d] row=%i,%p", __func__, __LINE__,indexPath.row,cell);
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

@end
