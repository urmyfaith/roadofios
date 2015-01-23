//
//  Page.h
//  MyMagazine
//
//  Created by zx on 1/21/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  确定每一页上资源的属性
 */
@interface Page : NSObject

//当前页面的所有的节点列表
@property(nonatomic,strong)NSMutableArray *pageElementList;


//传进来一个界面的xml文件路径,解析xml文件返回page对象.
+(Page *)loadPageWithXMLPath:(NSString *)xmlPath;

@end
