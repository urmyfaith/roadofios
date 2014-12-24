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
#import "ZXModifyOrAddViewController.h"

@interface ZXViewController ()
@property (nonatomic,strong)  ZXTableData *tableData;
@property (nonatomic,strong)  ZXCustomUITableView *tableView;
@end

/**
 *  完成表格视图的显示,修改按钮值得到.
 */
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
    NSInteger rowNumber = [self.tableData.name_Marray count] + 500;
    NSString *string4RowNumber = [NSString stringWithFormat:@"%i",rowNumber];
    NSArray *array4Row = [NSArray arrayWithObjects:@"",@"",@"",@"",string4RowNumber, nil];
    [self performSelector:@selector(createModifyOrAddView:) withObject:array4Row afterDelay:0.1];
}

# pragma  mark 通知方法:
-(void)viewWillAppear:(BOOL)animated{
     [super viewWillAppear:animated];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(do_deleteRow:)name:@"deleteRow" object:nil];
    [center addObserver:self selector:@selector(do_createView_modifyRow:)name:@"modifyRow" object:nil];
    [center addObserver:self selector:@selector(do_updateOrAddRow:) name:@"updateRow" object:nil];
}
# pragma  mark  删除表格的某行
-(void)do_deleteRow:(NSNotification *)notificaiton{
    NSIndexPath *indexPath = (NSIndexPath *) notificaiton.userInfo[@"Key_indexPath"];
    NSLog(@"%s [LINE:%d] row=%i", __func__, __LINE__,indexPath.row);
    [self.tableData.name_Marray removeObjectAtIndex:indexPath.row];
    [self.tableData.sex_Marray removeObjectAtIndex:indexPath.row];
    [self.tableData.telephone_Marray removeObjectAtIndex:indexPath.row];
    [self.tableData.ID_Marray removeObjectAtIndex:indexPath.row];
    [self refreshTable];
}
# pragma  mark  修改表格的一行
-(void)do_createView_modifyRow:(NSNotification *)notificaiton{
    NSString *nameString = (NSString *) notificaiton.userInfo[@"name_key"];
    NSString *sexString = (NSString *) notificaiton.userInfo[@"sex_key"];
    NSString *teleString = (NSString *) notificaiton.userInfo[@"tele_key"];
    NSString *idString = (NSString *) notificaiton.userInfo[@"id_key"];
    NSString *string4RowNumber = (NSString *) notificaiton.userInfo[@"string4RowNumber_key"];
    
    NSLog(@"%s [LINE:%d]name=%@,\nsex=%@,tele=%@,id=%@,string4RowNumber_key=%@", __func__, __LINE__,nameString,sexString,teleString,idString,string4RowNumber);
    NSArray *array4Row = [NSArray arrayWithObjects:nameString,sexString,teleString,idString,string4RowNumber, nil];

    [self performSelector:@selector(createModifyOrAddView:) withObject:array4Row afterDelay:0.1];

}

#pragma mark  updateRow

-(void) do_updateOrAddRow:(NSNotification *)notificaiton{
    
    NSArray *oneRowDataArray = (NSArray *)notificaiton.userInfo[@"array4Row_key"];
    NSLog(@"%s [LINE:%d] oneRowDataArray= %@", __func__, __LINE__,oneRowDataArray);
    NSInteger rowNumber = [oneRowDataArray[4] integerValue ] - 500;
    if (rowNumber == [self.tableData.name_Marray count]) {
        //添加一行
        [self.tableData.name_Marray addObject:oneRowDataArray[0]];
        [self.tableData.sex_Marray addObject:oneRowDataArray[1]];
        [self.tableData.telephone_Marray addObject:oneRowDataArray[2]];
        [self.tableData.ID_Marray addObject:oneRowDataArray[3]];
        UIButton *btn = (UIButton *)self.navigationItem.rightBarButtonItems[0];
        btn.enabled = YES;
    }
    else{
        [self.tableData.name_Marray replaceObjectAtIndex:rowNumber withObject:oneRowDataArray[0]];
        [self.tableData.sex_Marray replaceObjectAtIndex:rowNumber withObject:oneRowDataArray[1]];
        [self.tableData.telephone_Marray replaceObjectAtIndex:rowNumber withObject:oneRowDataArray[2]];
        [self.tableData.ID_Marray replaceObjectAtIndex:rowNumber withObject:oneRowDataArray[3]];
    }
    [self refreshTable];
}

#pragma  mark 创建修改/添加视图
-(void)createModifyOrAddView:(NSArray *)array{
    NSLog(@"%s [LINE:%d] array = %@", __func__, __LINE__,array);
    ZXModifyOrAddViewController *rowDetailView = [[ZXModifyOrAddViewController alloc] init];
    rowDetailView.nameTextFiled.text = array[0];
    rowDetailView.sexTextFiled.text = array[1];
    rowDetailView.telephoneTextFiled.text = array[2];
    rowDetailView.IDTextFiled.text = array[3];
    rowDetailView.sting4RowNumber  = array[4];
    [self.navigationController pushViewController:rowDetailView animated:NO];
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
    
    self.tableView.separatorColor = [UIColor redColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
}

@end
