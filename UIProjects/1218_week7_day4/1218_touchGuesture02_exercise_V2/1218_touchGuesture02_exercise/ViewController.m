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

/**
 *  增加了动画,同时增加了点击的次数
bug:退出的时候的顺序
 如果要修复bug,增加数组,对数组元素进行判断.
 */
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
        imageView.isAtUp = YES;
        imageView.originalFrame = CGRectMake(x,y,W,H);
        imageView.delegate = self;             //设置代理
        imageView.userInteractionEnabled = YES;// 图像视图默认是不开启交互的.
        [self.view addSubview:imageView];
    }
}
-(void)moveImageView:(ZXImageView *)imageView{
        static int count = 0;
        if (imageView.tapCounts %2 == 0 && count <3) {
            [self.view bringSubviewToFront:imageView];
            [UIView  beginAnimations:nil context:nil];
            [UIView  setAnimationDuration:2.0];
            if (imageView.isAtUp == YES) {
                CGRect desFrame = CGRectMake(imageView.frame.size.width * count,
                                             360,
                                             imageView.frame.size.width,
                                             imageView.frame.size.height);

                imageView.frame = desFrame;
                count++;
            }
            else{
                imageView.frame = imageView.originalFrame;
                count--;
            }
             NSLog(@"%s [LINE:%d] count=%i", __func__, __LINE__,count);
            [UIView  commitAnimations];
            imageView.isAtUp = !imageView.isAtUp;
        }
        else
        {
            if (imageView.tapCounts %2 ==0 && count ==3 && imageView.isAtUp == NO ) {
                    [UIView  beginAnimations:nil context:nil];
                    [UIView  setAnimationDuration:2.0];
                    imageView.frame = imageView.originalFrame;
                    [UIView  commitAnimations];
                    count--;
                    imageView.isAtUp = !imageView.isAtUp;
            }
            else
            {
                if(count == 3 && imageView.tapCounts %2 ==0 )
                {
                    UILabel *label = [[UILabel alloc]init];
                    label.frame = CGRectMake(20,220,280,50);
                    label.backgroundColor = [UIColor grayColor];
                    label.text = [NSString stringWithFormat:@"最多放3个,手速+%i",imageView.tapCounts];
                    label.font = [UIFont systemFontOfSize:26];
                    label.tag = 200;
                    [label.layer setMasksToBounds:YES];
                    [label.layer setCornerRadius:10];
                    [self.view addSubview:label];
                    [self performSelector:@selector(removeLabel:) withObject:label afterDelay:1.0];
                }
            }
        }
}
-(void)removeLabel:(UILabel *)label{
    [label removeFromSuperview];
}
@end
