//
//  CustomView.m
//  hit_testing
//
//  Created by zx on 1/30/15.
//  Copyright (c) 2015 zx. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

{
    
    UIButton *_buttonA;
    UIButton *_buttonB;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _buttonA = [UIButton buttonWithType:UIButtonTypeSystem];
        _buttonA.frame= CGRectMake(0, 0, 100, 40);
        [_buttonA addTarget:self
                     action:@selector(buttonClicked:)
           forControlEvents:UIControlEventTouchUpInside];
        [_buttonA setTitle:@"ButtonA" forState:UIControlStateNormal];
        [self addSubview:_buttonA];
        
        _buttonB = [UIButton buttonWithType:UIButtonTypeSystem];
        _buttonB.frame= CGRectMake(0, 0, 100, 40);
        [_buttonB addTarget:self
                     action:@selector(buttonClicked:)
           forControlEvents:UIControlEventTouchUpInside];
        [_buttonB setTitle:@"ButtonB" forState:UIControlStateNormal];
        [self addSubview:_buttonB];
        
        _buttonA.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 - 50);
        _buttonB.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2 + 50);

        
        self.backgroundColor = [UIColor colorWithRed:0.90f green:0.91f blue:0.91f alpha:1.00f];
    }
    return self;
}

-(void)buttonClicked:(UIButton *)button{
    NSLog(@"=====Button Titled %@ ActionFired ", [button titleForState:UIControlStateNormal]);
    [self responderChain:button];
}


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = [super hitTest:point withEvent:event];
//    if (hitView == _buttonA) {
//        return _buttonB;
//    }
//    if(hitView == _buttonB)
//        return  _buttonA;
    return hitView;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s [LINE:%d]", __func__, __LINE__);
}

-(void)responderChain:(UIResponder *)responder {
    NSLog(@"------------------The Responder Chain------------------");
    NSMutableString *spaces = [NSMutableString stringWithCapacity:4];
    while (responder) {
        NSLog(@"%@%@", spaces, responder.class);
        responder = responder.nextResponder;
        [spaces appendString:@"----"];
    }
}


@end
