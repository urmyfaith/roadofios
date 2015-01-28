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

    
    UIBarButtonItem *leftBBI = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(bbiClicked:)];
    self.navigationItem.leftBarButtonItem = leftBBI;
}


-(void)bbiClicked:(UIBarButtonItem *)bbi{
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
