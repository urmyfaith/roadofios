//
//  ZXHttpRequest.h
//  1225_dataDownload_exercise
//
//  Created by zx on 12/25/14.
//  Copyright (c) 2014 zuoxue@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXHttpRequest : NSObject<NSURLConnectionDataDelegate>
@property(nonatomic,strong)NSMutableData *downloadData;
-(id)initWithPath:(NSString *)path
             target:(id)target
          andAction:(SEL)selector;
@end
