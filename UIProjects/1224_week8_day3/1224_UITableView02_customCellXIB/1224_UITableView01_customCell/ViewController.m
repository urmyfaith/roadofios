//
//  ViewController.m
//  1224_UITableView01_customCell
//
//  Created by zx on 12/24/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ViewController.h"
#import "ZXCityModel.h"
#import "ZXTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *citys;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,20, 320, 480-20) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
}

-(NSMutableArray *)citys{
    if (_citys == nil) {
        _citys = [NSMutableArray array];
        NSString *path = [[NSBundle mainBundle]pathForResource:@"citysMessages" ofType:@"plist"];
        
        NSMutableArray *array = [NSArray arrayWithContentsOfFile:path];
        for (NSDictionary *dic in array) {
      
#if 0
            ZXCityModel *cityModel = [[ZXCityModel alloc]init];
            cityModel.myName = dic[@"name"];
            cityModel.myDetail = dic[@"detail"];
            cityModel.myImageName = dic[@"image01"];
#endif
            ZXCityModel *cityModel = [ZXCityModel cityWithDic:dic];
            [_citys  addObject:cityModel];
        }

    }
    return _citys;
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.citys count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZXTableViewCell *cell = [ZXTableViewCell cellWithTableView:tableView];
    cell.myModele = self.citys[indexPath.row];
    //static NSString *indentifier = @"cell";
    
    
#if 0
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:indentifier];
    }
#endif
   
   
    
#if 0
    ZXTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell ==nil) {
        cell = [[ZXTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:indentifier];
    }
#endif
    
    
//------------------
#if 0
    NSDictionary *dic = self.citys[indexPath.row];
    cell.textLabel.text = dic[@"name"];
    cell.detailTextLabel.text = dic[@"detail"];
    cell.imageView.image = [UIImage imageNamed:dic[@"image01"]];
#endif
    
#if 0
    ZXCityModel *model = self.citys[indexPath.row];
    cell.textLabel.text = model.myName;
    cell.detailTextLabel.text = model.myDetail;
    cell.imageView.image = [UIImage imageNamed:model.myImageName];
#endif
    
    
#if 0
    ZXCityModel *model = self.citys[indexPath.row];
    cell.nameLabel.text = model.myName;
    cell.detailTextLabel.text = model.myDetail;
    cell.myImageView.image = [UIImage imageNamed:model.myImageName];
#endif
    return cell;
}


@end
