//
//  FashionViewController.m
//  FashionShow
//
//  Created by zx on 15/2/3.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "FashionViewController.h"

/*==========瀑布流===========*/
#import "ZXWaterflowView.h"
#import "ZXWaterflowViewCell.h"

@interface FashionViewController ()<ZXWaterflowViewDataSource,ZXWaterflowViewDelegate>
@property (nonatomic,strong) NSMutableArray    *models_mArray;
@end


/**
 时装页面:分为 美搭 和 导购
 美搭和导购的接口API仅仅是sa参数不同:MD/DG
 可以共用一个瀑布流界面
 */
@implementation FashionViewController
{
    ZXWaterflowView *_waterflowView;
}

#pragma mark lazy-load-array
-(NSMutableArray *)models_mArray{
    if (nil == _models_mArray) {
        _models_mArray = [[NSMutableArray alloc]init];
    }
    return _models_mArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createWaterfallFlow];
    [_waterflowView reloadData];
}

-(void)createWaterfallFlow{
    _waterflowView = [[ZXWaterflowView alloc]init];
    _waterflowView.frame = CGRectMake(0,
                                      zxStatusBar_NavigatinBar_HEIGHT,
                                      self.view.frame.size.width,
                                      self.view.frame.size.height -zxStatusBar_NavigatinBar_HEIGHT);
    _waterflowView.delegate = self;
    _waterflowView.dataSource = self;
    [self.view addSubview:_waterflowView];
}

#pragma mark ZXWaterflowView Delegate & DataSoucre 

-(NSUInteger)numberOfCellsInWaterflowView:(ZXWaterflowView *)waterflowView{
    return 100;
}

-(ZXWaterflowViewCell *)waterflowView:(ZXWaterflowView *)waterflowView cellAtIndex:(NSUInteger)index{
    static    NSString *identifier = @"cell";
    
    ZXWaterflowViewCell *cell = [waterflowView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[ZXWaterflowViewCell alloc]init];
        cell.identifier = identifier;
    }
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

@end
