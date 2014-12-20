//
//  ZXDetailViewViewController.m
//  1219_exercise_v1
//
//  Created by zx on 12/20/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXDetailViewViewController.h"
#import "ZXAllMethod.h"
#import "ZXCustomImageView.h"

@interface ZXDetailViewViewController ()
@property (nonatomic,strong)    ZXCustomImageView *imageView ;
@end

@implementation ZXDetailViewViewController
-(void)viewWillAppear:(BOOL)animated{
    NSNotificationCenter *center  = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(saveCurrentImage:) name:@"saveCurrentImage" object:nil];
}

-(void)saveCurrentImage:(NSNotification *)notification{
   
    // 通知传值:从对象里获取/从字典里获取,两种方法都可以.
#if 0
    NSDictionary *dict = notification.userInfo;
    NSString *imageName = dict[@"imageNameKey"];
#endif
    
#if 1
    ZXCustomImageView *imageView = (ZXCustomImageView *)notification.object;
    NSString *imageName = [imageView accessibilityIdentifier];
#endif
    
    
    
    //save image
    NSString *path =  [[NSBundle mainBundle] pathForResource:imageName  ofType:@"png"];
    NSMutableDictionary *mutDic = [[NSMutableDictionary alloc]init];

    NSString *imageFileName = [NSString stringWithFormat:@"%@_backup.plist",path] ;
    [mutDic setObject:imageName
               forKey:imageName];
   
    [mutDic writeToFile:imageFileName atomically:YES];
    NSLog(@"%s [LINE:%d] imageFileName = %@", __func__, __LINE__,imageFileName);

    //提示
    NSString *message = [NSString stringWithFormat:@"保存图片 %@ 成功!",imageName];
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示"
                                                       message:message
                                                      delegate:self
                                             cancelButtonTitle:nil
                                             otherButtonTitles:@"OK", nil];
    [alertView show];
    
    //取消注册监听者
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"saveCurrentImage" object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //title
    self.title = self.cityName;
    
    //image
    [self createImageView];
    
    //Detail-->UILabel
    UILabel *imageDetail = [UILabel labelWithFrame:CGRectMake(30,300,260,0)
                                          withText:self.cityDetail
                                           withTag:100
                               withBackgroundColor:[UIColor whiteColor]];
    imageDetail.numberOfLines = 0;
    [imageDetail sizeToFit];
    [self.view addSubview:imageDetail];
    
    //back to main Button
    UIButton *backButton = [UIButton buttonWithFrame:CGRectMake(220, 425, 60, 40)
                                           withTitle:@"返回"
                                            withType:UIButtonTypeSystem
                                          withTarget:self
                                          withMethod:@selector(backToMain)];
    [self.view addSubview:backButton];
    
    
    //restoreImageButton
    UIButton *restoreImageButton = [UIButton buttonWithFrame:CGRectMake(30, 425, 80, 40)
                                           withTitle:@"恢复图片"
                                            withType:UIButtonTypeSystem
                                          withTarget:self
                                          withMethod:@selector(createImageView)];
    [self.view addSubview:restoreImageButton];
}
-(void)backToMain{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)createImageView{
    //两种创建的方法都可以.
#if 0
    if (self.imageView == nil) {
        UIImage *image = [UIImage imageNamed:self.cityImage];
        self.imageView = [[ZXCustomImageView alloc]initWithImage:image];
    }
    
    self.imageView.transform = CGAffineTransformMakeRotation(0);
    
    self.imageView.frame = CGRectMake(30,80,260,200);
    
    [self.view addSubview:self.imageView];
#endif
    
#if 1
    if (self.imageView == nil) {
        self.imageView = [[ZXCustomImageView alloc]initWithFrame: CGRectMake(30,80,260,200)];
        self.imageView.image = [UIImage imageNamed:self.cityImage];
        
    }
    self.imageView.transform = CGAffineTransformMakeRotation(0);
    self.imageView.frame = self.imageView.originalFrame;
    [self.imageView setAccessibilityIdentifier:self.cityImage];
    [self.view addSubview:self.imageView];

#endif
}

@end
