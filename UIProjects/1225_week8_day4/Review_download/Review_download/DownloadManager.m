//
//  DownloadManager.m
//  Review_download
//
//  Created by zx on 1/15/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "DownloadManager.h"

@implementation DownloadManager
{
    //两个成员变量,在init方法里初始化.
    
    NSMutableDictionary *_taskDict;//下载任务对队列字典
    NSMutableDictionary *_sourceDict;//下载任务的缓存字典
    
}
-(void)addDownloadWithDownloadStr:(NSString *)downloadStr andDownloadType:(int)downloadType{
    
    // 1.判断当前要下载的数据是否有缓存
    if ([_sourceDict objectForKey:downloadStr]) {
        //有缓存,通知界面,可以直接取数据使用
    }
    else{
        //无缓存==>下载数据
        //2.判断当前的下载的数据是否正在下载
        if ([_taskDict objectForKey:downloadStr]) {
            //downloading===>无需重复下载
        }
        else{
            //创建下载对象,开始下载.
            Download *dl = [[Download alloc]init];
            
            dl.downloadStr = downloadStr;
            dl.downloadType = downloadType;
            dl.delegate = self;
            [dl startDownload];
            
            //
            [_taskDict setObject:dl forKey:downloadStr];
            
            
        }
    }
}

//下载完成的协议方法
-(void)downloadDataFinishWithDL:(Download *)dl{
    
    //传递对象,而不是传递属性.
    //1.要将下载从下载任务字典中移除
    
    [_taskDict removeObjectForKey:dl.downloadStr];

    //2.解析数据
    NSMutableArray *dataArray = [[NSMutableArray alloc]init];
    
    if (0 == dl.downloadType) {
        //
    }else if (1 == dl.downloadType){
        //
    }
    else{
        
    }
    
    //3.缓存数据
    [_sourceDict setObject:dataArray forKey:dl.downloadStr];
    
    //4.通知界面,数据可以取用.
}

//返回下载数据
-(NSMutableArray *)getDataArrayWithDownloadStr:(NSString *)downloadStr{
    return [_sourceDict objectForKey:downloadStr];
}

#pragma mark  管理类----单例
/**
 *  单例分为2种:
 * 1:普通单例,如下
 * 2:绝对单例,把alloc,release,retain等全部重写
 */


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
        _taskDict = [[NSMutableDictionary alloc]init];
        _sourceDict = [[NSMutableDictionary alloc]init];
    }
    return self;
}
@end
