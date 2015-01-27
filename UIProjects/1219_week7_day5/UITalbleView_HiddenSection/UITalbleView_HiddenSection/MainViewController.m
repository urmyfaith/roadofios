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
    NSMutableArray *_isArrowToRight;
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
    
    _isArrowToRight = [[NSMutableArray alloc]init];

    
    _isHiddenSections = [[NSMutableDictionary alloc]init];
    _dataArray = [[NSMutableArray alloc] init];
    int i,j;
    for (i = 'A'; i <= 'Z'; i++) {
        NSMutableArray *array = [[NSMutableArray alloc]init];
        for (j = 0 ; j < 5; j++) {
            [array addObject:[NSString stringWithFormat:@"%c%d",i,j]];
        }
        [_dataArray addObject:array];
        [_isArrowToRight addObject:@"NO"];
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
    
    UIView *headerView = [[UIView alloc]init];
    headerView.userInteractionEnabled = YES;
    headerView.tag = section + 100;
    
    UIImageView *backgourndView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 42)];
    backgourndView.image = [[UIImage imageNamed:@"section"] stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    [headerView addSubview:backgourndView];
    
    

    UILabel *headTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 40)];
    headTitle.center = CGPointMake(320/2, 42/2);
    headTitle.text =  [NSString stringWithFormat:@"第%02ld组",section];
    [headerView addSubview:headTitle];
    
    //26*40
    UIImage *arrow_image = [UIImage imageNamed:@"right"];
    UIImageView *rightArrow = [[UIImageView alloc]initWithFrame:
                               CGRectMake(320-15-26, 1, arrow_image.size.width, arrow_image.size.height)];
    rightArrow.tag = section + 200;
    if ([_isArrowToRight[section] isEqualToString:@"YES"]) {
          rightArrow.image = [UIImage imageNamed:@"right"];
    }
    else{
         rightArrow.image = [UIImage imageNamed:@"down"];
    }
    [headerView addSubview:rightArrow];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                         action:@selector(headViewTapped:)];
    [headerView addGestureRecognizer:tap];
    return headerView;
}

-(void)headViewTapped:(UITapGestureRecognizer *)tap{
    id tapView = [tap view];
    if([tapView isKindOfClass:[UIView class]]){
        NSString *key = [NSString stringWithFormat:@"%ld",((UIView *)tapView).tag];
        if (![_isHiddenSections objectForKey:key]) {
            [_isHiddenSections setObject:@"YES" forKey:key];
            [_isArrowToRight replaceObjectAtIndex:((UIView *)tapView).tag - 100 withObject:@"YES"];
        }else{
            [_isHiddenSections removeObjectForKey:key];
            [_isArrowToRight replaceObjectAtIndex:((UIView *)tapView).tag - 100 withObject:@"NO"];
        }
        [_tableView reloadSections:[NSIndexSet indexSetWithIndex:((UIView *)tapView).tag-100] withRowAnimation:UITableViewRowAnimationFade];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key = [NSString stringWithFormat:@"%ld",section+100];
    if ([_isHiddenSections objectForKey:key]) {
        return 0;
    }
    return [[_dataArray objectAtIndex:section] count];
}

@end
