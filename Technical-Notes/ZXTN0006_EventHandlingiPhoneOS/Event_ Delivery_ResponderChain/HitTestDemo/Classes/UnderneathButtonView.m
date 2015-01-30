//
//  UnderneathButtonView.m
//  HitTestDemo
//
//  Created by Tyler Neylon on 6/15/10.
//  Copyleft 2010 Bynomial.
//

#import "UnderneathButtonView.h"


@implementation UnderneathButtonView

@synthesize underneathButton;

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
  CGPoint hitPoint = [underneathButton convertPoint:point fromView:self];
  if ([underneathButton pointInside:hitPoint withEvent:event]) return underneathButton;
  return [super hitTest:point withEvent:event];
}

@end
