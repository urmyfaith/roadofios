//
//  CarViewController.m
//  xCarDemo
//
//  Created by zx on 1/31/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "CarViewController.h"

#import "Letter.h"
#import "Brand.h"

#define SPLIT_CONENT_HEIGHT 100.0f

@interface CarViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation CarViewController
{
    UITableView *_mainTableView;
    NSMutableArray *_carDataArray;
    
    
    CGPoint _touchedPoint;
    BOOL _shouldSplitView;
    UIView *_upView;
    UIView *_downView;
    UIImage *_screenShotImage;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
   
    [self createNavigationBar];
    [self createMainTableView];
    [self dowloadData];
    
    _shouldSplitView = YES;
    
    _upView = [[UIView alloc]init];
    _downView = [[UIView alloc]init];
    
    [self.view addSubview:_upView];
    [self.view addSubview:_downView];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTap)];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTap)];
    [_upView addGestureRecognizer:tap1];
    [_downView addGestureRecognizer:tap2];
}





-(void)dowloadData{
    [[NSNotificationCenter  defaultCenter] addObserver:self
                                              selector:@selector(downloadFinish)
                                                  name:kCAR_LIST_URL
                                                object:nil];
    [[DownloadManager sharedDownloadManager] addDownloadWithDownloadStr:kCAR_LIST_URL
                                                        andDownloadType:cCar_LIST_TYPE
                                                           andItemIndex:0];
    

}


-(void)downloadFinish{
    //移除坚挺着
    NSLog(@"%s [LINE:%d]  车型页面,下载完成", __func__, __LINE__);
    [[NSNotificationCenter defaultCenter]removeObserver:self name:kCAR_LIST_URL object:nil];
    _carDataArray  = [[DownloadManager sharedDownloadManager]getDownloadDataWithDownloadStr:kCAR_LIST_URL];
    [_mainTableView reloadData];
}

#pragma makr 创建表视图

-(void)createMainTableView{
    _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, 569-64) style:UITableViewStyleGrouped];
    _mainTableView.delegate = self;
    _mainTableView.dataSource  = self;
    [self.view addSubview:_mainTableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [_carDataArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    Letter *le = (Letter *)[_carDataArray objectAtIndex:section];
    
    return [le.letterBrandsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    Letter *le = [_carDataArray objectAtIndex:indexPath.section];
    Brand *bd = [le.letterBrandsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = bd.brandName;
    return cell;
}

#pragma mark 分组组头
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    Letter *le = [_carDataArray objectAtIndex:section];
    return le.letterName;
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}

#pragma mark 索引条
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSMutableArray *indexArray = [[NSMutableArray alloc]init];
    
    for (int i = 0 ; i < _carDataArray.count; i++) {
        Letter *le = [_carDataArray objectAtIndex:i];
        [indexArray addObject:le.letterName];
    }
    return indexArray;
}



#pragma mark  创建导航条
-(void)createNavigationBar{
    [self createMyNavigationBarWithTitle:@"nil" andLeftBtn:@[@"News_Details_Btn_Back.png"] andRightBtn:@[@"News_Details_Btn_Back.png"]];
    UILabel *label = [[UILabel alloc]init];
    label.frame =CGRectMake(50, 20, 100, 44);
    label.text = @"车型";
    label.font = [UIFont systemFontOfSize:25];
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
}

-(void)buttonClick:(UIButton *)button{
    if (button.tag == 1) {
        [self.navigationController popViewControllerAnimated:YES];
    }

}

#pragma mark 分割屏幕

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self printrResponderChain:self];

    UITableViewCell   *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    CGRect cellRect = [tableView rectForRowAtIndexPath:indexPath];
    CGRect temp = [self.view convertRect:cellRect fromView:cell];
    NSArray *winows = [UIApplication sharedApplication].windows;

    _touchedPoint = CGPointMake(temp.origin.x - cellRect.origin.x ,temp.origin.y-cellRect.origin.y+44);
    [self dosplitImage];
}


-(void)doTap{
    //_shouldSplitView = !_shouldSplitView;
    [self dosplitImage];
}

-(void)printrResponderChain:(UIResponder *)responder {
    NSLog(@">>>>>>>>>>>The Responder Chain----------");
    NSMutableString *spaces = [NSMutableString stringWithCapacity:4];
    while (responder) {
        NSLog(@"%@%@", spaces, responder.class);
        responder = responder.nextResponder;
        [spaces appendString:@"----"];
    }
    NSLog(@"<<<<<<<<<<<<<<<<<<END-------------------");
}


-(void)dosplitImage{
    if (_shouldSplitView) {
        //分离图片
        [self takeAScreenShot];
        
        _upView.alpha = 1;
        _downView.alpha = 1;
        _mainTableView.alpha = 0;
        
        //原始大小
        CGRect upRect = CGRectMake(0, 0, 320, _touchedPoint.y);
        CGRect downRect = CGRectMake(0, _touchedPoint.y, 320, self.view.frame.size.height - _touchedPoint.y);
        
        _upView.frame = upRect;
        _downView.frame = downRect;
        
        
        //图片裁剪
        CGImageRef up_cutImage = CGImageCreateWithImageInRect(_screenShotImage.CGImage, upRect);
        CGImageRef down_cutImage = CGImageCreateWithImageInRect(_screenShotImage.CGImage, downRect);
        
        //裁剪后的图片--->视图
        UIImageView *upImageView = [[UIImageView alloc]initWithImage:[UIImage imageWithCGImage:up_cutImage]];
        UIImageView *downImageView = [[UIImageView alloc]initWithImage:[UIImage imageWithCGImage:down_cutImage]];
        
        //添加到视图
        [_upView addSubview:upImageView];
        [_downView addSubview:downImageView];
        
        //下面视图的部分下移
        [UIView animateWithDuration:1.0 animations:^{
            
            _downView.frame = CGRectMake(0, _touchedPoint.y + SPLIT_CONENT_HEIGHT , 320, self.view.frame.size.height - _touchedPoint.y );
        }];
    }else{
        //收起图片
        [UIView animateWithDuration:1.0 animations:^{
            CGRect upRect = CGRectMake(0, 0, 320, _touchedPoint.y);
            CGRect downRect = CGRectMake(0, _touchedPoint.y, 320, self.view.frame.size.height - _touchedPoint.y);
            _upView.frame = upRect;
            _downView.frame = downRect;
            

        } completion:^(BOOL finished) {
            for (id view in _upView.subviews) {
                [view removeFromSuperview];
            }
            for (id view in _downView.subviews) {
                [view removeFromSuperview];
            }
            _upView.alpha = 0;
            _downView.alpha = 0;
            _mainTableView.alpha = 1;
        }];
    }
    _shouldSplitView = !_shouldSplitView;
}

-(void)takeAScreenShot{
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    _screenShotImage  = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}







@end
