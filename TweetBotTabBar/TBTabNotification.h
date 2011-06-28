//
//  TBTabNotification.h
//  TweetBotTabBar
//
//  Created by Jerish Brown on 6/28/11.
//  Copyright 2011 i3Software. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TBTabNotification : UIView {
    UIImageView *imageView;
    
    NSInteger notificationCount;
}

-(NSInteger)notificationCount;
-(void)addNotifications:(NSInteger)n;
-(void)removeNotifications:(NSInteger)n;

-(void)setAllFrames:(CGRect)frame;
-(void)updateImageView;

@end
