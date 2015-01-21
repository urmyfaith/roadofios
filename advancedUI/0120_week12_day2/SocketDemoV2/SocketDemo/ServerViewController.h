//
//  ServerViewController.h
//  SocketDemo
//
//  Created by zx on 1/20/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"

@interface ServerViewController : UIViewController<AsyncSocketDelegate,UITableViewDataSource,UITableViewDelegate>

@end
