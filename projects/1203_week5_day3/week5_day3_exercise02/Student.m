//
//  Student.m
//  1203_week5_day3
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Student.h"
#import "Score.h"

@implementation Student

-(NSArray *)scoreArray{
    if (_scoreArray == nil) {
        _scoreArray = [[NSMutableArray alloc]init];
    }
    return _scoreArray;
}

-(instancetype)init{
    if (self = [super init]) {
        [self addScore];
    }
    return self;
}


-(instancetype)initWithName:(NSString *)name
                     andAge:(NSInteger)age{
    if (self = [super init]) {
        [self addScore];
        [self setName:name];
        [self setAge:20];
    }
    return self;
}
//写作业
-(void)doHomeWork{
    for (Score *eachScoer in [self scoreArray]) {
        //
         NSLog(@"doHomework:%@",[eachScoer subjectName]);
    }
}

//练字
-(void)calligraphy{
    NSLog(@"练字");
}

//背古诗
-(void)recitePoetry{
    NSLog(@"背古诗");
}


//做算术
-(void)doMath{
    NSLog(@"做算术");
}

//画几何图
-(void)geometricPainting{
    NSLog(@"画集合图");
}

//背单词
-(void)reciteWords{
    NSLog(@"被单词");
}

//练习交流
-(void)practiceExchanges{
    NSLog(@"练习交流");
}

-(void)addScore{
    //read from  file/jsonFile
    Score *chinese =  [[Score alloc]init];
    [chinese setSubjectName:@"语文"];
    [chinese setScore:90];
    [[self scoreArray] addObject:chinese];
    
    
    Score *english = [[Score alloc] init];
    [english setSubjectName:@"英语"];
    [english setScore:95];
    [[self scoreArray] addObject:english];
    
    Score *math = [[Score alloc]init];
    [math setSubjectName:@"数学"];
    [math setScore:100];
    [[self scoreArray] addObject:math];
}

//打印成绩
-(void)print{
    for (Score *eachScoer in [self scoreArray]) {
        [eachScoer printScore];
    }
}
@end
