//
//  MainViewController.m
//  MyMagazine
//
//  Created by zx on 1/21/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "MainViewController.h"
#import "ZipArchive.h"


@interface MainViewController ()

@end

@implementation MainViewController

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
    
    
    //1.解压缩资源包
    [self zipFile];

    //2.布局UI
    
}

-(void)zipFile
{
    
    //1.判断是否已经解压缩过
    NSString *bookPath = [NSString stringWithFormat:@"%@/Library/Caches/book",NSHomeDirectory()];
    
    NSLog(@"%s [LINE:%d]%@", __func__, __LINE__,bookPath);
    
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    
    if (![fileManager fileExistsAtPath:bookPath])
    {
        //2.如果文件不存在,则去解压缩文件
        
        //2.1判断是否可以解压缩文件
        ZipArchive *zip  = [[ZipArchive alloc]init];
        
        NSString *appBookPath = [NSString stringWithFormat:@"%@/book.zip",[[NSBundle mainBundle]resourcePath]];
        
        if ([zip UnzipOpenFile:appBookPath])
        {
           //2.2解压缩文件
            [zip UnzipFileTo:[NSString stringWithFormat:@"%@/Library/Caches/",NSHomeDirectory()] overWrite:YES];
        }
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
