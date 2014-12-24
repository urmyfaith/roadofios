//
//  ZXTableData.h
//  1223_exercisev1
//
//  Created by zx on 12/23/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXTableData : NSObject

@property(nonatomic,strong)NSMutableArray * name_Marray;
@property(nonatomic,strong)NSMutableArray * sex_Marray;
@property(nonatomic,strong)NSMutableArray * telephone_Marray;
@property(nonatomic,strong)NSMutableArray * ID_Marray;

-(void)loadTableData;

@end
