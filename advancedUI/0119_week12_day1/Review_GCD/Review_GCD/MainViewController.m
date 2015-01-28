//
//  MainViewController.m
//  Review_GCD
//
//  Created by zx on 1/28/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<UITextViewDelegate>

@end

@implementation MainViewController
{
    UIImageView *_imageView;
    UIActivityIndicatorView *_aciv;
    UITextView *_tv;
    UILabel *_lable;
}

- (void)viewDidLoad
{
    
    [self loadUI];
    self.view.backgroundColor = [UIColor colorWithRed:0.81f green:0.82f blue:0.85f alpha:1.00f];
    [super viewDidLoad];
    

    
}
-(void)loadUI{

#pragma mark 绘制图片
    _imageView= [[UIImageView alloc]init];
    _imageView.frame = CGRectMake(10, 30, 150, 150);
    _imageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_imageView];

    _aciv= [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    _aciv.frame = CGRectMake(10+ 150/2, 30+150/2, 0, 0);
    [self.view addSubview:_aciv];

    
    CGFloat xPos = CGRectGetMaxX(_imageView.frame) + 10.0f;
#pragma mark 绘制按钮
    NSArray *buttonTitlsArray = @[@"block",@"Invocation",@"serialQueue",
                                  @"Concurrent",@"NSThread",@"同步请求",@"UI是否卡死"];
    UIButton *button = nil;
    for (int i = 0 ; i < buttonTitlsArray.count; i++) {
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 100+i;
        button.frame = CGRectMake(xPos, 30 + 40*i, 140, 35);
        [button setTitle:buttonTitlsArray[i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor purpleColor];
        button.clipsToBounds = YES;
        [button.layer setCornerRadius:10];
        
        [button addTarget:self
                   action:@selector(buttonClicked:)
         forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        if (i == buttonTitlsArray.count-1) {
            button.frame = CGRectMake(self.view.bounds.size.width-10-140-10-140, 30 + 40*(i-1), 140, 35);
            button.backgroundColor = [UIColor redColor];
        }
        if (i == buttonTitlsArray.count -2) {
            _lable = [[UILabel alloc]init];
            _lable.frame = CGRectMake(self.view.bounds.size.width-10-140-10-140, 30 + 40*(i-1), 140, 35);
            _lable.backgroundColor = [UIColor greenColor];
            _lable.text = @"卡?红色:绿色";
            _lable.textAlignment = NSTextAlignmentCenter;
            [self.view addSubview:_lable];
        }
    }
    

#pragma mark 绘制输出框
    
    _tv = [[UITextView alloc]init];
    _tv.frame = CGRectMake(10,
                          CGRectGetMaxY(button.frame)+10,
                          300,
                          self.view.bounds.size.height- CGRectGetMaxY(button.frame)-10-10);
    _tv.backgroundColor = [UIColor colorWithRed:0.26f green:0.26f blue:0.26f alpha:1.00f];
    _tv.textColor = [UIColor yellowColor];
    _tv.clipsToBounds = YES;
    [_tv.layer setCornerRadius:5];
    _tv.delegate = self;
    _tv.editable = NO;
    [self.view addSubview:_tv];
}

-(void)buttonClicked:(UIButton *)button{
    
    if (button.tag !=106) {
        [_aciv startAnimating];
        _imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"non-exist-image"]];
    }
    //    NSLog(@"%s [LINE:%d] button.tag=%d", __func__, __LINE__,button.tag);
    switch (button.tag) {
        case 100:
            [self doTag100];
            break;
        case 101:
            [self doTag101];
            break;
        case 102:
            [self doTag102];
            break;
        case 103:
            [self doTag103];
            break;
        case 104:
            [self doTag104];
            break;
        case 105:
            [self doTag105];
            break;
        case 106:
            [self doTag106];
            break;
        default:
            NSLog(@"%s [LINE:%d] how could you do this?", __func__, __LINE__);
            break;
    }
}

-(void)doTag100{
    
    
    __weak __block MainViewController *copy_self = self;
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        [copy_self loadImageWithThreadName:@"Block"];
    }];
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    [operationQueue addOperation:blockOperation];
}
-(void)doTag101{
    NSOperationQueue *operationQueue = [[NSOperationQueue  alloc]init];
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(loadImageWithThreadName:) object:@"NSInvocationOperation"];
    [operationQueue addOperation:invocationOperation];
    
}
-(void)doTag102{
     dispatch_queue_t serialQueue = dispatch_queue_create("mySerialQueue", DISPATCH_QUEUE_SERIAL);
    __weak __block MainViewController *copy_self = self;
    dispatch_async(serialQueue, ^{
        [copy_self loadImageWithThreadName:@"Serial"];
    });
}
-(void)doTag103{
    dispatch_queue_t serialQueue = dispatch_queue_create("myConcurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    __weak __block MainViewController *copy_self = self;
    dispatch_async(serialQueue, ^{
        [copy_self loadImageWithThreadName:@"Concurrent"];
    });
}
-(void)doTag104{
    [NSThread detachNewThreadSelector:@selector(loadImageWithThreadName:) toTarget:self withObject:@"NSThread"];
}
-(void)doTag105{
    NSData *data = [self getImageData];
    [self updateImageWithData:data];
}
-(void)doTag106{
    if (_lable.backgroundColor == [UIColor redColor])
        _lable.backgroundColor = [UIColor greenColor];
    else
        _lable.backgroundColor = [UIColor redColor];
}

-(void)loadImageWithThreadName:(NSString *)threadName{

    [[NSThread currentThread] setName:threadName];
    NSData *data = [self getImageData];
    [self performSelectorOnMainThread:@selector(updateImageWithData:)
                           withObject:data
                        waitUntilDone:YES];
}

-(void)updateImageWithData:(NSData *)data{
    _imageView.image = [UIImage imageWithData:data];
}

-(NSData *)getImageData{
    [NSThread sleepForTimeInterval:1];

#define IMAGEURL @"http://localhost/~zx/UISettingResources/headpicture.png"
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:IMAGEURL]];
    NSString *currentThread = [NSString stringWithFormat:@"thread:%@",[[NSThread currentThread] name] ];
    [self performSelectorOnMainThread:@selector(updateTextViewWithString:)
                           withObject:currentThread
                        waitUntilDone:YES];
    return  data;
}

-(void)updateTextViewWithString:(NSString *)string{

    _tv.text = [NSString stringWithFormat:@"%@\n%@",_tv.text,string];
    [_aciv stopAnimating];
}


@end
