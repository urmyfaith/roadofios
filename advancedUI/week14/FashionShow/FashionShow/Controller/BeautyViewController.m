//
//  BeautyViewController.m
//  FashionShow
//
//  Created by zx on 15/2/3.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "BeautyViewController.h"

@interface BeautyViewController ()
@property (nonatomic,strong) NSMutableArray    *beautyModels_mArray;
@end

@implementation BeautyViewController
{
    NSString *_urlIdentifier;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
     
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    [self dataInitilnize];
    [self downloadData];
}

#pragma mark ---lazy_load_array
-(NSMutableArray *)beautyModels_mArray{
    if (nil == _beautyModels_mArray) {
        _beautyModels_mArray   = [[NSMutableArray alloc]init];
    }
    return _beautyModels_mArray;
}

/**
 *  数据初始化工作
 *  URL数据初始化.
 */
-(void)dataInitilnize{
    
    self.postURL_action = @"list";
    self.postURL_sa = @"MR";
    self.postURL_count = @"18";
    self.postURL_offset = @"0";
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
//        if (self.currentDisplyingView == fashionViewShowViewMD) {
//            [self.modelsMD_mArray removeAllObjects];
//        }
//        if (self.currentDisplyingView  == FashionViewShowViewDG) {
//            [self.modelsDG_mArray removeAllObjects];
//        }
    }
    NSArray *json2Moodel_array = [JSON2Model JSONData2ModelWithURLIdentifier:_urlIdentifier
                                                                 andDataType:zxJSON_DATATYPE_BEAUTYPAGE];
    if (json2Moodel_array.count > 0 ) {
        NSLog(@"%s [LINE:%d]", __func__, __LINE__);
//        if (self.currentDisplyingView == fashionViewShowViewMD) {
//            [self.modelsMD_mArray addObjectsFromArray:json2Moodel_array];
//            _models_mArray = self.modelsMD_mArray;
//        }
//        if (self.currentDisplyingView  == FashionViewShowViewDG) {
//            [self.modelsDG_mArray addObjectsFromArray:json2Moodel_array];
//            _models_mArray = self.modelsDG_mArray;
//        }
//        [_waterflowView reloadData];
    }
    else{
        [[[iToast makeText:@"亲,没数据啦!"] setDuration:iToastDurationNormal] show:iToastTypeNotice];
    }
}


@end
