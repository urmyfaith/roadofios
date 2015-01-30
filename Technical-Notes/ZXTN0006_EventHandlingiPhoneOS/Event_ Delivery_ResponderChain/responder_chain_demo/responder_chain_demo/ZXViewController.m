//
//  ZXViewController.m
//  responder_chain_demo
//
//  Created by zx on 1/30/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXViewController.h"
#import "ViewA.h"
#import "ViewB.h"
#import "ViewC.h"
#import "ViewD.h"
#import "ViewE.h"

@interface ZXViewController ()

@end

@implementation ZXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    /**
     *  ViewA实现了点击事件
     *  ViewB实现了轻扫事件
     *  ViewC实现了移动Veiw
     */
    
    
    CGFloat gap   = 30;
    ViewA *viewA = [[ViewA alloc]initWithFrame:CGRectMake( gap,
                                                            20 + gap,
                                                            self.view.frame.size.width - gap *2,
                                                            self.view.frame.size.height - gap - gap - 20)];

    [self.view addSubview:viewA];
    
    
    ViewB *viewB = [[ViewB alloc]initWithFrame:CGRectMake(gap,
                                                           gap,
                                                           viewA.frame.size.width - gap*2,
                                                           viewA.frame.size.height*1/5)];
   
    [viewA addSubview:viewB];
    
    ViewC *viewC = [[ViewC alloc]initWithFrame:CGRectMake(gap,
                                                            gap + CGRectGetMaxY(viewB.frame),
                                                            viewA.frame.size.width - gap*2,
                                                            viewA.frame.size.height*3/5)];
    [viewA addSubview:viewC];
    
    
    
    ViewD *viewD = [[ViewD alloc]initWithFrame:CGRectMake(gap,
                                                          gap,
                                                          viewC.frame.size.width - gap*2,
                                                          (viewC.frame.size.height- 3*gap)/2)];
    [viewC addSubview:viewD];
    
    ViewE *viewE = [[ViewE alloc]initWithFrame:CGRectMake(gap,
                                                          CGRectGetMaxY(viewD.frame)+ gap,
                                                          viewC.frame.size.width - gap*2,
                                                          (viewC.frame.size.height- 3*gap)/2)];
    [viewC addSubview:viewE];
    

    NSArray *viewNames_array = @[@"viewA",@"viewB",@"viewC",@"viewD",@"viewE"];
    
    NSMutableArray *label4view_mArray = [[NSMutableArray alloc]  init];
    
    for (int i = 0; i < viewNames_array.count; i++) {
        UILabel *label4view = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 30)];
        label4view.text = viewNames_array[i];
        label4view.font = [UIFont systemFontOfSize:12];
        [label4view_mArray addObject:label4view];
    }
    
    [viewA addSubview:[label4view_mArray objectAtIndex:0]];
    [viewB addSubview:[label4view_mArray objectAtIndex:1]];
    [viewC addSubview:[label4view_mArray objectAtIndex:2]];
    [viewD addSubview:[label4view_mArray objectAtIndex:3]];
    [viewE addSubview:[label4view_mArray objectAtIndex:4]];

#if 0
    /**
     * First Responder的理解
     */
    
    UITextField *tf = [[UITextField alloc]initWithFrame:CGRectMake(10, 50, 100, 100)];
    tf.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:tf];
    
    [tf becomeFirstResponder]; //自动弹出键盘
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        sleep(5);
        dispatch_async(dispatch_get_main_queue(), ^{
            [tf resignFirstResponder]; //隐藏键盘
        });
        
    });
#endif
}



@end
