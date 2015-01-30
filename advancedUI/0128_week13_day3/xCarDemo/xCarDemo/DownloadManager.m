//
//  DownloadManager.m
//  xCarDemo
//
//  Created by zx on 1/28/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "DownloadManager.h"
#import "FocusListItem.h"
#import "NewListItem.h"

@implementation DownloadManager
{
    NSMutableDictionary *_taskDict;
    NSMutableDictionary *_sourceDict;
}

static DownloadManager *_sharedDownloadManager;

+(DownloadManager *)sharedDownloadManager{
    if (!_sharedDownloadManager) {
        _sharedDownloadManager = [[DownloadManager alloc]init];
    }
    return _sharedDownloadManager;
}

-(id)init{
    self = [super init];
    if (self) {
        _taskDict = [[NSMutableDictionary alloc] init];
        _sourceDict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)addDownloadWithDownloadStr:(NSString *)downloadStr andDownloadType:(int)downloadType{
    if ([_sourceDict objectForKey:downloadStr]) {
        [[NSNotificationCenter defaultCenter]postNotificationName:downloadStr object:nil];
    }
    else{
        if ([_taskDict objectForKey:downloadStr]) {
            NSLog(@"%s [LINE:%d] downloading...", __func__, __LINE__);
        }else{
            Download *dl = [[Download alloc]init];
            dl.downloadStr = downloadStr;
            dl.downloadType = downloadType;
            dl.delegate = self;
            [dl download];
            [_taskDict setObject:dl forKey:downloadStr];
        }
    }
}

-(void)downloadFinishWithDownLoad:(Download *)download{
    [_taskDict removeObjectForKey:download.downloadStr];
    
    NSDictionary *rootDic = [NSJSONSerialization JSONObjectWithData:download.downloadData options:NSJSONReadingMutableContainers error:nil];
    
    NSMutableArray *dataArray = [[NSMutableArray alloc]init];
    
    if (download.downloadType == cFOCUS_LIST_TYPE) {
        
        NSArray *focusImgsArray = [rootDic objectForKey:@"focusImgs"];
        for (NSDictionary *dic in focusImgsArray) {
            FocusListItem *fli  = [[FocusListItem alloc]init];
            [fli setValuesForKeysWithDictionary:dic];
            [dataArray addObject:fli];
        }
    }
    if (download.downloadType == cNNEWS_LIST_TYPE) {
        NSArray *newItemArray = [rootDic objectForKey:@"news"];
        for (NSDictionary *dic in newItemArray) {
            NewListItem *ni = [[NewListItem alloc]init];
            [ni setValuesForKeysWithDictionary:dic];
            [dataArray addObject:ni];
        }
    }
    if (download.downloadType == cNNEWS_LIST_PRICE_TYPE) {
        NSArray *newsArray = [rootDic objectForKey:@"news"];
        for (NSDictionary *dic in newsArray) {
            NewListItem *nli = [[NewListItem alloc]init];
            nli.newsTitle = [dic objectForKey:@"newsTitle"];
            nli.newsLink = [dic objectForKey:@"newsLink"];
            nli.createDate = [NSString stringWithFormat:@"%@",[dic objectForKey:@"createDate"]];
            [dataArray addObject:nli];
        }
    }
    [_sourceDict setObject:dataArray forKey:download.downloadStr];//缓存数据
    [[NSNotificationCenter defaultCenter]postNotificationName:download.downloadStr object:nil];
}

-(NSMutableArray *)getDownloadDataWithDownloadStr:(NSString *)downloadStr{
    return [_sourceDict objectForKey:downloadStr];//取数据
}

@end
