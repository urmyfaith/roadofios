//
//  ViewController.m
//  1219_UITableView03_readPlist
//
//  Created by zx on 12/19/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //read fiel under current project.
    //fileName  filetype
    NSString *path =  [[NSBundle mainBundle] pathForResource:@"bookData" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    NSLog(@"%s [LINE:%d] array=%@", __func__, __LINE__,array);
    
}

@end
