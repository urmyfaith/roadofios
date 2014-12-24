//
//  ZXViewController.m
//  1223_UITableView03
//
//  Created by zx on 12/23/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXViewController.h"

@interface ZXViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) NSMutableArray *datas;
@property(nonatomic,strong) NSArray *sectionHeaderTitles;
@property(nonatomic,strong) NSArray *sectionFooterTitles;
@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,assign) BOOL isSelected;
//记录选中行的信息:
@property(nonatomic,strong) NSMutableArray *seleectedCellsIndexes;

@end

@implementation ZXViewController

-(NSMutableArray *)datas{
    if (nil == _datas) {
        _datas = [NSMutableArray array];
        
        NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"myfriend1",@"myfriend2",@"myfriend3",nil];
        
        NSMutableArray *array2 = [NSMutableArray arrayWithObjects:@"tom",@"jim",@"john",nil];
        
        NSMutableArray *array3 = [NSMutableArray arrayWithObjects:@"mom",@"dad",@"sister",nil];
        
        [_datas addObject:array1];
        [_datas addObject:array2];
        [_datas addObject:array3];
         
    }
    return _datas;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    /**
     例子:创建一个通讯录(有多个分组)
     *  1.表示数据
        2.创建表
        3.布局
        4.设置表头,表尾
        5.设置组头,组尾
        6.设置索引
        7.增删改查
     */
    
//    1.表示数据
//    2.创建表
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(10,20,300,480-20)
                                                         style:UITableViewStyleGrouped
                              ];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview: self.tableView];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
//    3.布局
//    4.设置表头,表尾
    UILabel *headLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0,300,50)];
    headLabel.backgroundColor = [UIColor redColor];
    headLabel.text = @"head";
    self.tableView.tableHeaderView = headLabel;
    
    UILabel *footLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,0,300,50)];
    footLabel.backgroundColor = [UIColor redColor];
    footLabel.text = @"head";
    self.tableView.tableFooterView = footLabel;
    
//    5.设置组头,组尾
    self.sectionHeaderTitles = @[@"friend",@"company",@"home"];
    self.sectionFooterTitles = @[@"very happy",@"work together",@"paly together"];
//    6.设置索引
        //6.1索引的颜色:背景颜色,字体颜色,索引条的颜色
    self.tableView.sectionIndexColor = [UIColor greenColor];//索引的字体的颜色
    self.tableView.sectionIndexBackgroundColor = [UIColor yellowColor];//索引的背景颜色
    self.tableView.sectionIndexTrackingBackgroundColor = [UIColor blackColor];//选中的颜色

//    7.增删改查
    //一般的程序都有导航栏.99%的软件都使用导航.
    
    
    // 按钮==>导航栏条目===>导航栏右侧条目
    UIButton *editButton = [UIButton buttonWithType:UIButtonTypeSystem];
    editButton.frame = CGRectMake(0, 0, 80, 40);
    [editButton setTitle:@"edit" forState:UIControlStateNormal];
//  [self.view addSubview:editButton];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:editButton];
    
    
    //增加按钮,一般在给表格增加/修改元素的时候,不是这样添加的,是通过跳转到下一页
    //在进行详细的信息编辑之后,之后返回,完成编辑.
    //将带有编辑状态的数据的行显示到表中.
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeSystem];
    addButton.frame = CGRectMake(0, 0, 80, 40);
    [addButton setTitle:@"add" forState:UIControlStateNormal];
    //  [self.view addSubview:editButton];
    UIBarButtonItem *addButtonItem = [[UIBarButtonItem alloc]initWithCustomView:addButton];
    
    //self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.rightBarButtonItems = @[addButtonItem,rightItem];//从右往左布局按钮
    
    [editButton addTarget:self action:@selector(editButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [addButton addTarget:self action:@selector(addButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    /*删除多行
     1.选中多行
     2.在点击完成的时候,将选中的行删除
     */
    //****************重要,使用数组的时候,一定要创建数据,不能是nil
   self.seleectedCellsIndexes = [NSMutableArray array];
}

-(void)editButtonClicked:(UIButton *)button{
    
    self.isSelected = NO;
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    
    UIButton *btn = (UIButton *)self.navigationItem.rightBarButtonItems[0];
    
    if (self.tableView.editing == NO) {
        [button setTitle:@"delete" forState:UIControlStateNormal];
        btn.enabled = NO;
        
        self.tableView.allowsMultipleSelectionDuringEditing = YES;
    }
    else{
        //完成删除操作:

#if 0
            for (NSInteger index = 0 ; index <[self.seleectedCellsIndexes count]; index++) {
                NSIndexPath *path = self.seleectedCellsIndexes[index];
                [self.datas[path.section] removeObject:self.datas[path.section][path.row]];
            }
#endif
            
#if 0
            for (NSIndexPath *path in self.seleectedCellsIndexes) {
                [self.datas[path.section] removeObject:self.datas[path.section][path.row]];
            }
#endif
        
#if 1
        for (NSIndexPath *path in self.seleectedCellsIndexes) {
            self.datas[path.section][path.row] = @"";
        }
        for (NSMutableArray *mutArray in self.datas) {
            [mutArray removeObject:@""];
        }
#endif
        
        
        
        if ([self.seleectedCellsIndexes count]!=0) {
            [self.seleectedCellsIndexes removeAllObjects];
            

        }

        [self.tableView reloadData];
        
        [button setTitle:@"edit" forState:UIControlStateNormal];
        btn.enabled = YES;
    }
    self.tableView.editing = !self.tableView.editing;
    
}

-(void)addButtonClicked:(UIButton *)button{
    self.isSelected = YES;
    UIButton *btn = (UIButton *)self.navigationItem.rightBarButtonItems[1];
    
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    if (self.tableView.editing == NO) {
        [button setTitle:@"done" forState:UIControlStateNormal];
        btn.enabled = NO;
    }
    else{
        [button setTitle:@"add" forState:UIControlStateNormal];
        btn.enabled = YES;
    }
    self.tableView.editing = !self.tableView.editing;
    
}

#pragma mark
#pragma mark UITableViewDelegate





#pragma mark 组头/组尾的高度
#if 0
//注意:如果只是写viewForHeaderInSection/viewForFooterInSection这两个方法,
//1. 高度是固定的.
//2. 第一组的组头被覆盖

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *groupHeader = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 100)];
    groupHeader.backgroundColor = [UIColor blueColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(120,5,120,40)];
    label.text = self.sectionHeaderTitles[section];
    
    [groupHeader addSubview:label];
    
    return groupHeader;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    
    UIView *groupFooter = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 100)];
    groupFooter.backgroundColor = [UIColor blueColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(120,5,120,40)];
    label.text = self.sectionFooterTitles[section];
    
    [groupFooter addSubview:label];
    return groupFooter;
}
#endif

//设置下面两个方法:====>设置组头的高度,组尾的高度===>第一组的组头不会被覆盖.
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 50;
}


#pragma mark 组头/组尾的标题
//此方法的优先级低于viewForFooterInSection/viewForHeaderInSection方法
//Header标题如果是小写的,会自动转换为大写
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return self.sectionFooterTitles[section];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.sectionHeaderTitles[section];
}




#pragma mark
#pragma  mark UITableViewDataSource 组数,行数,每行数据




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.datas count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.datas[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentifier = @"normal";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
        
    }
    //4.给cell添加数据
    NSArray *array = self.datas[indexPath.section];
    
    cell.textLabel.text = array[indexPath.row];
    
    return cell;
}


/**
 *  单击索引时执行的方法
 *
 *  @param tableView 表视图
 *  @param title     单击时候的title
 *  @param index     单击的时候的索引
 *
 *  @return 索引值
 */
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    NSLog(@"%s [LINE:%d] tilte=%@ index = %i", __func__, __LINE__,title,index);
    if (index == 0) {
        return -1 ;
    }
    
    return  index;
}

/**
 *  设置表的数据源-->索引
 *
 *  @param tableView 表视图
 *
 *  @return 表视图的索引集合--数据源
 */
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    return self.sectionHeaderTitles;
    return @[@"a",@"b",@"c"];
}

#pragma mark 删除/增加单元格
//某一行是否可以进行编辑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
#if 0
    if (indexPath.row == 0) {
        return NO;
    }
#endif
    
    return YES;
}

//在编辑状态的时候,进行的操作(插入,删除)
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //删除数据源中对应的数据
        [self.datas[indexPath.section] removeObjectAtIndex:indexPath.row];
        
    }
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        //1.将加载的数据行插入到表中
        //2.更新数据源===>更新服务器
        [self.datas[indexPath.section] insertObject:@"hello world" atIndex:indexPath.row];
        
    }
    //3.刷新表
    [tableView reloadData];
    
}

/*
 typedef NS_ENUM(NSInteger, UITableViewCellEditingStyle) {
 UITableViewCellEditingStyleNone,//移动
 UITableViewCellEditingStyleDelete,//删除
 UITableViewCellEditingStyleInsert//插入
 };
 */
//返回表的当前编辑状态(正在插入/正在删除)
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    //默认的返回值是删除
    //return UITableViewCellEditingStyleInsert;
    if (self.isSelected == YES) {
        return UITableViewCellEditingStyleInsert;
    }
    else{
        return UITableViewCellEditingStyleDelete;
    }
}



#pragma mark 移动单元格
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    //默认返回YES;
    return  YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    //1.取出当前的元素
    //    NSString *string = self.datas[sourceIndexPath.row];
    NSMutableArray *mutArray = self.datas[sourceIndexPath.section];
    NSString *string = mutArray[sourceIndexPath.row];
    //2.将其从原位置删除
    [mutArray removeObjectAtIndex:sourceIndexPath.row];
    
    //3.将其插入新位置
    NSMutableArray *newMutArray = self.datas[destinationIndexPath.section];
    [newMutArray insertObject:string atIndex:destinationIndexPath.row];
    //4.刷新表
    [tableView reloadData];
}

#pragma mark  选中多行/取消选中行
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.seleectedCellsIndexes addObject:indexPath];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    for (NSIndexPath *eachIndexPath in self.seleectedCellsIndexes) {
        
        //当位置信息相等的时候,从数组中移除.
        if ([indexPath compare:eachIndexPath] ==NSOrderedSame) {
            [self.seleectedCellsIndexes removeObject:eachIndexPath];
        }
    }
}

@end


