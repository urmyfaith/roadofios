//
//  ZXFirstViewController.m
//  1229_storyboard01_basic
//
//  Created by zx on 12/29/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXFirstViewController.h"
#import "ZXSecondViewController.h"

@interface ZXFirstViewController ()

@end

@implementation ZXFirstViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

/**
 *  在跳转的两个页面之间传值
 *  在两个界面之间跳转的时候,系统会自动调用这个方法
 *  @return void
 */
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Get the current view controller using [segue sourceViewController];
    // Pass the selected object to the new view controller.
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    ZXSecondViewController *second =  [segue destinationViewController];
    second.string = self.firstLabel.text;
}


- (IBAction)buttonClicked:(UIButton *)sender {
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    
}
@end
