//
//  TweetBotTabBarViewController.h
//  TweetBotTabBar
//
//  Created by Jerish Brown on 6/27/11.
//  Copyright 2011 i3Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBTabBar.h"

@interface TweetBotTabBarViewController : UIViewController<TBTabBarDelegate> {
    TBTabBar *tabBar;
}

@end
