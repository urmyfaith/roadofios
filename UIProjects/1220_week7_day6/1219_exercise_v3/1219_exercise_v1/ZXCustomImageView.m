//
//  ZXCustomImageView.m
//  1219_exercise_v1
//
//  Created by zx on 12/20/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXCustomImageView.h"

@implementation ZXCustomImageView
-(CGRect)originalFrame{
    return self.frame;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        self.multipleTouchEnabled = YES;
        
        UIPinchGestureRecognizer *pinch =[[ UIPinchGestureRecognizer alloc]initWithTarget:self
                                                                                   action:@selector(myPinch:)];

        [self addGestureRecognizer:pinch];
        pinch.delegate = self;
        
        UIRotationGestureRecognizer *rotation = [[ UIRotationGestureRecognizer alloc]initWithTarget:self
                                                                                             action:@selector(myRotation:)];
        
        [self addGestureRecognizer:rotation];
        
        rotation.delegate = self;
    }
    return self;
}

-(instancetype)initWithImage:(UIImage *)image{
    self = [super initWithImage:image];
    if (self) {
        self.userInteractionEnabled = YES;
        self.multipleTouchEnabled = YES;
        
        UIPinchGestureRecognizer *pinch =[[ UIPinchGestureRecognizer alloc]initWithTarget:self
                                                                                   action:@selector(myPinch:)];
        
        [self addGestureRecognizer:pinch];
        pinch.delegate = self;
        
        UIRotationGestureRecognizer *rotation = [[ UIRotationGestureRecognizer alloc]initWithTarget:self
                                                                                             action:@selector(myRotation:)];
        
        [self addGestureRecognizer:rotation];
        rotation.delegate = self;
    }
    return self;
}

-(void)myPinch:(UIPinchGestureRecognizer *) pinch{
    self.transform = CGAffineTransformScale(self.transform, pinch.scale,pinch.scale);
    pinch.scale = 1;
}

-(void)myRotation:(UIRotationGestureRecognizer *)rotation{
    self.transform = CGAffineTransformRotate(self.transform, rotation.rotation);
    rotation.rotation = 0;
}

#pragma mark ------手势的代理方法
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}

#pragma mark ------双击时间处理===>通知
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    NSLog(@"%s [LINE:%d] tabCount = %i", __func__, __LINE__,[touch tapCount]);
    if ([touch tapCount]%2 == 0)
    {
        NSNotificationCenter *center  = [NSNotificationCenter defaultCenter];
        NSString *imageName = [self.image accessibilityIdentifier];
        [center postNotificationName:@"saveCurrentImage" object:self userInfo:@{
                                                                               @"imageNameKey":imageName
                                                                               }];
    }
}
@end
