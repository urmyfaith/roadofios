//
//  NewListItem.m
//  xCarDemo
//
//  Created by zx on 1/29/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "NewListItem.h"

@implementation NewListItem


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"%s [LINE:%d] key=%@", __func__, __LINE__,key);
}
@end
