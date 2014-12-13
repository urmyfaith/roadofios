//
//  ZXSignalModel.h
//  1213_passValue01
//
//  Created by zx on 12/13/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXSignalModel : NSObject

+(ZXSignalModel *)sharedSignalModel;

@property (nonatomic,copy)NSString *name;

@end
