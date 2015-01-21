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
-(NSData *)parseToData
{
    
    //1.得到xml文档
    GDataXMLDocument *document = [[GDataXMLDocument alloc]initWithXMLString:@"<?xml version=\"1.0\" encoding=\"utf-8\"?><root></root>"
                                                                    options:0
                                                                      error:nil];
    
    

    
    //2.组织根节点
    [self dicToXMLWithDic:_messageDict andXMLElement:[document rootElement]];

//    [self parseFromData:[document XMLData]];
    
    return [document XMLData];
}

/**
 *  将字典转换为xml形式
 *
 *  @param dic     待转换的字典
 *  @param element 转换完成的xml文档
 */
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

-(void)parseFromData:(NSData *)data{
    
    GDataXMLDocument *document = [[GDataXMLDocument alloc]initWithData:data options:0 error:nil];
    
    //根节点
    GDataXMLElement *rootElement = [document rootElement];
    
    NSMutableDictionary *rootDict = [[NSMutableDictionary alloc]init];
    
    for (GDataXMLElement *element  in rootElement.children) {
        [self xmlToDicWithXmlElement:element andDict:rootDict];
    }
   // NSLog(@"rootDict = %@",rootDict);
    
    //用KVC将解析出来的字典赋值给当前类的属性
    [self setValuesForKeysWithDictionary:rootDict];
    
}

/**
 *  KVC的时候,防止给不存在的属性赋值
 *
 *  @param value 值
 *  @param key   键
 */
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"%s [LINE:%d] key=%@", __func__, __LINE__,key);
}

/**
 *  将xml转换为字典
 *
 *  @param element xml
 *  @param dic     dic
 */
-(void)xmlToDicWithXmlElement:(GDataXMLElement *)element andDict:(NSMutableDictionary *)dic{
    
    //节点的值也是一个节点===>所以>1.
    if (element.children.count > 1 ) {
        //有子节点
        NSMutableDictionary *subDic = [[NSMutableDictionary alloc]init];
        
        for (GDataXMLElement *subElement  in element.children) {
            [self xmlToDicWithXmlElement:subElement andDict:subDic];
        }
        [dic setObject:subDic forKey:[element name]];
        
    }
    else{
        //没有子节点
        [dic setObject:[element stringValue] forKey:[element name]];
    }
    
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
     
     {
     @"root":{
                @"name":@"zx",
                @"age":@"age",
                @"tel":{
                        @"phone" :@"12345",
                        @"home":@"6789"
                      }
             }
     }
     
     2015-01-20 16:22:55.604 SocketDemo[25153:607] rootDict = {
     age = 30;
     name = zx;
     tel =     {
     home = 6789;
     phone = 12345;
     };
     }

     */
}
@end
