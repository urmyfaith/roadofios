//
//  CustomView.m
//  screenShotDemo
//
//  Created by zx on 1/31/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"winter.jpg"]];
        imageView.frame = self.bounds;
        [self addSubview:imageView];
    }
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

@end
