//
//  Serie.h
//  xCarDemo
//
//  Created by zx on 1/31/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  每个车型
 */

@interface Serie : NSObject

@property (nonatomic,strong) NSString    *serieName;
@property (nonatomic,strong) NSString    *serieIcon;
@property (nonatomic,strong) NSString    *seriePrice;
@property (nonatomic,strong) NSString    *serieId;

/**
 {
 "letterNum": 24,
 "letters": [
 {
 "brandNum": 3,
 "brands": [
 {
 "icon": "",
 "id": "0",
 "keyword": "热门车",
 "name": "热门车",
 "subBrandNum": 2,
 "subBrands": [
 {
 "subBrandId": "0",
 "subBrandName": "热门轿车",
 "seriesNum": 10,
 "series": [
 {
 "id": "601",
 "name": "帕萨特",
 "icon": "http://img1.xcarimg.com/PicLib/spng/s5870_180.png",
 "price": "18.38 - 32.28 万"
 },
 {
 "id": "2348",
 "name": "新蒙迪欧",
 "icon": "http://img1.xcarimg.com/PicLib/spng/s4455_180.png",
 "price": "17.98 - 26.58 万"
 },
 
 */
@end
