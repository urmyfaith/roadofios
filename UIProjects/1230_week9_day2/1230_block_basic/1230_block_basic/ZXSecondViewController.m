//
//  ZXSecondViewController.m
//  1230_block_basic
//
//  Created by zx on 12/30/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXSecondViewController.h"
#import "ZXCustomButton.h"

@interface ZXSecondViewController ()

@end

@implementation ZXSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor grayColor]];
    self.mySecondBlock(40);
    
    ZXCustomButton *button = [ZXCustomButton buttonWithFrame:CGRectMake(100, 100, 100, 40) title:@"back" andBlock:^{
        [self dismissViewControllerAnimated:YES completion:^{
            NSLog(@"%s [LINE:%d] back completed.", __func__, __LINE__);
        }];
    }];
    [self.view addSubview:button];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
