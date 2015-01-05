//
//  ViewController.m
//  0103_QQ
//
//  Created by zx on 1/3/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ViewController.h"

#import "ZXDatabase.h"

#import "ZXMessageModel.h"
#import "ZXUserModel.h"


#import "ZXMessageCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) ZXDatabase     *qqDB;
@property (nonatomic,strong) NSMutableArray         *meassages_Marray;
@property (nonatomic,strong) NSMutableArray         *users_Marray;
@property (nonatomic,strong) UITableView    *tableView;
@end

@implementation ViewController

#pragma mark -------对象的懒加载

-(NSMutableArray *)meassages_Marray{
    if (_meassages_Marray == nil) {
        _meassages_Marray = [NSMutableArray array];
    }
    return _meassages_Marray;
}

-(NSMutableArray *)users_Marray{
    if (_users_Marray == nil) {
        _users_Marray = [NSMutableArray array];
    }
    return _users_Marray;
}

-(ZXDatabase *)qqDB{
    if (_qqDB == nil) {
        _qqDB = [ZXDatabase shardInstance];
    }
    return  _qqDB;
}

#pragma mark -------程序入口

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self loadTableData];
    [self loadUI];

}

-(void)loadUI{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 320, self.view.frame.size.height) style:UITableViewStylePlain];
     self.tableView.backgroundColor = [UIColor colorWithRed:250./255. green:250./255. blue:250./255 alpha:0.5];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
   // self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
   
    [self.tableView reloadData];
}

#pragma mark -------UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.meassages_Marray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger rowNumber = indexPath.row;
    
    ZXMessageCell *cell = [ZXMessageCell cellWithTableView:tableView];
    cell.messageModel = self.meassages_Marray[rowNumber];
    cell.userModel = self.users_Marray[[self.meassages_Marray[rowNumber] userId] -1];
    
    cell.backgroundColor = [UIColor colorWithRed:250./255. green:250./255. blue:250./255 alpha:0.5];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];//选中行的样式--->为nil的时候,无法选中.
    return  cell;
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     NSInteger rowNumber = indexPath.row;
    if ([self.meassages_Marray[rowNumber] isTimeMessage]) {
        return 44;
    }
    else
    {
        // 计算自适应后的高度:
        NSString *content  =  [self.meassages_Marray[rowNumber] messageContent];
        CGFloat contentHeight = [self conentHeightWithSize:17.0 width:180.0 stirng:content];
       // NSLog(@"%s [LINE:%d]row=%i,contentHeight=%.f", __func__, __LINE__,rowNumber,contentHeight);
        return 5+5 + contentHeight+5+5;
    }
    return 44;
}

//得到内容的自适应高度.
-(CGFloat)conentHeightWithSize:(CGFloat)size
                         width:(CGFloat)width
                        stirng:(NSString *)string{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]} context:nil];
    return rect.size.height;
}



#pragma mark -------加载表格数据源:消息数组,用户数组.

-(void)loadTableData{
    
    [self loadDataToMessagesArray];
    [self loadDataToUsersArray];
    
    //----测试用,数据源是否加载成功.
    //NSLog(@"%s [LINE:%d]meassages_Marray = %@ ,\n users_Marray=%@",
    //      __func__, __LINE__,self.meassages_Marray,self.users_Marray);
}

-(void)loadDataToMessagesArray{
    
    NSString *messageSqlString          = @"select * from messageInfoTable";
    FMResultSet *messages_results       = [self.qqDB.database executeQuery:messageSqlString];
    while (messages_results.next) {
        ZXMessageModel *messageModel    = [ZXMessageModel modelWithOneRowResult:messages_results];
        [self.meassages_Marray addObject:messageModel];
    }
}

-(void)loadDataToUsersArray{
    
    NSString *userSqlString     = @"select * from userInfoTable";
    FMResultSet *users_results  = [self.qqDB.database executeQuery:userSqlString];
    while (users_results.next) {
        ZXUserModel *userModel  = [ZXUserModel modelWithUserResult:users_results];
        [self.users_Marray addObject:userModel];
    }
}


#pragma mark -------内存不足处理
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end


