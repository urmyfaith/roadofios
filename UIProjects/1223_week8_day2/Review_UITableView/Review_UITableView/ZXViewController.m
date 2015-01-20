//
//  ZXViewController.m
//  Review_UITableView
//
//  Created by zx on 1/14/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXViewController.h"

@interface ZXViewController ()

@end

@implementation ZXViewController

{
    NSInteger _sum ;
    NSMutableArray *_dataArray;
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
    // Do any additional setup after loading the view.
    
    _dataArray = [[NSMutableArray alloc]init];
    for (int i = 0 ; i < 26 ; i++) {
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (int j = 0 ; j < 10; j++) {
            NSString *str = [NSString stringWithFormat:@"%c-%d",'A'+i,j];
            [array addObject:str];
        }
        [_dataArray addObject:array];
    }
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    //开启自带的编辑按钮
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    //设置头视图和脚视图
    tableView.tableFooterView = nil;
    tableView.tableHeaderView = nil;
    
    //得到当前屏幕上可见的所有cell对象
    NSArray *cell = [tableView visibleCells];
}

#pragma mark UITableDataSourceDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_dataArray count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [[_dataArray objectAtIndex:section] count];
}

/*
 
 每当我们看到一行的时候,行中的cell先不实例化,而是去当前的tableview的复用池中去想训中是否有对对应吧标签的cell对象,如果有则直接拿来使用.
 
 如果没有,则实例化cell,并打上cell.当某一行滚动出屏幕的是时候,我们中的cell不会被释放,而是放在talbeView的复用池中等待被复用.
 
 cell的复用打大节省了内存,缺点是被复用出来的clel会带有之前设置的值,所以在每次使用复用的cell的时候,需要进行内容的清空操作或者是重新赋值.
 
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        _sum += 1;
        NSLog(@"%s [LINE:%d] sum=%i", __func__, __LINE__,_sum);
    }
    //自带的三个控件
    cell.textLabel.text = [[_dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"subTitle";
    cell.imageView.image = nil;
    
    //cell选中的风格
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    //设置功能按键:不是所有的都可以点击
    //点击触发:-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
    // cell.accessoryType = UITableViewCellAccessoryCheckmark;
    //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.accessoryType =     UITableViewCellAccessoryDetailButton;

    
    return cell;
}

//当某一行被点击的时候调用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   
    //自动反选(取消选择了之后,就不会调用tableView:didDeselectRowAtIndexPath:方法了.
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //选择动画
    //[tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
}

//当某一行被取消点击的时候嗲用.
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}


// 开启TableView编辑和提交编辑
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

//cell的功能按钮的点击事件.
-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

//设置头标
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [NSString stringWithFormat:@"%c",'A'+section];
}

//设置脚标
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"footer";
}

//自定义头视图和脚视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

//设置索引条
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    [array addObject:@"new"];
    for (int i = 0 ; i < 26; i++) {
        NSString *str = [NSString stringWithFormat:@"%c",'A'+i];
        [array addObject:str];
    }
    return array;
}

//设置索引条的对应关系
//索引条点击跳转到section跟名字是没有关系的,是按照下标进行对象的的.
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    if (index == 0) {
        return  -1;
    }
    else
        return index-1;
}


//设置行高(默认位44)
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

//设置头标高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 20.0f;
}

//设置脚标高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 20.0f;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
