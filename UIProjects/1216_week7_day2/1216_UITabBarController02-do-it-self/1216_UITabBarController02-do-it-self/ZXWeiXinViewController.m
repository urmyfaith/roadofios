//
//  ZXWeiXinViewController.m
//  1216_UITabBarController02-do-it-self
//
//  Created by zx on 12/16/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXWeiXinViewController.h"
#import "tableView4WeiXin.h"

@interface ZXWeiXinViewController ()
{
    tableView4WeiXin *table;
}
@end

@implementation ZXWeiXinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    table                       = [[tableView4WeiXin alloc]initWithFrame:CGRectMake(0,
                                                                                      0,
                                                                                      320,
                                                                                      self.view.frame.size.height)
                                   //style:UITableViewStylePlain];
                                                                     style:UITableViewStyleGrouped];
    table.textLabel_MArray      = [[NSMutableArray alloc]initWithObjects:@"订阅号",@"小燕子",@"李开复",@"朋朋",@"北国骑士",@"简屋",@"土豆",nil];
    

    table.subtitle_MArray       = [[NSMutableArray alloc]initWithObjects:@"经纬创投:七条关于...",@"明天不上课...",@"我的病好啦!....",@"明天去哪里玩?",@"灭了中国移动,我们就可以幸福?",@"这个夜晚,很美.",@"教你如何做土豆泥,土豆...",nil];
    
    //图片不够的时候,插入到数组会出现插入空对象的情况
    NSMutableArray *images      = [NSMutableArray array];
    for (NSInteger index = 0 ; index < [table.textLabel_MArray count]; index++) {

        UIImage *image          = [UIImage imageNamed:@"head_image.jpg"];
       // NSLog(@"%s [LINE:%d] [images=%@", __func__, __LINE__,image);
        [images addObject:image];
        
    }
    table.images_MArray         = [[NSMutableArray alloc] initWithArray:images];
    [self.view addSubview:table];
    
}

@end
