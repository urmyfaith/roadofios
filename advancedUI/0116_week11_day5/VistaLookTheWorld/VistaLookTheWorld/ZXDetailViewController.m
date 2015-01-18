//
//  ZXDetailViewController.m
//  VistaLookTheWorld
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXDetailViewController.h"

@interface ZXDetailViewController ()

@end

@implementation ZXDetailViewController

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
     [self createToolBar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

-(void)createToolBar{
    //内页转发_1
    //内页转发_2
    //评论_1
    //评论_2
    //评论按钮  (黑)
    //评论logo@2x   (红)
    //上一章_1
    //收藏
    //收藏成功 (红色)
    //下一章_1
    //下一章_2

    
    UIToolbar *toolBar = [[UIToolbar alloc]init];
    toolBar.frame = CGRectMake(0, self.view.bounds.size.height-44-64, 320, 44);
     //toolBar.frame = CGRectMake(0,0, 320, 44);
    NSMutableArray *items_mArray= [NSMutableArray array];
    NSArray *unselected_array = @[@"上一章_1",@"评论_1",@"收藏",@"内页转发_1",@"下一章_1"];
    
    UIBarButtonItem *blank = [[UIBarButtonItem alloc]
                              initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                              target:nil
                              action:nil];
    [items_mArray addObject:blank];
    for (int i = 0 ; i < [unselected_array count] ; i++) {
        
        UIImage *image = [UIImage imageNamed:unselected_array[i]];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i + 200;
        button.frame = CGRectMake(0, 0,image.size.width,image.size.height);
        [button setImage:image forState:UIControlStateNormal];
        [button addTarget:self
                   action:@selector(buttonItemClicked:)
         forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithCustomView:button];

        [items_mArray addObject:buttonItem];
        [items_mArray addObject:blank];
    }
   
    
    toolBar.items = items_mArray;
    [toolBar setBackgroundImage:[[UIImage imageNamed:@"导航底"] stretchableImageWithLeftCapWidth:2 topCapHeight:10]
             forToolbarPosition:UIBarPositionBottom
                     barMetrics:UIBarMetricsDefault];
    
    [self.view addSubview:toolBar];
}

-(void)buttonItemClicked:(UIButton *)button{
    NSLog(@"%s [LINE:%d] button.tag=%i", __func__, __LINE__,button.tag);
}


@end
