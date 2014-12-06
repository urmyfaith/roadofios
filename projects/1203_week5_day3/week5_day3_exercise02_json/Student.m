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
        _scoreArray = [[NSMutableArray alloc]initWithCapacity:3];
    }
    return _scoreArray;
}

-(instancetype)init{
    if (self = [super init]) {

#if 1
        NSString *filePath = @"/Users/zx/documents/projects/1203_week5_day3/week5_day3_exercise02_json/data.json";
        NSString *fileContent = [NSString stringWithContentsOfFile:filePath
                                                          encoding:NSUTF8StringEncoding
                                                             error:nil];
        NSData *data = [fileContent dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *dic =  [NSJSONSerialization JSONObjectWithData:data
                                                             options:NSJSONReadingMutableContainers
                                                            error:nil];
#endif
        
#if 0
        /*
         A full or relative pathname. 
         The file identified by path must contain a string 
         representation of a property list
         whose root object is a dictionary.要求最外层为字典.*/
        NSString *filePath = @"/Users/zx/documents/projects/1203_week5_day3/week5_day3_exercise02_json/data.json";
        NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
#endif
        
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

//打印成绩
-(void)print{
    for (Score *eachScoer in [self scoreArray]) {
        [eachScoer printScore];
    }
}
@end
