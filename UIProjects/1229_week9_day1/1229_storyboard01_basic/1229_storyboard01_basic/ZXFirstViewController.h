//
//  ZXFirstViewController.h
//  1229_storyboard01_basic
//
//  Created by zx on 12/29/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXFirstViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
- (IBAction)buttonClicked:(UIButton *)sender;

@end
