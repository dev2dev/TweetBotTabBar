//
//  TweetBotTabBarTestViewController.m
//  TweetBotTabBar
//
//  Created by Jerish Brown on 6/28/11.
//  Copyright 2011 i3Software. All rights reserved.
//

#import "TweetBotTabBarTestViewController.h"


@implementation TweetBotTabBarTestViewController
@synthesize notificationCount;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [notificationCount release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setNotificationCount:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)addNotificationButtonUp:(id)sender {
    [self.tabBarButton addNotification:[NSDictionary dictionary]];
    self.notificationCount.text = [NSString stringWithFormat:@"%d", [self.tabBarButton notificationCount]];
}

- (IBAction)removeNotificationButtonUp:(id)sender {
    [self.tabBarButton removeNotificationAtIndex:0];
    self.notificationCount.text = [NSString stringWithFormat:@"%d", [self.tabBarButton notificationCount]];
}
@end
