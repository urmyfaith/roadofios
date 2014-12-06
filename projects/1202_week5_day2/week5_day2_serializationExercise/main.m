//
//  main.m
//  week5_day2_serializationExercise
//
//  Created by zx on 12/2/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Phone.h"


/**
 *  归档对象
 1. 创建对象
 2. 遵守协议
 3. 实现协议方法
 4. 对象赋值
 5. 数据持久化:到文件
 6. 从持久化的数据中恢复数据
 7. 显示结果.
 *
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *filePath = @"/Users/zx/documents/projects/1202_week5_day2/"
        "week5_day2_serializationExercise/phoneInfo.txt";
#if 0
        Phone *myPhone = [[Phone alloc] init];
        [myPhone setPhoneName:@"苹果"];
        [myPhone setColor:ColorWithRed];
        [myPhone setModleName:@"220"];
        
        
        [NSKeyedArchiver archiveRootObject:myPhone toFile:filePath];
        
        Phone *newPhone = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        
        NSLog(@"%@",newPhone);
#endif
      
        
#if 1
       
        Phone *myPhone = [[Phone alloc] initPhoneWithName:@"苹果"
                                                 andColor:ColorWithRed
                                                 andModle:@"220"];
        [NSKeyedArchiver archiveRootObject:myPhone toFile:filePath];
        
        Phone *newPhone = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        
        NSLog(@"%@",newPhone);
#endif
        
        
    }
    return 0;
}
