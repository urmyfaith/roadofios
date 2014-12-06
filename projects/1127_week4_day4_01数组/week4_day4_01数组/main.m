//
//  main.m
//  week4_day4_01数组
//
//  Created by zx on 11/27/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
#if 1
        char *str="good";
        NSArray *array = [NSArray arrayWithObjects:@"good",@"33",nil];
        
        NSLog(@"%s--%@",str,array);
        
        NSArray *array1 = [NSArray array];
        NSArray *array2 = [[NSArray alloc] initWithObjects:@"11",@"22",nil];
        NSArray *array3 = [[NSArray alloc] initWithArray:array2];
        
        NSArray *array4 = [NSArray arrayWithObjects:@"11",@"33",nil];
        
        NSArray *array5 = [NSArray arrayWithArray:array4];
        
        NSArray *array6 = [NSArray arrayWithObject:@"66"];
        
        NSArray *array7 = @[@"88",@"99"];//结尾的nil自动添加.
        
        NSString *string = [array4 objectAtIndex:1];
        
        NSString *string1 = array4[1];
        
        NSLog(@"%@,%@",string,string1);
        
        NSIndexSet *set = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(0, 2)];
        NSArray *subArray = [array5 objectsAtIndexes:set];
        
        NSLog(@"%@",subArray);
        
        for (int i=0; i< [array5 count]; i++) {
            NSLog(@"%@",array5[i]);
        }
        for (id string in array5) {
            NSLog(@"%@",string);
        }
        
        
        Car *car1 = [[Car alloc] initWithColor:ColorWithRed andName:@"宝马"];
        Car *car2 = [[Car alloc] initWithColor:ColorWithWhite andName:@"凯迪拉克"];
        Car *car3 = [[Car alloc]initWithColor:ColorWithGolden andName:@"法拉利"];
        
        NSArray *arrayCar = @[car1,car2,car3];
        
        for (Car *  car in arrayCar) {
            NSLog(@"%@  color is %i",car.name,car.color);
        }
        for ( Car * car in arrayCar) {
            NSLog(@"%@  color is %i",[car name],[car color]);
        }
        for ( id car in arrayCar) {
            NSLog(@"%@  color is %i",[car name],[car color]);
        }
        
        //problem
        for ( id car in arrayCar) {
             //NSLog(@"%@  color is %i",mycar.name,mycar.color);
             Car *car4 = (Car *)car;
             NSLog(@"%@  color is %i",car4.name,car4.color);
        }
        
#endif
        
#if 0
        BOOL isExt = [arrayCar containsObject:car1];
        
        if (isExt) {
            Car *car5 =  arrayCar[0];
        }
        
        NSMutableArray *mutArr1 = [[NSMutableArray alloc]initWithCapacity:10];
        NSMutableArray *mutArr2 = [[NSMutableArray alloc]initWithArray:@[@"11",@"22"]];
        
        [mutArr2 addObject:@"33"];
        NSLog(@"%@",mutArr2);
        
        [mutArr2 addObjectsFromArray:arrayCar];
        NSLog(@"%@",mutArr2);
        
        [mutArr2 insertObject:@"44" atIndex:4];
        NSLog(@"%@",mutArr2);
        
        NSIndexSet *set2 = [[NSIndexSet alloc]initWithIndex:3];
        [mutArr2 insertObjects:@[@"55"] atIndexes:set2];
        NSLog(@"%@",mutArr2);
        
        NSIndexSet *set3 = [[NSIndexSet alloc]initWithIndexesInRange:NSMakeRange(0, 3)];
        [mutArr2 insertObjects:arrayCar   atIndexes:set3];
        NSLog(@"%@",mutArr2);
     
        
        [mutArr2 removeObject:@"55"];
        NSLog(@"%@",mutArr2);

        [mutArr2 removeObjectAtIndex:2];
        NSLog(@"%@",mutArr2);
        
        [mutArr2 removeLastObject];
        NSLog(@"%@",mutArr2);
        
        [mutArr2 removeObject:@"55" inRange:NSMakeRange(0, 5)];
         NSLog(@"%@",mutArr2);
        
        NSArray *array20 = @[@"11",@"22",@"77"];
        [mutArr2 removeObjectsInArray:array20];
        NSLog(@"%@",mutArr2);
        
        [mutArr2 setArray:arrayCar];
        NSLog(@"%@",mutArr2);
        
        //排序
        NSMutableArray *mutArr3 = [[NSMutableArray alloc]initWithArray:@[@"44",@"22",@"55",@"11",@"33"]];
        
         NSLog(@"%@",mutArr3);
        int i,j;
        for (i = 0; i < [mutArr3 count] - 1; i++) {
            for ( j =0; j < [mutArr3 count]- i-1; j++ ) {
                //if ([mutArr3[j] compare:mutArr3[j+1]] == NSOrderedAscending  )
                if ([mutArr3[j] compare:mutArr3[j+1]] == NSOrderedDescending  )
                {
                    [mutArr3 exchangeObjectAtIndex:j withObjectAtIndex:j+1];
                }
            }
        }
       // NSLog(@"%@",mutArr3);
        
        
        mutArr3 = [[NSMutableArray alloc]initWithArray:@[@"44",@"22",@"55",@"11",@"33"]];
        
        [mutArr3 replaceObjectsInRange:NSMakeRange(0, 3) withObjectsFromArray:@[@"aa",@"bb",@"cc",@"dd",@"ee",@"ff",@"gg"] range:NSMakeRange(0, 6)];
        NSLog(@"%@",mutArr3);
        
        
        NSString *normalString = @"12#2,34#6,7#89#";
        
        NSMutableArray *newArray = [normalString componentsSeparatedByString:@"2#"];
        //        NSMutableArray *newArray = [normalString componentsSeparatedByString:@"2#"];
        
        NSLog(@"%@",newArray);
        
        NSCharacterSet *sep = [NSCharacterSet characterSetWithCharactersInString:@"#,"];
        newArray = [normalString componentsSeparatedByCharactersInSet:sep];
        NSLog(@"%@",newArray);
        
        [newArray removeObject:@""];
         NSLog(@"%@",newArray);
        
        NSArray *testArray = @[@"44",@"22",@"55",@"11",@"33"] ;
        NSString *joinString = [testArray componentsJoinedByString:@","];
        NSLog(@"%@",joinString);
        
        //将
        NSArray *arrayJoin = @[@"I",@"Love",@"You"];
        NSString *joinString2 = [arrayJoin componentsJoinedByString:@" "];
        NSLog(@"%@",joinString2);
        
        Car *car4 = [[Car alloc] initWithColor:ColorWithRed andName:@"宝马"];
        Car *car5 = [[Car alloc] initWithColor:ColorWithWhite andName:@"凯迪拉克"];
        Car *car6 = [[Car alloc]initWithColor:ColorWithGolden andName:@"法拉利"];
      
        NSMutableArray *carMutArray = [[NSMutableArray alloc]init];
        
        [ carMutArray addObject:car4];
        [ carMutArray addObject:car5];
        [ carMutArray addObject:car6];
        
        for (Car *car in carMutArray) {
            NSLog(@"name:%@,color:%i",car.name,car.color);
        }
#endif
    }
    
    return 0;
}
