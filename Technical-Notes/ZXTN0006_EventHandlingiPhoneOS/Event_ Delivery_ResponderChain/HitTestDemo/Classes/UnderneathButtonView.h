//
//  UnderneathButtonView.h
//  HitTestDemo
//
//  Created by Tyler Neylon on 6/15/10.
//  Copyleft Bynomial 2010.
//
//  This is a view specifically designed to allow
//  a normally-untouchable button (the underneathButton)
//  to be tapped.
//

#import <Foundation/Foundation.h>


@interface UnderneathButtonView : UIView {
 @private
  // weak
  UIButton *underneathButton;
}

@property (nonatomic, assign) UIButton *underneathButton;

@end
