//
//  ZXTableData.h
//  1219_exercise_v1
//
//  Created by zx on 12/20/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXTableData : NSObject

@property (nonatomic,strong)NSMutableArray *cityNames;
@property (nonatomic,strong)NSMutableArray *cityImages;
@property (nonatomic,strong)NSMutableArray *cityDetails;

-(void)loadTableDataWithFileName:(NSString *)fileName andFileType:(NSString *)fileType;
@end
