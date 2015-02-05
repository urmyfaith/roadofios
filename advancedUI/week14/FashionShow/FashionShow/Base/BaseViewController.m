//
//  BaseViewController.m
//  FashionShow
//
//  Created by zx on 15/2/3.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "BaseViewController.h"
#import "SettingViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

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
   [self createZXNavigationbar];
}

-(void)createZXNavigationbar{

    [self createRootNavigaitonBarWithTitleImag:@"logo"
                                  andIsTop:NO
                              andTitleName:nil
                        andBackgroundImage:nil
                      andLeftBtnImagesName:@"top_1"
                     andRightBtnImagesName:@"设置_1"
                                  andClass:self
                                    andSEL:@selector(navigationBarClicked:)];
    
}

-(void)navigationBarClicked:(UIButton *)button{
    if (button.tag  == zxNavigaionBarButtonLeftTag) {
        
  //      [self.navigationController popViewControllerAnimated:YES];

        self.modalPresentationStyle = UIModalPresentationCurrentContext;
        [self dismissViewControllerAnimated:YES completion:^{
            NSLog(@"%s [LINE:%d]", __func__, __LINE__);
 }];
        
    }
    if (button.tag == zxNavigaionBarButtonRightTag) {

        SettingViewController *settingVC = [[SettingViewController alloc] init];
#if 0
        self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
        [self presentViewController:settingVC animated:YES completion:^{
            //
        }];
#endif

#if 1
        
        UIViewController *src = self;
        UIViewController *dst = settingVC;
        
        [UIView transitionWithView:src.navigationController.view
                          duration:1
                           options:UIViewAnimationOptionTransitionCurlUp
                        animations:^{
                            [src.navigationController pushViewController:dst animated:NO];
                        }
                        completion:nil];
#endif
    }
}

@end
