//
//  Score.h
//  1203_week5_day3
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Score : NSObject

@property (nonatomic,assign)NSString * subjectName;
@property (nonatomic,assign)NSInteger score;

-(void)printScore;
@end
