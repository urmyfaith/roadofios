//
//  ZXFindViewController.m
//  1216_UITabBarController02-do-it-self
//
//  Created by zx on 12/16/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXFindViewController.h"
#import "general_table_view.h"
#import "ZXAllMethod.h"

@interface ZXFindViewController ()
{
    general_table_view *table;
}
@end

@implementation ZXFindViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger isLogedIn = [defaults integerForKey:@"isLogedIn"];
    NSLog(@"%s [LINE:%d] isLogedIn=%i", __func__, __LINE__,isLogedIn);
    if (1 == isLogedIn) {
        [self view4LogedIn];
    }else{
        [self view4UnlogedIn];
    }
}

-(void)view4UnlogedIn{
    UIButton *loginButton = [UIButton buttonWithFrame:CGRectMake(60, 100, 200, 40)
                                            withTitle:@"登录后才能查看,去登录"
                                             withType:UIButtonTypeSystem
                                           withTarget:self
                                           withMethod:@selector(loginButoonClicked)];
    [self.view addSubview:loginButton];
}



-(void)view4LogedIn{
    table                       = [[general_table_view alloc]initWithFrame:CGRectMake(0,
                                                                                      20,
                                                                                      320,
                                                                                      self.view.frame.size.height - 20)
                                   //style:UITableViewStylePlain];
                                                                     style:UITableViewStyleGrouped];
    table.textLabel_MArray      = [[NSMutableArray alloc]initWithObjects:@"朋友圈",@"扫一扫",@"购物",@"游戏",nil];
    
    NSMutableArray *images      = [NSMutableArray array];
    NSMutableArray *subtitle    = [NSMutableArray array];
    
    //图片不够的时候,插入到数组会出现插入空对象的情况
    for (NSInteger index = 0 ; index < [table.textLabel_MArray count]; index++) {
        
        UIImage *image          = [UIImage imageNamed:[NSString stringWithFormat:@"tab_%i.png",index]];
        NSString *detail        = [NSString stringWithFormat:@"detail text %d",index + 1];
        [images addObject:image];
        [subtitle addObject:detail];
    }
    table.subtitle_MArray       = [[NSMutableArray alloc] initWithArray:subtitle];
    table.images_MArray         = [[NSMutableArray alloc] initWithArray:images];
    [self.view addSubview:table];
}

-(void)loginButoonClicked{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"createLoginView" object:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
