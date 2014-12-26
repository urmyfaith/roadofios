//
//  ZXViewController.m
//  1226_resolveXML
//
//  Created by zx on 12/26/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import "ZXViewController.h"
#import "GDataXMLNode.h"

@interface ZXViewController ()

@end

@implementation ZXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //1. import file
    NSString *path = [[NSBundle mainBundle]pathForResource:@"xml" ofType:@"txt"];
    
    //2. read file
    NSData *data = [[NSData alloc]initWithContentsOfFile:path];
    
    //3. resolve content.
        //a)create classObj
    GDataXMLDocument *doc = [[GDataXMLDocument alloc]initWithData:data options:0 error:nil];
    
        //b)resolve releative data.
    NSString *xpath = @"//systemConfig";
    NSArray *array = [doc nodesForXPath:xpath error:nil];
    
#if 1
    NSLog(@"%s [LINE:%d] %@", __func__, __LINE__,array);
    NSLog(@"%s [LINE:%d] %@", __func__, __LINE__,[array[0] class]);
    
        // c)get the first node.
    GDataXMLElement *ele = [[array[0] elementsForName:@"CityName"] firstObject];
    NSLog(@"%s [LINE:%d] name=%@,value=%@", __func__, __LINE__,ele.name,ele.stringValue);
    
        // d)get the child node.
    NSLog(@"%s [LINE:%d] child:%@,childCount=%i", __func__, __LINE__,ele.children,ele.children.count);
    
        // e)get the root node.
    NSLog(@"%s [LINE:%d] root:%@", __func__, __LINE__,doc.rootElement);
#endif
    
}


@end
