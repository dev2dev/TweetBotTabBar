//
//  TBTabNotification.m
//  TweetBotTabBar
//
//  Created by Jerish Brown on 6/28/11.
//  Copyright 2011 i3Software. All rights reserved.
//

#import "TBTabNotification.h"


@implementation TBTabNotification

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        notificationCount = 0;
        imageView = [[UIImageView alloc] init];
        imageView.frame = self.frame;
        [self addSubview:imageView];
    }
    return self;
}

-(void)setAllFrames:(CGRect)frame {
    self.frame = frame;
    imageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
}

-(NSInteger)notificationCount {
    return notificationCount;
}

-(void)addNotifications:(NSInteger)n {
    if (n > 0) {
        notificationCount += n;
    }
    [self updateImageView];
}

-(void)removeNotifications:(NSInteger)n {
    if (n > 0) {
        notificationCount -= n;
    }
    if (notificationCount < 0) notificationCount = 0;
    [self updateImageView];
}

-(void)updateImageView {
    NSString *notificationLightIconFile;
    if ([self notificationCount] <= 0) {
        notificationLightIconFile = @"tabBarNotificationLightOff";
    } else {
        notificationLightIconFile = @"tabBarNotificationLightOn";
    }
    UIImage *notificationLight = [[UIImage imageNamed:notificationLightIconFile] stretchableImageWithLeftCapWidth:1 topCapHeight:0];
    imageView.image = notificationLight;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [super dealloc];
}

@end
