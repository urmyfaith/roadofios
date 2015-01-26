//
//  main.m
//  Deep_Shallow_Copy
//
//  Created by zx on 1/26/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    
    
#pragma mark /*==========非容器类+不可变对象===========*/
    
#if 0
    
    NSString *str = @"hello world";
    NSLog(@"str = %@ ,  retainCount = %d",str,(int)(str.retainCount));
    
    NSString *str_retain = [str retain];
    NSLog(@"str_retain = %@ ,retainCount = %d",str_retain,(int)(str_retain.retainCount));
    
    NSString *str_copy =[str copy];
    NSLog(@"ststr_copyr = %@ ,retainCount = %d",str_copy,(int)(str_copy.retainCount));

    NSString *str_mutableCopy =[str mutableCopy];
    NSLog(@"str_mutableCopy = %@ ,retainCount = %d",str_mutableCopy,(int)(str_mutableCopy.retainCount));
    
    NSLog(@"str = %p",str);
    NSLog(@"str_retain = %p",str_retain);
    NSLog(@"ststr_copyr = %p",str_copy);
    NSLog(@"str_mutableCopy = %p",str_mutableCopy);
    /*
     2015-01-26 18:11:38.535 Deep_Shallow_Copy[8266:582180] str = hello world ,  retainCount = -1
     2015-01-26 18:11:38.536 Deep_Shallow_Copy[8266:582180] str_retain = hello world ,retainCount = -1
     2015-01-26 18:11:38.537 Deep_Shallow_Copy[8266:582180] ststr_copyr = hello world ,retainCount = -1
     2015-01-26 18:11:38.537 Deep_Shallow_Copy[8266:582180] str_mutableCopy = hello world ,retainCount = 1
     
     2015-01-26 18:11:38.537 Deep_Shallow_Copy[8266:582180] str = 0x100001058
     2015-01-26 18:11:38.537 Deep_Shallow_Copy[8266:582180] str_retain = 0x100001058
     2015-01-26 18:11:38.537 Deep_Shallow_Copy[8266:582180] ststr_copyr = 0x100001058
     2015-01-26 18:11:38.538 Deep_Shallow_Copy[8266:582180] str_mutableCopy = 0x100400510
     */
#endif
    
#pragma mark     /*==========非容器类+可变对象===========*/

#if 0
    
    NSMutableString *string = [NSMutableString stringWithFormat:@"hello world"];
    NSLog(@"string = %@ , retianCount = %ld",string,string.retainCount);
    
    
    NSMutableString *string_retain = [string retain];
    NSLog(@"string_retain = %@ , retianCount = %ld",string_retain,string_retain.retainCount);
    
    
    NSMutableString *string_copy = [string copy];
    NSLog(@"string_copy = %@ , retianCount = %ld",string_copy,string_copy.retainCount);
    
    
    NSMutableString *string_mcopy = [string mutableCopy];
    NSLog(@"string_mcopy = %@ , retianCount = %ld",string_mcopy,string_mcopy.retainCount);
    
    NSLog(@"string -p = %p",string);
    NSLog(@"string_retain -p = %p",string_retain);
    NSLog(@"string_copy -p = %p",string_copy);
    NSLog(@"string_mcopy -p = %p",string_mcopy);
    
    /*
     2015-01-26 18:07:46.841 Deep_Shallow_Copy[8247:580271] string = hello world , retianCount = 1
     2015-01-26 18:07:46.842 Deep_Shallow_Copy[8247:580271] string_retain = hello world , retianCount = 2
     2015-01-26 18:07:46.842 Deep_Shallow_Copy[8247:580271] string_copy = hello world , retianCount = 1
     2015-01-26 18:07:46.842 Deep_Shallow_Copy[8247:580271] string_mcopy = hello world , retianCount = 1
     
     2015-01-26 18:07:46.843 Deep_Shallow_Copy[8247:580271] string -p = 0x10010f6f0
     2015-01-26 18:07:46.843 Deep_Shallow_Copy[8247:580271] string_retain -p = 0x10010f6f0
     2015-01-26 18:07:46.843 Deep_Shallow_Copy[8247:580271] string_copy -p = 0x100200510
     2015-01-26 18:07:46.843 Deep_Shallow_Copy[8247:580271] string_mcopy -p = 0x1002001e0
     */
    
#endif
   
    
#pragma mark     /*==========容器类+不可变对象===========*/
    
#if 0
    
    NSMutableString *string = [NSMutableString stringWithFormat:@"hello"];
    
    NSArray *array = [NSArray arrayWithObjects:string,@"world", nil];
    NSLog(@"array [0] = %@ , array retainCount = %ld",array[0],array.retainCount);
    
    NSArray *array_retain =  [array retain];
    NSLog(@"array_retain [0] = %@ , array_retain retainCount = %ld",array_retain[0],array_retain.retainCount);

    NSArray *array_copy = [array copy];
    NSLog(@"array_copy [0] = %@ , array_copy retainCount = %ld",array_copy[0],array_copy.retainCount);
    
    NSArray *array_mcopy = [array mutableCopy];
    NSLog(@"array_mcopy [0] = %@ , array_mcopy retainCount = %ld",array_mcopy[0],array_mcopy.retainCount);
    
    NSLog(@"array -p = %p",array);
    NSLog(@"array_retain -p = %p",array_retain);
    NSLog(@"array_copy -p = %p",array_copy);
    NSLog(@"array_mcopy -p = %p",array_mcopy);
    
    NSLog(@"array[0] -p = %p",array[0]);
    NSLog(@"array_retain[0] -p = %p",array_retain[0]);
    NSLog(@"array_copy[0] -p = %p",array_copy[0]);
    NSLog(@"array_mcopy[0] -p = %p",array_mcopy[0]);
    
    /*
     2015-01-26 19:01:45.748 Deep_Shallow_Copy[8525:601200] array [0] = hello , array retainCount = 1
     2015-01-26 19:01:45.749 Deep_Shallow_Copy[8525:601200] array_retain [0] = hello , array_retain retainCount = 2
     2015-01-26 19:01:45.749 Deep_Shallow_Copy[8525:601200] array_copy [0] = hello , array_copy retainCount = 3
     2015-01-26 19:01:45.750 Deep_Shallow_Copy[8525:601200] array_mcopy [0] = hello , array_mcopy retainCount = 1
     
     2015-01-26 19:01:45.750 Deep_Shallow_Copy[8525:601200] array -p = 0x10020f670
     2015-01-26 19:01:45.750 Deep_Shallow_Copy[8525:601200] array_retain -p = 0x10020f670
     2015-01-26 19:01:45.750 Deep_Shallow_Copy[8525:601200] array_copy -p = 0x10020f670
     2015-01-26 19:01:45.750 Deep_Shallow_Copy[8525:601200] array_mcopy -p = 0x100100460
     
     2015-01-26 19:01:45.750 Deep_Shallow_Copy[8525:601200] array[0] -p = 0x10020f480
     2015-01-26 19:01:45.750 Deep_Shallow_Copy[8525:601200] array_retain[0] -p = 0x10020f480
     2015-01-26 19:01:45.751 Deep_Shallow_Copy[8525:601200] array_copy[0] -p = 0x10020f480
     2015-01-26 19:01:45.751 Deep_Shallow_Copy[8525:601200] array_mcopy[0] -p = 0x10020f480
     
     */
    
#endif
    
    
#pragma mark     /*==========容器类+可变对象===========*/

#if 1
    
    NSMutableString *string = [NSMutableString stringWithFormat:@"hello"];
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:string,@"world", nil];
    NSLog(@"array [0] = %@  retainCount = %ld",[ array objectAtIndex:0], array.retainCount);
    
    NSMutableArray *array_retain = [array retain];
    NSLog(@"array_retain [0] = %@  retainCount = %ld",[ array_retain objectAtIndex:0], array_retain.retainCount);
    
    NSMutableArray *array_copy = [array copy];
    NSLog(@"array_copy [0] = %@  retainCount = %ld",[ array_copy objectAtIndex:0], array_copy.retainCount);
   
    NSMutableArray *array_mcopy = [array mutableCopy];
    NSLog(@"array_mcopy [0] = %@  retainCount = %ld",[ array_mcopy objectAtIndex:0], array_mcopy.retainCount);
    
    NSLog(@"array -p = %p ",array);
    NSLog(@"array_retain -p = %p ",array_retain);
    NSLog(@"array_copy -p = %p ",array_copy);
    NSLog(@"array_mcopy -p = %p ",array_mcopy);
    
    
    NSLog(@"array[0] -p = %p ",array[0]);
    NSLog(@"array_retain[0] -p = %p ",array_retain[0]);
    NSLog(@"array_copy[0] -p = %p ",array_copy[0]);
    NSLog(@"array_mcopy[0] -p = %p ",array_mcopy[0]);
    
    /*
     2015-01-26 19:45:31.715 Deep_Shallow_Copy[8757:619748] array [0] = hello  retainCount = 1
     2015-01-26 19:45:31.716 Deep_Shallow_Copy[8757:619748] array_retain [0] = hello  retainCount = 2
     2015-01-26 19:45:31.717 Deep_Shallow_Copy[8757:619748] array_copy [0] = hello  retainCount = 1
     2015-01-26 19:45:31.717 Deep_Shallow_Copy[8757:619748] array_mcopy [0] = hello  retainCount = 1
     
     2015-01-26 19:45:31.717 Deep_Shallow_Copy[8757:619748] array -p = 0x10010f900
     2015-01-26 19:45:31.717 Deep_Shallow_Copy[8757:619748] array_retain -p = 0x10010f900
     2015-01-26 19:45:31.717 Deep_Shallow_Copy[8757:619748] array_copy -p = 0x100400120
     2015-01-26 19:45:31.717 Deep_Shallow_Copy[8757:619748] array_mcopy -p = 0x100400180
     
     2015-01-26 19:45:31.718 Deep_Shallow_Copy[8757:619748] array[0] -p = 0x10010f6f0
     2015-01-26 19:45:31.718 Deep_Shallow_Copy[8757:619748] array_retain[0] -p = 0x10010f6f0
     2015-01-26 19:45:31.718 Deep_Shallow_Copy[8757:619748] array_copy[0] -p = 0x10010f6f0
     2015-01-26 19:45:31.718 Deep_Shallow_Copy[8757:619748] array_mcopy[0] -p = 0x10010f6f0
     */
    
#endif

    return 0;
}

