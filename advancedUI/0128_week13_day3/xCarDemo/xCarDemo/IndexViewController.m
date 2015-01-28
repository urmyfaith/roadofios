//
//  IndexViewController.m
//  xCarDemo
//
//  Created by zx on 1/28/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "IndexViewController.h"
#import "MenuViewController.h"
#import "PPRevealSideViewController.h"


@interface IndexViewController ()

@end

@implementation IndexViewController

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

    
    MyNavigationBar *navigationBar  = [[MyNavigationBar alloc] init];
    navigationBar.frame  = CGRectMake(0, 20, 320, 44);
    [navigationBar createMyNavigaitonBarWithTitleImag:@"Index_Title_logo.png"
                                andLeftBtnImagesNames:@[@"Index_Btn_Setting.png",@"Index_Btn_Setting.png"]
                               andRightBtnImagesNames:@[@"Index_Head02.png",@"Index_Head02.png"]
                                             andClass:self
                                               andSEL:@selector(bbiClicked:)];
    [self.view addSubview:navigationBar];
}


-(void)bbiClicked:(UIButton *)bbi{
    MenuViewController *mvc = [[MenuViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:mvc];
    [self.revealSideViewController pushViewController:nav onDirection:PPRevealSideDirectionLeft animated:YES];
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
