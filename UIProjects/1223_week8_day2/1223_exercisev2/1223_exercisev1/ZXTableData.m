//
//  ZXTableData.m
//  1223_exercisev1
//
//  Created by zx on 12/23/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXTableData.h"
@implementation ZXTableData

-(NSMutableArray *)name_Marray{
    if (_name_Marray == nil) {
        _name_Marray =[NSMutableArray array];
    }
    return _name_Marray;
}

-(NSMutableArray *)sex_Marray{
    if (_sex_Marray  == nil) {
        _sex_Marray = [NSMutableArray array];
    }
    return _sex_Marray;
}
-(NSMutableArray *)telephone_Marray{
    if (_telephone_Marray == nil) {
        _telephone_Marray = [NSMutableArray array];
    }
    return _telephone_Marray;
}
-(NSMutableArray *)ID_Marray{
    if (_ID_Marray == nil) {
        _ID_Marray =[NSMutableArray array];
    }
    return _ID_Marray;
}
-(void)loadTableData{
    self.name_Marray = [[NSMutableArray alloc ]initWithArray:
                        @[@"tom",@"jack",@"rose",
                        @"Olive",@"Georgia",@"Kate",
                        @"Raye",@"Ada",@"Helen"]];
    self.sex_Marray = [[NSMutableArray alloc ]initWithArray:
                       @[@"male",@"female",@"male",
                        @"female",@"male",@"female",
                        @"male",@"female",@"female"]];
    self.telephone_Marray = [[NSMutableArray alloc ]initWithArray:
                      @[ @"15271817922",@"13946274144",@"13925000208",
                       @"13945278998",@"13904523339",@"15697630898",
                       @"13632219317",@"13518794502",@"15215048576"]];
    self.ID_Marray = [[NSMutableArray alloc ]initWithArray:
                             @[@"421831199905243010",@"421831199905243011",@"421831199905243012",
                             @"421831199905243013",@"421831199905243014",@"421831199905243015",
                             @"421831199905243016",@"421831199905243017",@"421831199905243018"]];
    
}
@end
