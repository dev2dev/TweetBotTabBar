//
//  TBTabButton.m
//  TweetBotTabBar
//
//  Created by Jerish Brown on 6/27/11.
//  Copyright 2011 i3Software. All rights reserved.
//

#import "TBTabButton.h"


@interface TBTabButton()

@property (retain) NSMutableArray *notifications;
@property (retain) TBTabNotification *light;

@end

@implementation TBTabButton
@synthesize notifications = _notifications, viewController = _viewController, light = _light, icon, highlightedIcon;

-(id)initWithIcon:(UIImage*)nIcon {
    self = [super init];
    if (self) {
        self.icon = nIcon;
        self.light = [[TBTabNotification alloc] initWithFrame:CGRectMake(0, 0, 63, 4)];
        self.notifications = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)setViewController:(TBViewController *)viewController {
    _viewController = [viewController retain];
    self.viewController.tabBarButton = self;
}

-(TBTabNotification*)notificationView {
    return self.light;
}

-(void)addNotification:(NSDictionary *)notif {
    [self.notifications insertObject:notif atIndex:0];
    [self.light addNotifications:1];
}

-(void)removeNotificationAtIndex:(NSUInteger)index {
    if ([self.notifications count] > 0) {
        [self.notifications removeObjectAtIndex:index];
        [self.light removeNotifications:1];
    }
}

-(void)clearNotifications {
    [self.light removeNotifications:[self.notifications count]];
    [self.notifications removeAllObjects];
}

-(NSInteger)notificationCount {
    return [self.notifications count];
}

-(void)dealloc {
    [icon release];
    [highlightedIcon release];
    [_light release];
    [_viewController release];
    [_notifications release];
    [super dealloc];
}

@end
