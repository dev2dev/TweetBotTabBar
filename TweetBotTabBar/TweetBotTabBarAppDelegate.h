//
//  TweetBotTabBarAppDelegate.h
//  TweetBotTabBar
//
//  Created by Jerish Brown on 6/27/11.
//  Copyright 2011 i3Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TweetBotTabBarViewController;

@interface TweetBotTabBarAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet TweetBotTabBarViewController *viewController;

@end
