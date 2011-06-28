//
//  TBTabBar.m
//  TweetBotTabBar
//
//  Created by Jerish Brown on 6/27/11.
//  Copyright 2011 i3Software. All rights reserved.
//

#import "TBTabBar.h"
#import "TBTabButton.h"
#import "TBTabNotification.h"

@interface TBTabBar() 

@property (retain) NSMutableArray *buttons;
@property (retain) NSMutableArray *buttonData;
@property (retain) NSMutableArray *statusLights;

-(void)setupButtons;
-(void)setupLights;

@end

@implementation TBTabBar
@synthesize buttons = _buttons, buttonData = _buttonData, statusLights = _statusLights, delegate;

-(id)initWithItems:(NSArray *)items {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 415, 320, 45);
        self.backgroundColor = [UIColor blackColor];
        
        if ([items count] > 5) {
            [NSException raise:@"Too Many Tabs" format:@"A maximum of 5 tabs are allowed in the TBTabBar. %d were asked to be rendered", [items count]];
        }
        self.buttonData = [[NSMutableArray alloc] initWithArray:items];
        
        [self setupButtons];
        [self setupLights];
    }
    return self;
}

-(void)setupButtons {
    NSInteger count = 0;
    NSInteger xExtra = 0;
    NSInteger buttonSize = floor(320 / [self.buttonData count]) - 1;
    self.buttons = [[NSMutableArray alloc] init];
    for (TBTabButton *info in self.buttonData) {
        NSInteger extra = 0;
        if ([self.buttonData count] % 2 == 1) {
            if ([self.buttonData count] == 5) {
                NSInteger i = (count + 1) + (floor([self.buttonData count] / 2));
                if (i == [self.buttonData count]) {
                    extra = 1;
                } else if (i == [self.buttonData count]+1) {
                    xExtra = 1;
                }
            } else if ([self.buttonData count] == 3) {
                buttonSize = floor(320 / [self.buttonData count]);
            }
        } else {
            if (count + 1 == 2) {
                extra = 1;
            } else if (count + 1 == 3) {
                xExtra = 1;
            }
        }
        NSInteger buttonX = (count * buttonSize) + count + xExtra;
        
        UIButton *b = [UIButton buttonWithType:UIButtonTypeCustom];
        b.frame = CGRectMake(buttonX, 2, buttonSize + extra, 38);
        UIImage *tabBarButtonBackground = [[UIImage imageNamed:@"tabBarButtonBackground"] stretchableImageWithLeftCapWidth:1 topCapHeight:0];
        [b setImage:[info icon] forState:UIControlStateNormal];
        [b setImage:[info highlightedIcon] forState:UIControlStateHighlighted];
        [b setImage:[info highlightedIcon] forState:UIControlStateSelected];
        [b setBackgroundImage:tabBarButtonBackground forState:UIControlStateNormal];
        
        [b addTarget:self action:@selector(touchDownForButton:) forControlEvents:UIControlEventTouchDown];
        [b addTarget:self action:@selector(touchUpForButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:b];
        [self.buttons addObject:b];
        count++;
    }
}

-(void)setupLights {
    NSInteger count = 0;
    NSInteger xExtra = 0;
    NSInteger buttonSize = floor(320 / [self.buttonData count]) - 1;
    for (TBTabButton *info in self.buttonData) {
        NSInteger extra = 0;
        if ([self.buttonData count] % 2 == 1) {
            if ([self.buttonData count] == 5) {
                NSInteger i = (count + 1) + (floor([self.buttonData count] / 2));
                if (i == [self.buttonData count]) {
                    extra = 1;
                } else if (i == [self.buttonData count]+1) {
                    xExtra = 1;
                }
            } else if ([self.buttonData count] == 3) {
                buttonSize = floor(320 / [self.buttonData count]);
            }
        } else {
            if (count + 1 == 2) {
                extra = 1;
            } else if (count + 1 == 3) {
                xExtra = 1;
            }
        }
        NSInteger buttonX = (count * buttonSize) + count + xExtra;
        
        [[info notificationView] updateImageView];
        [[info notificationView] setAllFrames:CGRectMake(buttonX, self.frame.size.height - 4, buttonSize + extra, 4)]; 
        [self addSubview:[info notificationView]];
        count++;
    }
}

-(void)showDefaults {
    [self touchDownForButton:[self.buttons objectAtIndex:0]];
    [self touchUpForButton:[self.buttons objectAtIndex:0]];
}

-(void)touchDownForButton:(UIButton*)button {
    [button setSelected:YES];
    NSInteger i = [self.buttons indexOfObject:button];
    UIViewController *vc = [[self.buttonData objectAtIndex:i] viewController];
    [delegate switchViewController:vc];
}

-(void)touchUpForButton:(UIButton*)button {
    for (UIButton *b in self.buttons) {
        [b setSelected:NO];
    }
    [button setSelected:YES];
}

- (void)dealloc
{
    [_buttons release];
    [_buttonData release];
    [_statusLights release];
    [super dealloc];
}

@end
