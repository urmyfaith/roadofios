//
//  HitTestDemoAppDelegate.h
//  HitTestDemo
//
//  Created by Tyler Neylon on 6/15/10.
//  Copyleft Bynomial 2010.
//

#import <UIKit/UIKit.h>

@class MainViewController;

@interface HitTestDemoAppDelegate : NSObject <UIApplicationDelegate> {
 @private
  // strong
  UIWindow *window;
  MainViewController *mainController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

