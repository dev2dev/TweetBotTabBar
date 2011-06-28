//
//  TweetBotTabBarTestViewController.h
//  TweetBotTabBar
//
//  Created by Jerish Brown on 6/28/11.
//  Copyright 2011 i3Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBTabButton.h"
#import "TBViewController.h"

@interface TweetBotTabBarTestViewController : TBViewController {
    
    UILabel *notificationCount;
}
- (IBAction)addNotificationButtonUp:(id)sender;
- (IBAction)removeNotificationButtonUp:(id)sender;
@property (nonatomic, retain) IBOutlet UILabel *notificationCount;

@end
