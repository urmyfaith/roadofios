//
//  FashionViewController.m
//  FashionShow
//
//  Created by zx on 15/2/3.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "FashionViewController.h"

/*==========瀑布流===========*/
#import "ZXWaterflowView.h"
#import "ZXWaterflowViewCell.h"

@interface FashionViewController ()<ZXWaterflowViewDataSource,ZXWaterflowViewDelegate>
@property (nonatomic,strong) NSMutableArray    *models_mArray;
@end


/**
 时装页面:分为 美搭 和 导购
 美搭和导购的接口API仅仅是sa参数不同:MD/DG
 可以共用一个瀑布流界面
 */
@implementation FashionViewController
{
    ZXWaterflowView *_waterflowView;
     NSString *_urlIdentifier; //数据下载的url标志符
}

#pragma mark lazy-load-array
-(NSMutableArray *)models_mArray{
    if (nil == _models_mArray) {
        _models_mArray = [[NSMutableArray alloc]init];
    }
    return _models_mArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createWaterfallFlow];
    
    self.postURL_action = @"piclist";
    self.postURL_sa = @"MD";
    self.postURL_count = @"18";
    self.postURL_offset = @"0";
    [self downloadData];
    [_waterflowView reloadData];
}

#pragma mark 下载数据
-(void)downloadData{
    
    
    NSString *postData_string = [NSString stringWithFormat:zxpostData_string,
                                 self.postURL_action,
                                 self.postURL_sa,
                                 self.postURL_offset,
                                 self.postURL_count];
    
    _urlIdentifier= [NSString stringWithFormat:@"%@%@",zxAPI_FULLPATH,postData_string];
    
    NSLog(@"_urlIdentifier=%@",_urlIdentifier);
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(fashionPage_downloadFinish)
                                                name:_urlIdentifier
                                              object:nil];
    [[DownloadManager sharedDownloadManager] addDownloadWithDownloadURL:zxAPI_FULLPATH
                                               andDownloadResqustMethod:@"POST"
                                                      andPostDataString:postData_string];
}

-(void)fashionPage_downloadFinish{
    
    if ([self.postURL_offset isEqualToString:@"0"]) {
        [self.models_mArray removeAllObjects];
    }
    [self.models_mArray addObjectsFromArray:[JSON2Model JSONData2ModelWithURLIdentifier:_urlIdentifier
                                                                            andDataType:zxJSON_DATATYPE_SPECIAL]];

    
}

-(void)createWaterfallFlow{
    _waterflowView = [[ZXWaterflowView alloc]init];
    _waterflowView.frame = CGRectMake(0,
                                      zxStatusBar_NavigatinBar_HEIGHT,
                                      self.view.frame.size.width,
                                      self.view.frame.size.height -zxStatusBar_NavigatinBar_HEIGHT);
    _waterflowView.delegate = self;
    _waterflowView.dataSource = self;
    [self.view addSubview:_waterflowView];
}

#pragma mark ZXWaterflowView Delegate & DataSoucre 

-(NSUInteger)numberOfCellsInWaterflowView:(ZXWaterflowView *)waterflowView{
    return 100;
}

-(ZXWaterflowViewCell *)waterflowView:(ZXWaterflowView *)waterflowView cellAtIndex:(NSUInteger)index{
    static    NSString *identifier = @"cell";
    
    ZXWaterflowViewCell *cell = [waterflowView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[ZXWaterflowViewCell alloc]init];
        cell.identifier = identifier;
    }
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

@end
