//
//  ZXAppDelegate.h
//  UDPDemo
//
//  Created by zx on 1/21/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsyncUdpSocket.h"

@interface ZXAppDelegate : UIResponder <UIApplicationDelegate,AsyncUdpSocketDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
