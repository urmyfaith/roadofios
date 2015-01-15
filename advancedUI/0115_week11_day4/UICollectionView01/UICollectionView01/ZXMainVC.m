//
//  ZXMainVC.m
//  UICollectionView01
//
//  Created by zx on 1/15/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXMainVC.h"
#import "MyCell.h"

@interface ZXMainVC ()

@end

@implementation ZXMainVC

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
    
    //1.设置布局模式
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    //1.1设置item的大小(每个叫做item)
    [flowLayout setItemSize:CGSizeMake(72.5, 100)];
    
    //1.2设置排列方式(横向,纵向)==>系统自己排列
  //  [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    //2.实例化collectionView 控件
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [self.view addSubview:collectionView];
    
    //3.注册cell类型
    [collectionView registerClass:[MyCell class] forCellWithReuseIdentifier:@"cell"];
    
}

#pragma mark delegateMethod

//每组多少个item
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  10;
}

//设置分组数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    
    //如果复用池中没有,会自动实例化.
    MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.titleLabel.text = [NSString stringWithFormat:@"%d-%d",indexPath.section,indexPath.row];
    return cell;
}

//选中的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%s [LINE:%d]%i---%i", __func__, __LINE__,indexPath.section,indexPath.row);
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
