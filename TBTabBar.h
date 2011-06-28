//
//  TBTabBar.h
//  TweetBotTabBar
//
//  Created by Jerish Brown on 6/27/11.
//  Copyright 2011 i3Software. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TBTabBarDelegate;
@interface TBTabBar : UIView {
    NSMutableArray *_buttonData;
    NSMutableArray *_buttons;
    NSMutableArray *_statusLights;
    id<TBTabBarDelegate> delegate;
}

@property (assign) id<TBTabBarDelegate> delegate;

-(id)initWithItems:(NSArray *)items;

-(void)showDefaults;

-(void)touchDownForButton:(UIButton*)button;
-(void)touchUpForButton:(UIButton*)button;

@end

@protocol TBTabBarDelegate
-(void)switchViewController:(UIViewController*)vc;
@end