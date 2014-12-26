//
//  ZXMainViewController.h
//  1224_xib_basic
//
//  Created by zx on 12/24/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXMainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *IBName;

@property(nonatomic,strong) IBOutlet UIButton    * button;
- (IBAction)buttonCliked:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;


@end
