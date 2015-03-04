//
//  ZXViewController.m
//  screenShotDemo
//
//  Created by zx on 1/31/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXViewController.h"
#import "CustomView.h"

#define SPLIT_CONENT_HEIGHT 100.0f


@interface ZXViewController ()

@end

@implementation ZXViewController
{
    CGPoint _touchedPoint;
    BOOL _shouldSplitView;
    UIView *_upView;
    UIView *_downView;
    UIImage *_screenShotImage;
    CustomView *_cv ;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _cv= [[CustomView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_cv];
    
    _shouldSplitView = YES;
    
    _upView = [[UIView alloc]init];
    _downView = [[UIView alloc]init];
    
    [self.view addSubview:_upView];
    [self.view addSubview:_downView];
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *aTouch = [touches anyObject];
    
   
    if (_shouldSplitView) {
        _touchedPoint = [aTouch locationInView:self.view];
         NSLog(@" split at y = %.lf",_touchedPoint.y);
        
        //分离图片
        [self takeAScreenShot];
        
        _upView.alpha = 1;
        _downView.alpha = 1;
        _cv.alpha = 0;
        
        //原始大小
        CGRect upRect = CGRectMake(0, 0, 320, _touchedPoint.y);
        CGRect downRect = CGRectMake(0, _touchedPoint.y, 320, self.view.frame.size.height - _touchedPoint.y);

        _upView.frame = upRect;
        _downView.frame = downRect;

        
        //图片裁剪
        CGImageRef up_cutImage = CGImageCreateWithImageInRect(_screenShotImage.CGImage, upRect);
        CGImageRef down_cutImage = CGImageCreateWithImageInRect(_screenShotImage.CGImage, downRect);
        
        //裁剪后的图片--->视图
        UIImageView *upImageView = [[UIImageView alloc]initWithImage:[UIImage imageWithCGImage:up_cutImage]];
        UIImageView *downImageView = [[UIImageView alloc]initWithImage:[UIImage imageWithCGImage:down_cutImage]];
        
        //添加到视图
        [_upView addSubview:upImageView];
        [_downView addSubview:downImageView];

        //下面视图的部分下移
        [UIView animateWithDuration:1.0 animations:^{

            _downView.frame = CGRectMake(0, _touchedPoint.y + SPLIT_CONENT_HEIGHT , 320, self.view.frame.size.height - _touchedPoint.y );
        }];
        
    }else{
        //收起图片
        [UIView animateWithDuration:1.0 animations:^{
            CGRect upRect = CGRectMake(0, 0, 320, _touchedPoint.y);
            CGRect downRect = CGRectMake(0, _touchedPoint.y, 320, self.view.frame.size.height - _touchedPoint.y);
            _upView.frame = upRect;
            _downView.frame = downRect;
        } completion:^(BOOL finished) {
           _cv.alpha  = 1;
            for (id view in _upView.subviews) {
                [view removeFromSuperview];
            }
            for (id view in _downView.subviews) {
                [view removeFromSuperview];
            }
        }];
    }
    _shouldSplitView = !_shouldSplitView;
}

-(void)takeAScreenShot{
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    _screenShotImage  = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}



//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        sleep(5);
//        NSLog(@"开始截图啦");
//        dispatch_async(dispatch_get_main_queue(), ^{
//            UIGraphicsBeginImageContext(self.view.bounds.size);
//            [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
//
//            _screenShotImage  = UIGraphicsGetImageFromCurrentImageContext();
//            UIGraphicsEndImageContext();
//
//            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 30, 200, 100)];
//            imageView.image = _screenShotImage;
//            [self.view addSubview:imageView];
//            NSLog(@"截图成功咯");
//        });
//    });



@end
