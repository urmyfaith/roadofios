//
//  MainViewController.m
//  UITalbleView_HiddenSection
//
//  Created by zx on 1/27/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MainViewController
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    NSMutableDictionary *_isHiddenSections;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createTableView];
    
    [self loadTableViewData];
}

-(void)createTableView{
    
    _tableView = [[UITableView alloc]init];
    _tableView.frame = self.view.bounds;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    UIView *customHeadView = [[UIView alloc]init];
    customHeadView.frame = CGRectMake(0, 0, 320, 100);
    _tableView.tableHeaderView = customHeadView;
}

-(void)loadTableViewData{
    
    
    _isHiddenSections = [[NSMutableDictionary alloc]init];
    _dataArray = [[NSMutableArray alloc] init];
    int i,j;
    for (i = 'A'; i <= 'Z'; i++) {
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (j = 0 ; j < 5; j++) {
            [array addObject:[NSString stringWithFormat:@"%c%d",i,j]];
        }
        [_dataArray addObject:array];
    }
    
    [_tableView reloadData];
}

#pragma mark UItableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_dataArray count];
}




-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = [[_dataArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDetailButton;
    return cell;
}

#pragma mark  ----->组头

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 42;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[[UIImage imageNamed:@"section"] stretchableImageWithLeftCapWidth:10 topCapHeight:10]
                      forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(buttonClicked:)
     forControlEvents:UIControlEventTouchUpInside];
    
    NSString *groupTitle_string = [NSString stringWithFormat:@"第%02ld组",section];
    [button setTitle:groupTitle_string forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.tag = section + 100;
    
    return button;
}

/**
 *  点击按钮方法
 *  将tag值存入字典.
 *  第一次点击,根据key,没有值====>存入字典===>字典有值===>隐藏对应的分组
 *  字典有值===>从字典删除====>字典没有值===>展开对应的分组.
 *
 *  @param button <#button description#>
 */
-(void)buttonClicked:(UIButton *)button{
    
    NSString *key = [NSString stringWithFormat:@"%ld",button.tag];
    
    if (![_isHiddenSections objectForKey:key]) {
        [_isHiddenSections setObject:@"YES" forKey:key];
    }else{
        [_isHiddenSections removeObjectForKey:key];
    }
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex:button.tag-100]
              withRowAnimation:UITableViewRowAnimationFade];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key = [NSString stringWithFormat:@"%ld",section+100];
    if ([_isHiddenSections objectForKey:key]) {
        return 0;
    }
    return [[_dataArray objectAtIndex:section] count];
}

@end
