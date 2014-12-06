//
//  Book.h
//  1125_week4_day2
//
//  Created by zx on 11/25/14.
//  Copyright (c) 2014 zx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Book : NSObject
{
    char *bookName;
}

@property (nonatomic,assign) char *bookName;
@property (nonatomic,assign) char *bookPublisherName;
@property (nonatomic,strong) Person *person;

@end
