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
 *   NSData转换为xml,拼接字典
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
    [subDic setObject:@"12345" forKey:@"phone"];
    [subDic setObject:@"6789" forKey:@"home"];
    [dic setObject:subDic forKey:@"tel"];
    
    [self dicToXMLWithDic:dic andXMLElement:[document rootElement]];
    
#if 0
    for (GDataXMLElement *element in document.rootElement.children) {
        NSLog(@"elementName = %@",element.name);
        NSLog(@"elementValue = %@",element.stringValue);
    }
#else
    
    NSData *data = [document XMLData];
    
    NSString *string = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    NSLog(@"str = %@",string);
    /*
     <?xml version="1.0" encoding="utf-8"?>
     <root>
     <age>30</age>
     <name>zx</name>
     <tel>
     <phone>12345</phone>
     <home>6789</home>
     </tel>
     </root>
     */
#endif
    return [document XMLData];
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
           
            [self dicToXMLWithDic:object andXMLElement:subElement];
            
             [element addChild:subElement];
        }
    }
    
}

@end
