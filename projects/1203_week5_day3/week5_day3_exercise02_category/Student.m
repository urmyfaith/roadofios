//
//  Student.m
//  1203_week5_day3
//
//  Created by zx on 12/3/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Student.h"
#import "Score.h"
#import "Student+chinese.h"
#import "Student+English.h"
#import "Student+Math.h"

@implementation Student

-(NSArray *)scoreArray{
    if (_scoreArray == nil) {
        _scoreArray = [[NSMutableArray alloc]initWithCapacity:3];
    }
    return _scoreArray;
}

-(instancetype)init{
    if (self = [super init]) {

        NSString *filePath = @"/Users/zx/documents/projects/1203_week5_day3/week5_day3_exercise02_json/data.json";
        NSString *fileContent = [NSString stringWithContentsOfFile:filePath
                                                          encoding:NSUTF8StringEncoding
                                                             error:nil];
        NSData *data = [fileContent dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dic =  [NSJSONSerialization JSONObjectWithData:data
                                                             options:NSJSONReadingMutableContainers
                                                            error:nil];
        //NSLog(@"%@",dic);
        [self setName:dic[@"name"]];
        [self setAge:[dic[@"age"] integerValue]];
        NSDictionary *scoreDic =(dic[@"score"][0]);
       // NSLog(@"%@",scoreDic);
        NSArray *keys = [ scoreDic allKeys];
        for (int i=0; i < [scoreDic count]; i++) {
            Score *eachScore = [[Score alloc]init ];
            [eachScore setSubjectName:
                                    keys[i]];
            [eachScore setScore:
                                [[scoreDic objectForKey:keys[i]] integerValue]
                                ];
            [[self scoreArray] addObject:eachScore];
        }
    }
    return self;
}


//打印成绩
-(void)print{
    for (Score *eachScoer in [self scoreArray]) {
        [eachScoer printScore];
    }
}
@end
