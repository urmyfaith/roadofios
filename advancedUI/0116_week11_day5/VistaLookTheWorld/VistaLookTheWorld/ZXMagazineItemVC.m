//
//  ZXMagazineItemVC.m
//  VistaLookTheWorld
//
//  Created by zx on 1/16/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ZXMagazineItemVC.h"

@interface ZXMagazineItemVC ()

@end

@implementation ZXMagazineItemVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self setNavigationBar];
    
}

#pragma mark  导航栏设置
-(void)setNavigationBar{
    //---backgroundImage
    if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)] )
    {
        
        UIImage *image = [UIImage imageNamed:@"标题栏底.png"];
        [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    }
    self.navigationItem.title = [NSString stringWithFormat:@"第%@期",_vol_year_string];
 
    //---backButton
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [backButton addTarget:self
                      action:@selector(backButtonClicked)
            forControlEvents:UIControlEventTouchUpInside];
    
    UIImage *backImage = [UIImage imageNamed:@"返回_1"];
    [backButton setBackgroundImage:backImage forState:UIControlStateNormal];
    
    backButton.frame = CGRectMake(0,0, backImage.size.width, backImage.size.height);
    UIBarButtonItem *backItemView = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItemView;
    
}

-(void)backButtonClicked{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
