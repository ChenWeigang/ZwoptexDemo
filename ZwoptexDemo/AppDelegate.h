//
//  AppDelegate.h
//  ZwoptexDemo
//
//  Created by Chen Weigang on 9/8/12.
//  Copyright Star Target 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
