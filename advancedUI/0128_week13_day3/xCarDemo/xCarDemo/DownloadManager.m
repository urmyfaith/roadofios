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

#import "Letter.h"
#import "Brand.h"
#import "SubBrand.h"
#import "Serie.h"


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
                    NSLog(@"%s [LINE:%d] NSCFNumber: key=%@ value =%@ ", __func__, __LINE__,key,dic[key]);
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
    
    if (download.downloadType == cCar_LIST_TYPE) {
        
        NSArray *lettersArray = [rootDic objectForKey:@"letters"];
        for (NSDictionary *dic0 in lettersArray ) {
            
            Letter *letter =[[Letter alloc]init];
            letter.letterName = dic0[@"letter"];
            NSArray *brandsArray  = [dic0 objectForKey:@"brands"];
            for (NSDictionary *dic1 in brandsArray) {
                
                Brand *brand  = [[Brand alloc]init];
                brand.brandIcon = dic1[@"icon"];
                brand.brandName = dic1[@"name"];
                
                NSArray *brandSubBrandsArray = dic1[@"subBrands"];
                for (NSDictionary *dic2 in brandSubBrandsArray) {
                    SubBrand *subBrand = [[SubBrand alloc]init];
                    subBrand.subBrandName = dic2[@"subBrandName"];
                    subBrand.subBrandSeriesNum = dic2[@"seriesNum"];
                    NSArray *seriesArray = dic2[@"series"];
                    for (NSDictionary *dic3 in seriesArray) {
                        Serie *serie = [[Serie alloc]init];
                        serie.serieName = dic3[@"name"];
                        serie.serieId = dic3[@"id"];
                        serie.serieIcon = dic3[@"icon"];
                        serie.seriePrice = dic3[@"price"];
                        [subBrand.subBrandSeriesArray addObject:serie];
                    }
                    [brand.brandSubBrandsArray addObject:subBrand];
                }
                [letter.letterBrandsArray addObject:brand];
            }
            [dataArray addObject:letter];
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
