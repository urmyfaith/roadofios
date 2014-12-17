//
//  ZKFirstViewController.m
//  01-UINavegationControllerDemo创建
//
//  Created by zx on 14-12-15.
//  Copyright (c) 2014年 zx. All rights reserved.
//

#import "ZXMainViewController.h"
#import "ZXAllMethod.h"
#import "ZXLoginViewController.h"
#import "eachView.h"

@implementation ZXMainViewController

-(NSMutableArray *)navigationMArray{
    if (_navigationMArray ==  nil) {
        _navigationMArray = [NSMutableArray array];
    }
    return _navigationMArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //navigationItem
    UIImage *titleViewImage         = [UIImage imageNamed:@"logo_title.png"];
    UIImageView *imageView          = [[UIImageView alloc]initWithImage:titleViewImage];
    self.navigationItem.titleView   = imageView;
    
#if 0
    //loginButton
    UIBarButtonItem *loginButton                = [[ UIBarButtonItem alloc] initWithTitle:@"登录"
                                                                                    style:UIBarButtonItemStylePlain
                                                                                   target:self action:@selector(jump2login)];
     self.navigationItem.rightBarButtonItem     = loginButton;
#endif
    
    //backBarButtonItem
    UIBarButtonItem *backItem                   =[[UIBarButtonItem alloc] initWithTitle:@"返回主界面"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:nil
                                                                             action:nil];
    self.navigationItem.backBarButtonItem       = backItem;
    
   
    //backgroundImage
    UIImage *backgroundImage            = [UIImage imageNamed:@"rr_main_background.png"];
    UIImageView *backgroundImageView    = [[UIImageView alloc]init];
    backgroundImageView.frame           = CGRectMake(0, 64, 320,480-64);
    backgroundImageView.image           = backgroundImage;
    [self.view  addSubview:backgroundImageView];
    
    
    
    //
    self.centerView= [[UIView alloc]init];
    self.centerView.frame = CGRectMake(0, 64, 320, 480-64);
    [self.view  addSubview:self.centerView];
    
    
    CGFloat gap                 = 15;
    CGFloat screenWidth         = 320;
    NSArray *imageNameArray     = @[@"gerenzhuye.png", @"xinxianshi.png",@"haoyou.png",
                                    @"yingyong.png",@"weizhifuwu.png",@"xiangce.png",
                                    @"zhaoren.png",@"chat.png",@"zhanneixin.png"];
    for (NSInteger i = 0; i < [imageNameArray count]; i++) {
        
        CGFloat H               = i % 3;
        CGFloat L               = i / 3;
        CGFloat buttonX         = (gap +80)*H + 20;
        CGFloat buttonY         = (gap +80)*L + 70;
        
        UIButton *eachButton    = [[UIButton alloc] init];
        eachButton.frame        = CGRectMake(buttonX,buttonY,80,80);
        eachButton.tag          = i + 1;
        UIImage *image4button   = [UIImage imageNamed:imageNameArray[i]];
        [eachButton addTarget:self
                       action:@selector(clickedButton:)
             forControlEvents:UIControlEventTouchUpInside];
        [eachButton setBackgroundImage:image4button forState:UIControlStateNormal];
        [self.centerView addSubview:eachButton];
    }
    
    /**
     eight navigations
     */
#if 0
    ZXHomeViewController *home = [[ZXHomeViewController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:home];
    [self.navigationMArray addObject:nav1];
    
    ZXHomeViewController *newActivity = [[ZXHomeViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:newActivity];
    [self.navigationMArray addObject:nav2];
    
    ZXFriendViewController *friend = [[ZXFriendViewController alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:friend];
    [self.navigationMArray addObject:nav3];
    
    ZXApllicationViewController *application = [[ZXApllicationViewController alloc]init];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:application];
    [self.navigationMArray addObject:nav4];
    
    ZXPositionViewController *position = [[ZXPositionViewController alloc]init];
    UINavigationController *nav5 = [[UINavigationController alloc]initWithRootViewController:position];
    [self.navigationMArray addObject:nav5];
    
    ZXPhoneViewController *photo = [[ZXPhoneViewController alloc]init];
    UINavigationController *nav6 = [[UINavigationController alloc]initWithRootViewController:photo];
    [self.navigationMArray addObject:nav6];
    
    
    ZXSearchViewController *search = [[ZXSearchViewController alloc]init];
    UINavigationController *nav7 = [[UINavigationController alloc]initWithRootViewController:search];
    [self.navigationMArray addObject:nav7];
    
    ZXChatViewController *chat = [[ZXChatViewController alloc]init];
    UINavigationController *nav8 = [[UINavigationController alloc]initWithRootViewController:chat];
    [self.navigationMArray addObject:nav8];
    
    
    ZXMessageViewController *message = [[ZXMessageViewController alloc]init];
    UINavigationController *nav9 = [[UINavigationController alloc]initWithRootViewController:message];
    [self.navigationMArray addObject:nav9];
#endif
    
    
    
#if 1
    ZXHomeViewController *home = [[ZXHomeViewController alloc]init];
    [self.navigationMArray addObject:home];
    
    ZXNewActivityViewController *newActivity = [[ZXNewActivityViewController alloc]init];
    [self.navigationMArray addObject:newActivity];
    
    ZXFriendViewController *friend = [[ZXFriendViewController alloc]init];
    [self.navigationMArray addObject:friend];
    
    ZXApllicationViewController *application = [[ZXApllicationViewController alloc]init];
    [self.navigationMArray addObject:application];
    
    ZXPositionViewController *position = [[ZXPositionViewController alloc]init];
    [self.navigationMArray addObject:position];
    
    ZXPhoneViewController *photo = [[ZXPhoneViewController alloc]init];
    [self.navigationMArray addObject:photo];
    
    
    ZXSearchViewController *search = [[ZXSearchViewController alloc]init];
    [self.navigationMArray addObject:search];
    
    ZXChatViewController *chat = [[ZXChatViewController alloc]init];
    [self.navigationMArray addObject:chat];
    
    
    ZXMessageViewController *message = [[ZXMessageViewController alloc]init];
    [self.navigationMArray addObject:message];

#endif
}

-(void)viewWillAppear:(BOOL)animated{
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger  isLogedIn = [defaults integerForKey:@"isLogedIn"];
    
    //loginButton
    NSString *string = [NSString string];
    if (isLogedIn == 0) {
        string = @"登录";
    }
    else{
        string = @"已登录";
    }
    UIBarButtonItem *loginButton                = [[ UIBarButtonItem alloc] initWithTitle:string
                                                                                    style:UIBarButtonItemStylePlain
                                                                                   target:self action:@selector(jump2login)];
    self.navigationItem.rightBarButtonItem     = loginButton;
    
}


# pragma mark loginVeiw
-(void)jump2login{
    NSLog(@"%s [LINE:%d] do jump to login", __func__, __LINE__);
    ZXLoginViewController *loginView = [[ZXLoginViewController alloc]init];
    [self.navigationController pushViewController:loginView animated:YES];
}


#pragma mark push eachView
-(void)clickedButton:(UIButton *)button{
    NSLog(@"%s [LINE:%d]button.tag = %d ", __func__, __LINE__,button.tag);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger  isLogedIn = [defaults integerForKey:@"isLogedIn"];
    //[defaults setInteger:1 forKey:@"isLogedIn"];
    switch (button.tag) {
        case 1:
        case 2:
        case 3:
            //view 1,2,3
            [self.navigationController pushViewController: self.navigationMArray[button.tag-1] animated:YES];
            break;
        default:
            if(isLogedIn == 0)
            {
                UIAlertView *alert =[ [UIAlertView alloc]initWithTitle:@"提示" message:@"您还未登录,仅可以查看1,2,3" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
            }
            else
            {
             //view 4~9
                [self.navigationController pushViewController: self.navigationMArray[button.tag-1] animated:YES];
            }
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
