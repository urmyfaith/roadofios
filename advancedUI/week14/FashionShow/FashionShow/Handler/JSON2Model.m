//
//  JSON2Model.m
//  FashionShow
//
//  Created by zx on 15/2/5.
//  Copyright (c) 2015年 zx. All rights reserved.
//

#import "JSON2Model.h"
#import "GenericModel.h"


@implementation JSON2Model

+(NSArray *)JSONData2ModelWithURLIdentifier:(NSString *)urlIdentifier andDataType:(int)dataType{
    
    NSData *data = [[DownloadManager sharedDownloadManager]getDownloadDataWithURLIdentifier:urlIdentifier];
    
    NSDictionary *root_dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//  NSLog(@"%s [LINE:%d dic=%@]", __func__, __LINE__,root_dic);
    
    NSMutableArray *models_array = [[NSMutableArray alloc]init];
    
    switch (dataType) {
        case zxJSON_DATATYPE_GENERIC:
            {
                //解析数据
                NSArray *list_array = root_dic[@"list"];
                for (NSDictionary *dic in list_array) {
                    GenericModel *gm  =  [GenericModel modelWithDic:dic];
                    [models_array addObject:gm];
                }
            }
            break;
        case zxJSON_DATATYPE_SPECIAL:
            {
                //解析美搭,导购数据
            }
            break;
            
        default:
            break;
    }
    return models_array;
}

@end
