//
//  ClientViewController.h
//  SocketDemo
//
//  Created by zx on 1/21/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncSocket.h"


@interface ClientViewController : UIViewController<AsyncSocketDelegate,UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>


@end
