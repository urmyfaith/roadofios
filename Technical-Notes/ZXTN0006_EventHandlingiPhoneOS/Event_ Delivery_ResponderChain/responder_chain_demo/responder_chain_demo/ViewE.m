//
//  ViewE.m
//  responder_chain_demo
//
//  Created by zx on 1/30/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "ViewE.h"

@implementation ViewE
{
    UIButton *_printButton;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       self.backgroundColor  = [UIColor colorWithRed:0.70f green:0.70f blue:0.70f alpha:1.00f];
        
        _printButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _printButton.frame = CGRectMake(0, 0, 60, 40);
        _printButton.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        
        _printButton.clipsToBounds = YES;
        _printButton.layer.cornerRadius = 10;
        _printButton.backgroundColor = [UIColor purpleColor];
        [_printButton setTitle:@"print" forState:UIControlStateNormal];
        [_printButton addTarget:self action:@selector(printButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_printButton];
    }
    return self;
}


// ViewD重写方法包含了began和end方法,ViewD会拦截事件

// 问题1. 此时,如果想要继续想下传递事件:

/*
    需要在touchesBegan中使用super,调用touchesBegan.
    (注意:必须在touchesBegan中有super,其他的方法中可以有可无.)
 */

// 问题2.  只调用下一个响应这的某个方法
/*
     id next_Responder = [self nextResponder];
     [next_Responder touchesEnded:touches withEvent:event];
*/

/*
 2015-01-31 01:14:24.596 responder_chain_demo[7635:575075] viewE--->touchesEnded
 2015-01-31 01:14:24.597 responder_chain_demo[7635:575075] ViewC--->touchesEnded
 2015-01-31 01:14:24.598 responder_chain_demo[7635:575075] ViewA--->touchesEnded
 */

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{

    [super  touchesBegan:touches withEvent:event];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
  // [super touchesMoved:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //[super touchesEnded:touches withEvent:event];
    
    NSLog(@"viewE--->touchesEnded");
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesCancelled:touches withEvent:event];
}



-(void)printButtonClick{
    [self printrResponderChain:_printButton];
}

-(void)printrResponderChain:(UIResponder *)responder {
    NSLog(@">>>>>>>>>>>The Responder Chain----------");
    NSMutableString *spaces = [NSMutableString stringWithCapacity:4];
    while (responder) {
        NSLog(@"%@%@", spaces, responder.class);
        responder = responder.nextResponder;
        [spaces appendString:@"----"];
    }
    NSLog(@"<<<<<<<<<<<<<<<<<<END-------------------");
}



/*
 
 响应链：由离用户最近的view向系统传递。
 initial view –> super view –> …..–> view controller –> window –> Application –> AppDelegate
 
 Hit-Testing 链：由系统向离用户最近的view传递。
 UIKit –> active app's event queue –> window –> root view –>……–>lowest view

 */
@end
