//
//  Station.m
//  week5_day5_dic01
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "Station.h"
#import "SubwayManager.h"


@implementation Station
-(void) addroute:(Route *)route{

    [[self routeArray] addObject:route];
}


//懒加载
-(NSMutableArray *)routeArray{
    if( _routeArray == nil){
        _routeArray = [[NSMutableArray alloc]init];
    }
    return _routeArray;
}

-(void)print{

    if ([self isChange]) {
        NSMutableString *mutSting = [[NSMutableString alloc]initWithString:[self name]];
        for (NSInteger i = 0; i < [[self routeArray] count]; i++) {
           [ mutSting appendFormat:@" %@ ",[[self routeArray][i] name]];
        }
        NSLog(@"%@",mutSting);
    }
    else{
         NSLog(@"%@",[self name]);
    }
   
    
    // BOOL temp = [([self stationArraay][i]) isChange];
}
@end
