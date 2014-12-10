//
//  UIButton+addMethod.m
//  1210_ UIViewController
//
//  Created by zx on 12/10/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "UIButton+addMethod.h"

@implementation UIButton (addMethod)


/**
 *      UIButton *nextView = [UIButton buttonWithType:UIButtonTypeSystem];
 nextView.frame = CGRectMake(100, 150, 120, 40);
 nextView.backgroundColor = [UIColor whiteColor];
 [nextView.layer setMasksToBounds:YES];
 [nextView.layer setCornerRadius:10];
 [nextView setTitle:@"next" forState:UIControlStateNormal  ];
 [self.view addSubview:nextView];
 [nextView addTarget:self
 action:@selector(jumpIntoMain)
 forControlEvents:UIControlEventTouchUpInside];
 */
+(UIButton *)buttonWithFrame:(CGRect )frame
                   withTitle:(NSString *)title
                    withType:(UIButtonType)type
                  withTarget:(id) target
                  withMethod:(SEL) sel{
    UIButton *btn = [UIButton buttonWithType:type];
    btn.frame = frame;
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:sel forControlEvents:UIControlEventTouchUpInside];
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:10];
    return btn;
}



@end
