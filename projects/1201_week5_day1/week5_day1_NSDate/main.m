//
//  main.m
//  week5_day1_NSDate
//
//  Created by zx on 12/1/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       //
#if 0
        //获取当前时间==>直接输出是格林尼治时间
        NSDate *date = [NSDate date];
        NSLog(@"%@",date);
        
        //输出本地时间
        NSDate *localDate = [date dateByAddingTimeInterval:60*60*8];
        NSLog(@"%@",localDate);
        
        //过去的时间和将来的时间.
        
        NSDate *date2 = [NSDate distantFuture];
        NSDate *date3 = [NSDate distantPast];
        
        NSLog(@"%@",date2);
        NSLog(@"%@",date3);
        /*
         2014-12-01 16:56:35.805 week5_day1_NSDate[2065:121401] 4001-01-01 00:00:00 +0000
         2014-12-01 16:56:35.805 week5_day1_NSDate[2065:121401] 0000-12-30 00:00:00 +0000
         */
        
        
        //时间比较
        NSDate *date4 = [ NSDate date];
        
       if( [date4 isEqualToDate:date])
           NSLog(@"time equal");
       else
           NSLog(@"not equal");

#endif
        
        
#if 1
        
        //====时间转换====
        
        //时间=>字符串
        NSDateFormatter *format = [[NSDateFormatter alloc]init];
        
        //确定标准
        //@"1985-09-02 23:13:14"
        //HH表示24小时指,hh表示12小时制
        format.dateFormat =@"yyyy-MM-dd HH:mm:ss:SSS";
        
        NSDate *date = [NSDate date];
        NSString *string = [format stringFromDate:date];
        
        NSLog(@"%@",string);
        
        
        //字符串==>日期
        NSDate *newDate = [format dateFromString:string];
        NSLog(@"%@",newDate);
 #endif
        
        
    }
    return 0;
}
