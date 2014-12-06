//
//  main.m
//  week5_day5_dic01
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDictionary *dic1 = [NSDictionary dictionary];
        
        NSDictionary *dic2 =[ [NSDictionary alloc]initWithObjectsAndKeys:
                             @"aple",@"1",@"orange",@"2",@"pear",@"3",nil];
        NSLog(@"%@",dic2);
        
        NSDictionary *dic3 = [[NSDictionary alloc]initWithObjects:@[@"apple",@"orange"]
                   forKeys:@[@"11",@"22"]];
        NSLog(@"%@",dic3);
        
        NSDictionary *dic4 = [NSDictionary dictionaryWithObjectsAndKeys:@"apple",@"123",@"orange",@"456", nil];
        NSLog(@"%@",dic4);
        
        NSDictionary *dic6 = @{
                               @"1":@"apple",
                               @"2":@"orange",
                               @"3":@"pear"
                               };
        NSLog(@"%@",dic6);
        
        NSDictionary *dic5 = [NSDictionary dictionaryWithObject:@"apple" forKey:@"321"];
        NSLog(@"%@",dic5);
        
        NSString *str = [dic5 objectForKey:@"321"];
        NSLog(@"%@",str);
        
        NSArray *keys = [dic4 allKeys];
        NSArray *values = [dic4 allValues];
        
        for (int i=0; i < [dic4 count]; i++) {
            NSLog(@"key=%@,value=%@",keys[i],[dic4 objectForKey:keys[i]]);
        }
        
        for (NSString *key in [dic3 allKeys])
        {
            NSLog(@"%@",dic3[key]);
        }
        
        NSDictionary *dic7  = @{
                                @"tom":@[@"1234",@"M"],
                                @"cat":@[@"2345",@"W"],
                                @"dog":@[@"3456",@"M"],
                                @"John":@[@"4567",@"W"]
                                };
        for (NSString *key in dic7) {
            NSArray *array = dic7[key];
            NSLog(@"%@-->%@,%@",key,array[0],array[1]);
        }
        
        
        NSMutableDictionary *mutDic1 = [[NSMutableDictionary alloc]initWithCapacity:20];
        
        [mutDic1 addEntriesFromDictionary:dic7 ];
        NSLog(@"%@",mutDic1);
        
        [mutDic1 setObject:@"banana" forKey:@"5678"];
        NSLog(@"%@",mutDic1);
        
        [mutDic1 removeObjectForKey:@"5678"];
        NSLog(@"%@",mutDic1);
        
        //[mutDic1 removeObjectsForKeys:@[@"1234",@"2345"]];
         NSLog(@"%@",mutDic1);
        
       // [mutDic1 removeAllObjects];
        
        //修改,如果没有就增加
        [mutDic1 setObject:@"pear" forKey:@"horse"];
        NSLog(@"%@",mutDic1);
        
        //查
        //遍历
        NSMutableDictionary *dic10 = [NSMutableDictionary dictionary];
        
        [dic10 setObject:@"apple" forKey:@"1"];
        [dic10 setObject:@"orange" forKey:@"2"];
         NSLog(@"%@",dic10);
        
    }
    return 0;
}
