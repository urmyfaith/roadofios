//
//  RootViewController.m
//  xCarDemo
//
//  Created by zx on 1/28/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController



-(void)createMyNavigationBarWithTitle:(NSString *)tilteImage
                           andLeftBtn:(NSArray *)leftBtnArray
                          andRightBtn:(NSArray *)rightBtnArray{
    
    MyNavigationBar *mnb = [[MyNavigationBar alloc]init];
    mnb.frame = CGRectMake(0, 20, 320, 44);
    [mnb createMyNavigaitonBarWithTitleImag:tilteImage
                      andLeftBtnImagesNames:leftBtnArray
                     andRightBtnImagesNames:rightBtnArray
                                   andClass:self
                                     andSEL:@selector(buttonClick:)];
    [self.view addSubview:mnb];
}
-(void)buttonClick:(UIButton *)button{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.navigationController setNavigationBarHidden:YES];//属性是可以继承的
}
@end
