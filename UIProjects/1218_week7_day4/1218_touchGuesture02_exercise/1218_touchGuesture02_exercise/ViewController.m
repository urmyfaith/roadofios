//
//  ViewController.m
//  1218_touchGuesture02_exercise
//
//  Created by zx on 12/18/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ViewController.h"
#import "ZXImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i < 8; i++) {
        CGFloat row     = i%4;
        CGFloat coloum  = i/4;
        CGFloat W = 80.0;
        CGFloat H = 120.0;
        CGFloat x = W * row ;
        CGFloat y = H * coloum;
        
        ZXImageView *imageView = [[ZXImageView alloc]initWithFrame:CGRectMake(x,y,W,H)];
        imageView.tag = i + 100;
        NSString *string = [NSString stringWithFormat:@"10_%i.jpg",i];
        imageView.image = [UIImage imageNamed:string];
        imageView.isMoved = NO;
        imageView.originalFrame = CGRectMake(x,y,W,H);
        imageView.delegate = self;             //设置代理
        imageView.userInteractionEnabled = YES;// 图像视图默认是不开启交互的.
        [self.view addSubview:imageView];
    }
}
-(void)moveImageView:(ZXImageView *)imageView{
    if (imageView.tapCounts == 2) {
        if (imageView.tag != 100+7) {
            
            if (imageView.isMoved == NO) {
                NSLog(@"%s [LINE:%d] hello world--%i", __func__, __LINE__,imageView.tag);
                CGRect desFrame = CGRectMake(imageView.frame.origin.x,
                                             imageView.frame.size.height*2 +imageView.frame.origin.y,
                                             imageView.frame.size.width,
                                             imageView.frame.size.height);
                imageView.frame = desFrame;
            }
            else{
                imageView.frame = imageView.originalFrame;
            }
            imageView.isMoved = !imageView.isMoved;
        }
    }
}
@end
