//
//  Page.m
//  MyMagazine
//
//  Created by zx on 1/21/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "Page.h"
#import "PageElement.h"
#import "PageAttribute.h"
#import "GDataXMLNode.h"


@implementation Page

-(id)init{
    self = [super init];
    if (self) {
        //init code here
        _pageElementList = [[NSMutableArray alloc]init];
    }
    return self;
}

/**

 //a)节点名,b)节点所有的属性(存储PageAttribute对象).
 *
 *  @param xmlPath xml文件路径
 *
 *  @return Page对象...带有模型的对象
 */
+(Page *)loadPageWithXMLPath:(NSString *)xmlPath{
    Page *page = [[Page alloc]init];
    
    //解析xml

    
    NSData *data = [[NSData alloc]initWithContentsOfFile:xmlPath];
    GDataXMLDocument *document = [[GDataXMLDocument alloc]initWithData:data options:0 error:nil];
    GDataXMLElement *rootElement = [document rootElement];
    
    for (GDataXMLElement *element  in rootElement.children) {
        
        PageElement *pe = [[PageElement alloc]init];
        pe.pageElementName = element.name;
        
        NSArray *array  =  element.attributes;
        for (GDataXMLElement *subElement in array) {
            
            PageAttribute *pa = [[PageAttribute alloc]init];
            pa.pageAttributeName = subElement.name;
            pa.pageAttributeValue = subElement.stringValue;
            [pe.pageElementAttribute addObject:pa];
        }
        [page.pageElementList addObject:pe];
    }
    
    return page;
}

@end
