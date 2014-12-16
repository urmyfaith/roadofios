//
//  ZXDetailViewController.m
//  1210_UIViewController_travel
//
//  Created by zx on 12/10/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ZXDetailViewController.h"
#import "ZXAllMethod.h"

@interface ZXDetailViewController ()

@end

@implementation ZXDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSArray *imageNameArray = @[@"故宫",@"颐和园",@"鸟巢",@"水立方",@"天坛"];
    NSArray *imageDescriptionArray = @[
                                       @"旧称为紫禁城。位于北京中轴线的中心，是明、清两代的皇宫，占地面积约为72万平方米，建筑面积约为15万平方米，是世界上现存规模最大、保存最为完整的木质结构的宫殿型建筑。",
                                       @"颐和园，北京市古代皇家园林，前身为清漪园，坐落在北京西郊，距城区十五公里，占地约二百九十公顷，与圆明园毗邻。它是以昆明湖、万寿山为基址，以杭州西湖为蓝本",
                                       @"国家体育场是2008年北京奥运会的主场馆，由于于独特造型又俗称“鸟巢”。体育场在奥运会期间设有10万个座位，承办该届奥运会的开、闭幕式，以及田径同足球等比赛项目。",
                                       @"国家游泳中心又被称为“水立方”（Water Cube）位于北京奥林匹克公园内，它的设计方案，是经全球设计竞赛产生的“水的立方”（Water Cube ）方案。",
                                       @"天坛，在北京市南部，东城区永定门内大街东侧。占地约273万平方米。天坛始建于明永乐十八年（1420年），清乾隆、光绪时曾重修改建。为明、清两代帝王祭祀皇天、祈五谷丰登之场所。"
                                       ];
    //title
    UIButton *imageNameButton = [UIButton buttonWithFrame:CGRectMake(100, 25, 120, 40)
                                                withTitle:imageNameArray[self.imageID-1]
                                              withType:UIButtonTypeSystem
                                            withTarget:self
                                            withMethod:nil];
    imageNameButton.userInteractionEnabled = NO;
    imageNameButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:imageNameButton];
    
    //image
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30,80,260,200)];
    
    imageView.image  = [UIImage imageNamed:[NSString stringWithFormat:@"bigImage%i",self.imageID]];
    [self.view addSubview:imageView];
    
    //imageDetail
    UILabel *imageDetail = [UILabel labelWithFrame:CGRectMake(30,300,260,0)
                                       withText:imageDescriptionArray[self.imageID-1]
                                           withTag:100
                            withBackgroundColor:[UIColor whiteColor]];
    imageDetail.numberOfLines = 0;
    [imageDetail sizeToFit];
    [self.view addSubview:imageDetail];
    
    //back to main Button
    UIButton *backButton = [UIButton buttonWithFrame:CGRectMake(220, 425, 60, 40)
                                           withTitle:@"返回"
                                            withType:UIButtonTypeSystem
                                          withTarget:self
                                          withMethod:@selector(backToMain)];
    [self.view addSubview:backButton];
}

-(void)backToMain{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



@end
