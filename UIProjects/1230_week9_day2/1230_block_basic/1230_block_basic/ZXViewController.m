//
//  ZXViewController.m
//  1230_block_basic
//
//  Created by zx on 12/30/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXViewController.h"
#import "UIButton+ZXCustomButton.h"
#import "ZXCustomButton.h"
#import "ZXSecondViewController.h"


//当要给blokc类型起别名的时候,直接void(^block)()这样写即可.
typedef void(^BLOCK)();
typedef int (^MULBLOCK)(int,int,int);
@interface ZXViewController ()
@property (nonatomic,strong) UILabel    *myLabel;
@end

@implementation ZXViewController

void fun(int num){
    NSLog(@"%s [LINE:%d] num=%i", __func__, __LINE__,num);
}

- (void)viewDidLoad
{
    //------1 指针函数
    [super viewDidLoad];
    void (*p)(int) = fun;
    p(5);
    
    //------2 block无参使用
    void (^block)()  = ^(){
        NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    };
    block();
    NSLog(@"%s [LINE:%d] block class = %@", __func__, __LINE__,[block class]);
    
    //-------3 block起别名
    BLOCK myBlock = ^(){
        NSLog(@"%s [LINE:%d]", __func__, __LINE__);
    };
    myBlock();
    
    //-------4 block带参数的使用
    int(^addBlock)(int,int) = ^(int a,int b){
        return a+b;
    };
    NSLog(@"%s [LINE:%d] sum = %i", __func__, __LINE__,addBlock(3,4));
    
    // ------5 练习,实现三个数相乘;
    MULBLOCK mulBlock= ^(int a,int b,int c){
        return a*b*c;
    };
    NSLog(@"%s [LINE:%d] mul=%i", __func__, __LINE__,mulBlock(2,3,4));
    
    // ----- 6block  捕获变量
    
    __block int aa = 3;
    
    void(^newBlock)(int) = ^(int num){
        num = 5;
        aa = 6;
        //可以在block的内部使用外部的变量,但是不能去改变值.
        NSLog(@"%s [LINE:%d] aa=%i", __func__, __LINE__,aa);
        NSLog(@"%s [LINE:%d]num=%i", __func__, __LINE__,num);
    };
   
    NSLog(@"%s [LINE:%d] aa=%i", __func__, __LINE__,aa);
    newBlock(4);
    NSLog(@"%s [LINE:%d] aa=%i", __func__, __LINE__,aa);
    
    //------7. sort
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"88",@"55",@"66",@"33",nil];
    [array sortUsingComparator:^NSComparisonResult(id obj1, id obj2){
        return [obj1 compare:obj2] == NSOrderedDescending;
    }];
    NSLog(@"%s [LINE:%d] array=%@", __func__, __LINE__,array);
    
    // -------8.1原来封装button
    UIButton *button = [UIButton buttonWithFrame:CGRectMake(100, 50, 100, 40) withTitle:@"click" andTage:100];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithFrame:CGRectMake(100, 100, 100, 40) withTitle:@"click me" andTag:200 target:self action:@selector(buttonClicked:)];
    [self.view addSubview:button2];
    
    //------ 8.2 block作为参数使用
    
    ZXCustomButton *customButton = [ZXCustomButton buttonWithFrame:CGRectMake(100, 150, 100, 40) title:@"custom button" andBlock:^void(ZXCustomButton *button1){
        NSLog(@"%s [LINE:%d] button1=%p", __func__, __LINE__,button1);
        NSLog(@"%s [LINE:%d]button.tag = %i", __func__, __LINE__,button1.tag);
        self.view.backgroundColor = [UIColor grayColor];
    }];
    [self.view addSubview:customButton];
    
    //------8.3.1 通过block实现view动画效果.
    [self testBlockAnimation];
    
    //------8.3.2 通过block实现view动画效果.
    [self testBlockAnimation2];

    //------8.3.3 利用block进行反向传值
    self.myLabel = [[UILabel alloc]initWithFrame:CGRectMake(100,350,100,40)];
    self.myLabel.text = @"hello world";
    [self.view addSubview:self.myLabel];
    [self testReversePassValue];
}

-(void)testReversePassValue{
    ZXCustomButton *customButton = [ZXCustomButton buttonWithFrame:CGRectMake(100, 300, 100, 40) title:@"custom button" andBlock:^void(ZXCustomButton *button1){
        ZXSecondViewController *secondViewController = [[ZXSecondViewController alloc] init];
        secondViewController.mySecondBlock = ^(int size){
            self.myLabel.font = [UIFont systemFontOfSize:size];
        };
        //block修改外部的变量的值的时候.
        //对于简单的数据类型,需要使用__block==>block类型的变量
        //对于对象/指针,不要使用__block修饰.
        //jump
        [self presentViewController:secondViewController animated:YES completion:^{
            NSLog(@"%s [LINE:%d] jump completed.", __func__, __LINE__);
        }];
    }];
    [self.view addSubview:customButton];
}

-(void)testBlockAnimation2{
    ZXCustomButton *customButton = [ZXCustomButton buttonWithFrame:CGRectMake(100, 250, 100, 40) title:@"custom button" andBlock:^void(ZXCustomButton *button1){
        static BOOL isHidden = YES;
        [UIView animateWithDuration:2.0
                         animations:^{
            if (isHidden == YES)
                self.view.transform = CGAffineTransformMakeRotation(M_PI);
            else
                self.view.transform = CGAffineTransformMakeRotation(0);}
                         completion:^(BOOL finished) {
                NSLog(@"%s [LINE:%d] CGAffineTransformMakeRotation over.", __func__, __LINE__);}
         ];

        isHidden = !isHidden;
    
    }];
    [self.view addSubview:customButton];
}
-(void)testBlockAnimation{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 200, 40, 40)];
    imageView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:imageView];
    
    ZXCustomButton *customButton2 = [ZXCustomButton buttonWithFrame:CGRectMake(100, 200, 100, 40) title:@"custom button" andBlock:^void(ZXCustomButton *button1){
        static BOOL isHidden = YES;
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1.0];
        if (isHidden == YES)
            imageView.alpha = 0.0;
        else
            imageView.alpha = 1.0;
        isHidden = !isHidden;
        [UIView commitAnimations];
    }];
    [self.view addSubview:customButton2];
}

-(void)buttonClicked:(UIButton *)button{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
