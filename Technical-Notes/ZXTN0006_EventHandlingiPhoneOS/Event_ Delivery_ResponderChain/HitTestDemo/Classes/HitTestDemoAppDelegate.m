//
//  HitTestDemoAppDelegate.m
//  HitTestDemo
//
//  Created by Tyler Neylon on 6/15/10.
//  Copyleft Bynomial 2010.
//
//  This is a demo app to show how to override
//  the hitTest:withEvent: method in a custom subview
//  to allow touch events to work on views underneath
//  other views which are not a subview.
//
//  This demo was created to accompany this blog post:
//     http://bynomial.com/blog/?p=74
//

#import "HitTestDemoAppDelegate.h"

#import "MainViewController.h"

@implementation HitTestDemoAppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
  mainController = [[MainViewController alloc] init];
  [window addSubview:mainController.view];
  [window makeKeyAndVisible];
  return YES;
}

- (void)dealloc {
  [window release];
  [mainController release];
  [super dealloc];
}

// TODO change all copyrights to copyleft

@end
