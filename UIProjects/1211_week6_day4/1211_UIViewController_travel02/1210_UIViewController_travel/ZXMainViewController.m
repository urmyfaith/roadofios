//
//  ZXMainViewController.m
//  1210_UIViewController_travel
//
//  Created by zx on 12/10/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ZXMainViewController.h"
#import "ZXAllMethod.h"
#import "ZXDetailViewController.h"
#import "ZXConfigViewController.h"
#import "ZXLoginViewController.h"

@interface ZXMainViewController ()<UIAlertViewDelegate>

@end


@implementation ZXMainViewController

-(NSArray *)imageNameArray{
    if (_imageNameArray == nil) {
        _imageNameArray = @[@"故宫",@"颐和园",@"鸟巢",@"水立方",@"天坛"];
    }
    return  _imageNameArray;
}




-(NSArray *)imageDescriptionArray{
    if (_imageDescriptionArray == nil) {
        _imageDescriptionArray = @[
                                   @"旧称为紫禁城。位于北京中轴线的中心，",
                                   @"北京市古代皇家园林，前身为清漪园",
                                   @"国家体育场是2008年北京奥运会的主场馆，由于于独",
                                   @"国家游泳中心位于北京奥林匹克公园内",
                                   @"世界文化遗产，全国重点文物保护单位"
                                   ];
    }
    return  _imageDescriptionArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //handel default name.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.name = [defaults objectForKey:@"userName"];
    if (self.name == nil) {
        self.name = @"黑客007";
    }
    
    UILabel *userName = [UILabel labelWithFrame:CGRectMake(0,30,200,40)
                                       withText:[self.name stringByAppendingString:@" 欢迎你"]
                                        withTag:101
                            withBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:userName];
    
    UIButton *configButton = [UIButton buttonWithFrame:CGRectMake(200, 30, 120, 40)
                                         withTitle:@"设置"
                                          withType:UIButtonTypeSystem
                                        withTarget:self
                                        withMethod:@selector(jumpIntoConfig)];
    configButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:configButton];
    
    for (int i = 1; i <= 5; i++) {

    //oneRow
    UIView *oneRow = [[UIView alloc]initWithFrame:CGRectMake(10, 80*i, 300, 71)];
    oneRow.backgroundColor = [UIColor grayColor];
    [oneRow.layer setMasksToBounds:YES];
    [oneRow.layer setCornerRadius:10];
    
    //image
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10,80*i,70,70)];
    imageView.image  = [UIImage imageNamed:[NSString stringWithFormat:@"smallImage%i",i]];
 
    [self.view addSubview:imageView];
    [self.view addSubview:oneRow];
    [self.view bringSubviewToFront:imageView];
    
    //imageName  Label
    UILabel *imageName = [UILabel labelWithFrame:CGRectMake(80,80*i,200,35)
                                        withText:self.imageNameArray[i-1]
                                        withTag:101
                            withBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:imageName];
    
    //imageDescription Label
    UILabel *imageDescription = [UILabel labelWithFrame:CGRectMake(80,80*i + 35,200,35)
                                        withText:self.imageDescriptionArray[i-1]
                                         withTag:101
                             withBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:imageDescription];
    
        
    //detail Button
    UIButton *detailButton = [UIButton buttonWithFrame:CGRectMake(80+200, 80*i, 35, 70)
                                             withTitle:@"详情"
                                              withType:UIButtonTypeSystem
                                            withTarget:self
                                            withMethod:@selector(jumpIntoDetail:)];
    detailButton.tag = i;
    detailButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:detailButton];
    }
}

-(void)jumpIntoConfig{
    
    ZXConfigViewController *configView = [[ZXConfigViewController alloc]init];
    
    configView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    [ self presentViewController:configView animated:YES completion:nil];

}

/**
 *  jume to view
 *  transfer data cross viewController by button's tag.
 *  @param button which button clicked?
 */
-(void)jumpIntoDetail:(UIButton *)button{
    ZXDetailViewController *detailView = [[ZXDetailViewController alloc]init];
    detailView.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    detailView.imageID =button.tag;
    [ self presentViewController:detailView animated:YES completion:nil];
}

-(void)viewDidAppear:(BOOL)animated{

    /**
     *  handel logout
     */
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger  signal = [defaults integerForKey:@"mySignal"];
    if (signal == 0) {
        NSArray *array = [self.view subviews];
        for (UIView *eachView in array) {
            [eachView removeFromSuperview];
        }
        UIAlertView *alert =[ [UIAlertView alloc]initWithTitle:@"提示" message:@"成功注销!\n请重新登录" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
        NSLog(@"确定");
}


//-(void)hiddenMainView{
//    [self performSelector:@selector(hiddenMainView:) withObject:nil  afterDelay:1];
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
