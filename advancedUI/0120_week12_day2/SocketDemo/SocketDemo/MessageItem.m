//
//  MessageItem.m
//  SocketDemo
//
//  Created by zx on 1/20/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "MessageItem.h"
#import "GDataXMLNode.h"



@implementation MessageItem


/**
 *   NSData转换为xml
 *
 *  @param data 待转换的NSData
 */
-(NSData *)data
{
    
    //1.得到xml文档
    GDataXMLDocument *document = [[GDataXMLDocument alloc]initWithXMLString:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><root></root>"
                                                                    options:0
                                                                      error:nil];
    
    //2.组织根节点
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];

    
    [dic setObject:@"zx" forKey:@"name"];
    [dic setObject:@"30" forKey:@"age"];
    
    NSMutableDictionary *subDic = [[NSMutableDictionary alloc] init];
    [subDic setObject:@"infoValue" forKey:@"infoKey"];
    [dic setObject:subDic forKey:@"subDic"];
    
    [self dicToXMLWithDic:dic andXMLElement:[document rootElement]];
    
    for (GDataXMLElement *element in document.rootElement.children) {
        NSLog(@"elementName = %@",element.name);
        NSLog(@"elementValue = %@",element.stringValue);
    }
    
    
    NSLog(@"%s [LINE:%d] document =%@", __func__, __LINE__,document);
    
    return nil;
}


-(void)dicToXMLWithDic:(NSDictionary *)dic andXMLElement:(GDataXMLElement *)element{
    
    //遍历找出字典中的每一个值
    for (NSString *key  in dic) {
        //按照key找出字典的中的每一个值:(字符串/字典)
        id object = [dic objectForKey:key];
        
        if([object isKindOfClass:[NSString class]]){
            //将key作为几点的名字,value作为节点的值,创建一个节点,并加入到element中
            GDataXMLElement *subElement = [GDataXMLElement elementWithName:key stringValue:object];
            
            [element addChild:subElement];
        }
        if ([object isKindOfClass:[NSDictionary class]] ) {
            //
            GDataXMLElement *subElement = [GDataXMLElement elementWithName:key];
            [element addChild:subElement];
            [self dicToXMLWithDic:object andXMLElement:subElement];
        }
    }
    
}

@end
