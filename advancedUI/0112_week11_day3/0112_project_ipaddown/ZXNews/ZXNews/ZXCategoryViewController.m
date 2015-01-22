//
//  ZXCategoryViewController.m
//  ZXNews
//
//  Created by qianfeng on 15/1/12.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "ZXCategoryViewController.h"

@interface ZXCategoryViewController ()

@end

@implementation ZXCategoryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
     
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createeUI];
}
-(void)createeUI{
    NSArray *choices_array = @[@"全部",@"免费",@"限免",@"付费"];
    
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:choices_array];
    seg.frame = CGRectMake(40,150,200,40 );
    [seg setSelectedSegmentIndex:0];
    [seg addTarget:self
            action:@selector(segClicked:)
  forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:seg];
}

#pragma mark  分段控件
-(void)segClicked:(UISegmentedControl *)seg{
    NSArray *category_Array = @[@"all",@"free",@"pricedrop",@"paid"];
    NSString *priceString = category_Array[seg.selectedSegmentIndex];

    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"chanegPriceString"
                          object:self
                        userInfo:@{@"price":priceString}];
    
}
@end
