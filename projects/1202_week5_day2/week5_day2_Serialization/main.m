//
//  main.m
//  week5_day2_Serialization
//
//  Created by zx on 12/2/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person1 = [[Person alloc]init];
        person1.name = @"tom";
        person1.age = 20;
        [person1 run];
        
#if 0
        //===sierialization system objects.====
        
        NSString *filePath = @"/Users/zx/documents/projects/1202_week5_day2/week5_day2_Serialization/saveObject.txt";
        
        NSArray *array = @[@"11",[NSNumber numberWithInt:4],person1];
        
        //sierialization to NSData
        NSData *data =  [NSKeyedArchiver archivedDataWithRootObject:array];

        
        //sierialization to file
        [NSKeyedArchiver archiveRootObject:array toFile:filePath];
        
        //get the stored content.
        NSArray *newArray = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        NSLog(@"%@",newArray);
        
        Person *person2 = newArray[2];
        NSLog(@"name=%@,age=%i",person2.name,person2.age);
       
        
        //==== 对自定义的类进行归档=====
        Person *person3 = [[Person alloc]init];
        person3.name = @"kate";
        person3.age = 30;
        
        //serialization obj.
        [NSKeyedArchiver archiveRootObject:person3 toFile:filePath];
        
        //get save ojb.
        Person *person4 = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        NSLog(@"name=%@,age=%i",person4.name,person4.age);
        
#endif
       
        
#if 1
     //   NSUserDefaults *default = [NSUserDefaults stand];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        [defaults setObject:@"tom" forKey:@"name"];
        [defaults setFloat:3 forKey:@"num"];
        
#endif
        
    }
    return 0;
}
