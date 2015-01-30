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
#import "CONST.h"


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

-(void)addDownloadWithDownloadStr:(NSString *)downloadStr
                  andDownloadType:(int)downloadType
                     andItemIndex:(NSString *)downloadIndex
{
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
            dl.downloadItemIndex = downloadIndex;
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
    
    //下载数据===>存储到数据库
    
    if (download.downloadType == cFOCUS_LIST_TYPE) {
        
        NSArray *focusImgsArray = [rootDic objectForKey:@"focusImgs"];
        for (NSDictionary *dic in focusImgsArray) {
            FocusListItem *fli  = [[FocusListItem alloc]init];
            [fli setValuesForKeysWithDictionary:dic];
            [[DataBase sharedDateBase] insertFocusItem:fli];//------>存入数据库
            [dataArray addObject:fli];
        }
    }
    if (download.downloadType == cNNEWS_LIST_TYPE) {
        NSArray *newItemArray = [rootDic objectForKey:@"news"];
        for (NSDictionary *dic in newItemArray) {

            NewListItem *ni = [[NewListItem alloc]init];
            for (NSString *key  in  [dic allKeys]) {
                if ([dic[key] isKindOfClass:[NSNumber class]]){
                    NSLog(@"dic = %@ key=%@",dic,key);
                    [ni setValue:[NSString stringWithFormat:@"%@",dic[key]] forKey:key];
                }
                else{
                    [ni setValue:dic[key] forKey:key];
                }
                ni.itemIndex = download.downloadItemIndex;
            }
            [[DataBase sharedDateBase]insertNewsItem:ni];//------>存入数据库
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
            nli.itemIndex = download.downloadItemIndex;
         
            [dataArray addObject:nli];
            [[DataBase sharedDateBase]insertNewsItem:nli];//------>存入数据库
        }
    }
    
    //缓存数据===>字典中.
    [_sourceDict setObject:dataArray forKey:download.downloadStr];//缓存数据
    


    
    
    [[NSNotificationCenter defaultCenter]postNotificationName:download.downloadStr object:nil];
}

-(NSMutableArray *)getDownloadDataWithDownloadStr:(NSString *)downloadStr{
    return [_sourceDict objectForKey:downloadStr];//取数据
}

@end
