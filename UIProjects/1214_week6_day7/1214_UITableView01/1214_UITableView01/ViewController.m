//
//  ViewController.m
//  1214_UITableView01
//
//  Created by zx on 12/14/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "ViewController.h"
#import "general_table_view.h"

@interface ViewController ()
{
    general_table_view *table;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    table                       = [[general_table_view alloc]initWithFrame:CGRectMake(0,
                                                                                      20,
                                                                                      320,
                                                                                      self.view.frame.size.height - 20)
                                                                     //style:UITableViewStylePlain];
                                                                     style:UITableViewStyleGrouped];
    table.textLabel_MArray      = [[NSMutableArray alloc]initWithObjects:@"北京市",@"广州市",@"深圳市",@"黑龙江省",@"湖北省",@"云南省",@"重庆市",@"广西省", nil];
    
    NSMutableArray *images      = [NSMutableArray array];
    NSMutableArray *subtitle    = [NSMutableArray array];
    
    for (NSInteger index = 0 ; index < [table.textLabel_MArray count]; index++) {
        
        UIImage *image          = [UIImage imageNamed:[NSString stringWithFormat:@"%d",index + 1]];
        NSString *detail        = [NSString stringWithFormat:@"detail text %d",index + 1];
        
        [images addObject:image];
        [subtitle addObject:detail];
    }
    table.subtitle_MArray       = [[NSMutableArray alloc] initWithArray:subtitle];
    table.images_MArray         = [[NSMutableArray alloc] initWithArray:images];
    [self.view addSubview:table];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
