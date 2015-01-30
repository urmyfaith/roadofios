//
//  MainViewController.m
//  HitTestDemo
//
//  Created by Tyler Neylon on 6/15/10.
//  Copyleft 2010 Bynomial.
//

#import "MainViewController.h"

#import "UIView+position.h"
#import "UnderneathButtonView.h"

@interface MainViewController ()

- (void)buttonTap;

@end

@implementation MainViewController

- (void)loadView {
  CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
  self.view = [[[UIView alloc] initWithFrame:appFrame] autorelease];
  
  CGRect topHalfFrame = CGRectMake(0, 0, self.view. frameWidth, (int)(self.view.frameHeight / 2));
  UnderneathButtonView *topView = [[[UnderneathButtonView alloc] initWithFrame:topHalfFrame] autorelease];
  topView.backgroundColor = [UIColor yellowColor];
  [self.view addSubview:topView];
  
  UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"tap here" forState:UIControlStateNormal];
  [button addTarget:self action:@selector(buttonTap) forControlEvents:UIControlEventTouchUpInside];
  button.frame = CGRectMake(300, 200, 150, 75);
  [topView addSubview:button];
  
  // Comment out this line to see the standard behavior; the button won't
  // react to taps.
  topView.underneathButton = button;
  
  UIScrollView *scrollView = [[[UIScrollView alloc] initWithFrame:topHalfFrame] autorelease];
  [topView addSubview:scrollView];
  UIImageView *imageView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"scroll_image.png"]] autorelease];
  [scrollView addSubview:imageView];
  scrollView.contentSize = imageView.frameSize;
  
  CGRect bottomHalfFrame = CGRectMake(0, topView.frameBottom,
                                      self.view.frameWidth, self.view.frameHeight - topView.frameHeight);
  textView = [[[UITextView alloc] initWithFrame:bottomHalfFrame] autorelease];
  [self.view addSubview:textView];
}

- (void)dealloc {
  [super dealloc];
}

#pragma mark internal methods

- (void)buttonTap {
  NSLog(@"button tapped!");
  textView.text = [NSString stringWithFormat:@"%@\nbutton tapped!", textView.text];
}

@end
