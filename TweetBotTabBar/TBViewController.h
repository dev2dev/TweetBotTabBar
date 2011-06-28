//
//  TBViewController.h
//  TweetBotTabBar
//
//  Created by Jerish Brown on 6/28/11.
//  Copyright 2011 i3Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TBTabButton;

@interface TBViewController : UIViewController {
    TBTabButton *tabBarButton;
}

@property (retain) TBTabButton *tabBarButton;

@end
