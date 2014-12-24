//
//  ZXViewController.m
//  1223_exercisev1
//
//  Created by zx on 12/23/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXViewController.h"
#import "ZXTableData.h"
#import "ZXCustomUITableView.h"

@interface ZXViewController ()
@property (nonatomic,strong)  ZXTableData *tableData;
@property (nonatomic,strong)  ZXCustomUITableView *tableView;
@end

@implementation ZXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadTableView];
    [self loadNavigationItem];
}
-(void)loadNavigationItem{
    
    UIButton *deleteButton = [UIButton buttonWithType:UIButtonTypeSystem];
    deleteButton.frame = CGRectMake(0, 0, 80, 40);
    [deleteButton setTitle:@"delete" forState:UIControlStateNormal];
    UIBarButtonItem *deleteButtonItem = [[UIBarButtonItem alloc]initWithCustomView:deleteButton];
    [deleteButton addTarget:self action:@selector(deleteButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeSystem];
    addButton.frame = CGRectMake(0, 0, 80, 40);
    [addButton setTitle:@"add" forState:UIControlStateNormal];
    UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc]initWithCustomView:addButton];
    [addButton  addTarget:self action:@selector(addButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItems = @[deleteButtonItem,addButtonItem];
}
-(void)deleteButtonClicked:(UIButton *)button{
    
    UIButton *btn = (UIButton *)self.navigationItem.rightBarButtonItems[1];
    
    if (self.tableView.editing == NO) {
        [button setTitle:@"done" forState:UIControlStateNormal];
        btn.enabled = NO;
    }
    else{
        [button setTitle:@"delete" forState:UIControlStateNormal];
        btn.enabled = YES;
    }
    self.tableView.editing = !self.tableView.editing;
}

-(void)addButtonClicked:(UIButton *)button{
    
    UIButton *btn = (UIButton *)self.navigationItem.rightBarButtonItems[0];
    btn.enabled = NO;
    
    //跳转到修改/增加页面.
}

# pragma  mark 通知方法:
-(void)viewWillAppear:(BOOL)animated{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(do_deleteRow:)name:@"deleteRow" object:nil];
    [center addObserver:self selector:@selector(do_modifyRow:)name:@"modifyRow" object:nil];
}
# pragma  mark  删除表格的某行
-(void)do_deleteRow:(NSNotification *)notificaiton{
    NSIndexPath *indexPath = (NSIndexPath *) notificaiton.userInfo[@"Key_indexPath"];
    
    [self.tableData.name_Marray removeObjectAtIndex:indexPath.row];
    [self.tableData.sex_Marray removeObjectAtIndex:indexPath.row];
    [self.tableData.telephone_Marray removeObjectAtIndex:indexPath.row];
    [self.tableData.ID_Marray removeObjectAtIndex:indexPath.row];
    [self refreshTable];
}
# pragma  mark  修改表格的一个行
-(void)do_modifyRow:(NSNotification *)notificaiton{
    NSString *nameString = (NSString *) notificaiton.userInfo[@"name_key"];
    NSString *sexString = (NSString *) notificaiton.userInfo[@"sex_key"];
    NSString *teleString = (NSString *) notificaiton.userInfo[@"tele_key"];
    NSString *idString = (NSString *) notificaiton.userInfo[@"id_key"];
    
    NSLog(@"%s [LINE:%d]name=%@,\nsex=%@,tele=%@,id=%@", __func__, __LINE__,nameString,sexString,teleString,idString);
}

# pragma  mark  刷新表格
-(void)refreshTable{
    self.tableView.name_Marray = [[NSMutableArray alloc]initWithArray:self.tableData.name_Marray];
    self.tableView.sex_Marray = [[NSMutableArray alloc]initWithArray:self.tableData.sex_Marray];
    self.tableView.telephone_Marray = [[NSMutableArray alloc]initWithArray:self.tableData.telephone_Marray];
    self.tableView.ID_Marray = [[NSMutableArray alloc]initWithArray:self.tableData.ID_Marray];
    [self.tableView reloadData];
}

#pragma  mark 加载表格
-(void)loadTableView{
     self.tableData = [[ZXTableData alloc]init];
    [self.tableData loadTableData];
    self.tableView= [[ZXCustomUITableView alloc]initWithFrame:CGRectMake(0,
                                                                                      0,
                                                                                      320,
                                                                                      self.view.frame.size.height)
                                                                     style:UITableViewStylePlain];
    self.tableView.name_Marray = [[NSMutableArray alloc]initWithArray:self.tableData.name_Marray];
    self.tableView.sex_Marray = [[NSMutableArray alloc]initWithArray:self.tableData.sex_Marray];
    self.tableView.telephone_Marray = [[NSMutableArray alloc]initWithArray:self.tableData.telephone_Marray];
    self.tableView.ID_Marray = [[NSMutableArray alloc]initWithArray:self.tableData.ID_Marray];
    [self.view addSubview:self.tableView];
}

@end
