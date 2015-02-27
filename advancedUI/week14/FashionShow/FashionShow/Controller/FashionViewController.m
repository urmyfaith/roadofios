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

/*==========自定义cell===========*/
#import "FashionCell.h"
#import "FashionModel.h"


typedef enum {
    fashionViewShowViewMD = 1,
    FashionViewShowViewDG
}FashionViewShowView;

@interface FashionViewController ()<ZXWaterflowViewDataSource,ZXWaterflowViewDelegate>

@property (nonatomic,strong) NSMutableArray    *modelsMD_mArray;
@property (nonatomic,strong) NSMutableArray    *modelsDG_mArray;
@property (nonatomic,assign)     NSUInteger   currentDisplyingView ;
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
    NSMutableArray *_models_mArray;
}

#pragma mark lazy-load-array
-(NSMutableArray *)modelsMD_mArray{
    if (nil == _modelsDG_mArray) {
        _modelsDG_mArray = [[NSMutableArray alloc]init];
    }
    return _modelsDG_mArray;
}

-(NSMutableArray *)modelsDG_mArray{
    if (nil == _modelsDG_mArray) {
        _modelsDG_mArray = [[NSMutableArray alloc]init];
    }
    return _modelsDG_mArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"背景"]];
    [self createWaterfallFlow];
    [self dataInitilnize];
    [self downloadData];
}

/**
 *  数据初始化工作
 *  1.添加键值观察,2.URL数据初始化.
 */
-(void)dataInitilnize{
    self.currentDisplyingView = fashionViewShowViewMD;
    [self addObserver:self forKeyPath:@"currentDisplyingView" options:NSKeyValueObservingOptionNew context:nil];
    
    self.postURL_action = @"piclist";
    self.postURL_sa = @"MD";
    self.postURL_count = @"18";
    self.postURL_offset = @"0";
}

/*
 键值观察,当值变化的之后调用
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSLog(@"%s [LINE:%d] keyPath=%@ object=%@ change=%@ contentx=%@", __func__, __LINE__,keyPath,object,change,context);
    if (self.currentDisplyingView == FashionViewShowViewDG) {
        _models_mArray = self.modelsDG_mArray;
    }
    if (self.currentDisplyingView == fashionViewShowViewMD) {
        _models_mArray = self.modelsMD_mArray;
    }
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
        if (self.currentDisplyingView == fashionViewShowViewMD) {
            [self.modelsMD_mArray removeAllObjects];
        }
        if (self.currentDisplyingView  == FashionViewShowViewDG) {
            [self.modelsDG_mArray removeAllObjects];
        }
    }
    NSArray *json2Moodel_array = [JSON2Model JSONData2ModelWithURLIdentifier:_urlIdentifier
                                                                 andDataType:zxJSON_DATATYPE_SPECIAL];
    if (json2Moodel_array.count > 0 ) {
        if (self.currentDisplyingView == fashionViewShowViewMD) {
            [self.modelsMD_mArray addObjectsFromArray:json2Moodel_array];
            _models_mArray = self.modelsMD_mArray;
        }
        if (self.currentDisplyingView  == FashionViewShowViewDG) {
            [self.modelsDG_mArray addObjectsFromArray:json2Moodel_array];
            _models_mArray = self.modelsDG_mArray;
        }
        [_waterflowView reloadData];
    }
    else{
        [[[iToast makeText:@"亲,没数据啦!"] setDuration:iToastDurationNormal] show:iToastTypeNotice];
    }
    [_waterflowView headerEndRefreshing];
    [_waterflowView footerEndRefreshing];
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
    
    //刷新数据
    [_waterflowView addHeaderWithTarget:self action:@selector(loadNewItems)];
    [_waterflowView addFooterWithTarget:self action:@selector(loadMoreItems)];
}

#pragma mark 刷新数据的方法
-(void)loadNewItems{
    
    self.postURL_offset = @"0";
    [self downloadData];
}
-(void)loadMoreItems{
    
    static int page = 1;
    self.postURL_offset = [NSString stringWithFormat:@"%d",self.postURL_count.intValue * page];
    page++;
    [self downloadData];
}


#pragma mark ZXWaterflowView Delegate & DataSoucre 

//加载数据源
-(NSUInteger)numberOfCellsInWaterflowView:(ZXWaterflowView *)waterflowView{
    return _models_mArray.count;
}

-(ZXWaterflowViewCell *)waterflowView:(ZXWaterflowView *)waterflowView cellAtIndex:(NSUInteger)index{
    FashionCell *cell = [FashionCell cellWithWaterflowView:waterflowView];
    
    //首次刷新的时候,数组count为0
    if (_models_mArray.count ) {
        cell.fashionModel = [_models_mArray objectAtIndex:index];
    }
    return cell;
}

//调整外观
-(CGFloat)waterflowView:(ZXWaterflowView *)waterflowView marginForType:(ZXWaterFlowViewMarginType)type{
    switch (type) {
        case ZXWaterFlowViewMarginTypeTop:
            return 0.0f;
        case ZXWaterFlowViewMarginTypeBottom:
            return 0.0f;
        case ZXWaterFlowViewMarginTypeLeft:
            return 0.0f;
        case ZXWaterFlowViewMarginTypeRight:
            return 0.0f;
        case ZXWaterFlowViewMarginTypeColumn:
            return 0.0f;
        case ZXWaterFlowViewMarginTypeRow:
            return 1.0f;
    }
    return 0.0f;
}

/**
 *  这个方法应该是对于自定义的cell最为有用的方法,确定每个cell的高度
 */

-(CGFloat)waterflowView:(ZXWaterflowView *)waterflowView heightAtIndex:(NSUInteger)index{
    FashionModel *fm = (FashionModel *)[_models_mArray objectAtIndex:index];
    return fm.pic_height/2;
}

@end
