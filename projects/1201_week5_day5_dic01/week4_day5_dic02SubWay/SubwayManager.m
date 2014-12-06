//
//  SubwayManager.m
//  week5_day5_dic01
//
//  Created by zx on 11/28/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import "SubwayManager.h"
#import "Route.h"
#import "Station.h"
@interface  SubwayManager()
{
    int _index;
}
@end


@implementation SubwayManager


-(id)init{
    if (self = [super init]){
        _index = -1;
        [self  loadAllLine];
        [self  exchangeStationAddRoute];
    }
    return  self;
}

-(void) loadAllLine{
    NSString *string = [NSString stringWithContentsOfFile:@"/Users/zx/Documents/projects/week5_day5_dic01/week4_day5_dic02SubWay/Subway.txt"
                                                 encoding:NSUTF8StringEncoding
                                                    error:nil];
    
    NSArray *oneLineFileArray = [string componentsSeparatedByString:@"\n"];
    
    //NSLog(@"%@",oneLineFileArray);
    
    for (NSString *oneLineContent in oneLineFileArray) {
        //NSLog(@"%@",oneLineContent);
        NSArray *wordsInOneLineArray = [oneLineContent componentsSeparatedByString:@" "];
        //NSLog(@"%@",wordsInOneLineArray);
        
        if( [wordsInOneLineArray count] > 1){
            [self loadRoute:wordsInOneLineArray];
        }
        else{
            [self loadStaion:wordsInOneLineArray];
        }
    }
    
}

/**
 *  读取文件的站点,写入数组
 *
 *  @param array 文件中读取到的一行的信息
 
 1. 判断当前一行是否为*
 a)是*,_index++ ==> _index=0
 b)不是*,第0条线路,存放第0条线路的站点
 
 2. 遇到第一行*
 是*,_index++ ==> _index=1,准备加载第一条线路的站点
 
 3. 直到文件读完.
 
 
 */
-(void)loadStaion:(NSArray*)array{
    NSString *oneStaionString = array[0];
    
    if(![oneStaionString isEqualTo:@"*"]){
        Station *station = [[Station alloc]init];
		if (![oneStaionString isEqualTo:@""]){
            [station setName:oneStaionString];
            [station setIsChange:NO];

            if( _index >=0  & _index < [[self routes] count]){
                Route *route = [self routes][_index];
                [route addStation:station];
            }
		}
    }else{
        _index++;
    }
}

-(void)exchangeStationAddRoute{
    NSInteger i,j,m,n;
    NSInteger routeCounts = [[self routes]count];
    
    for (i = 0; i < routeCounts; i++) {
        
        Route *eachRoute = [self routes][i];
        NSInteger stationCounts = [[eachRoute stationArraay]count];

		for (j = 0; j < stationCounts ; j++) {
			Station *eachStation  = [eachRoute stationArraay][j];


			//-------
			NSInteger routeCounts2 = [[self routes] count];
			for (m= 0; m <routeCounts2 ; m++) {

				Route *eachRoute2 = [self routes][m];
				if (i != m ) {
					NSInteger statationCounts2 = [[eachRoute2 stationArraay]count];
					for (n=0; n < statationCounts2  ; n++) {
						Station *eachStation2 = [eachRoute2 stationArraay][n];

						if ([[eachStation name]
								compare:[eachStation2 name]
								] == 0) {
							if (![[eachStation routeArray] containsObject:eachRoute2]) {
                                [eachStation addroute:eachRoute2];//添加到数组中
                                [eachStation setIsChange:YES];
							}
						}
					}
				}
			}
            if (![[eachStation routeArray] containsObject:eachRoute]) {
                [eachStation addroute:eachRoute];
            }
			//--------
		}
	}

}

-(NSMutableArray *)routes{
    if (_routes == nil) {
        _routes = [[NSMutableArray alloc]init];
    }
    return _routes;
}


/**
 *  从数组里取出数据,给对象成员变量赋值.
 *
 *  @param array 从文件读入的一行数据(线路的信息);
 */
-(void) loadRoute:(NSArray *)array{
    Route *route = [[Route alloc]init];
    if ([array count] == 7 ) {
        route.name = array[0];
        route.color = array[1];
        route.length = [array[2] floatValue];
        route.stationCounts = [array[3] intValue];
        route.type = array[4];
        route.time = array[5];
        route.unit = array[6];
        [ self.routes addObject:route];//数组对象,添加元素,添加的元素是一个类的实例对象.
    }
    
}

+(void)testManager{
    SubwayManager *subway = [[SubwayManager alloc]init];
    [subway print];
}

-(void)print{
    for (Route *eachRoute in self.routes) {
        [eachRoute print];
    }
}

@end
