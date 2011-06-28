//
//  TweetBotTabBarViewController.m
//  TweetBotTabBar
//
//  Created by Jerish Brown on 6/27/11.
//  Copyright 2011 i3Software. All rights reserved.
//

#import "TweetBotTabBarViewController.h"
#import "TBTabButton.h"
#import "TBViewController.h"
#import "TweetBotTabBarTestViewController.h"

@implementation TweetBotTabBarViewController

- (void)dealloc
{
    [tabBar release];
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
    
    TweetBotTabBarTestViewController *vc1 = [[[TweetBotTabBarTestViewController alloc] init] autorelease];
    TweetBotTabBarTestViewController *vc2 = [[[TweetBotTabBarTestViewController alloc] init] autorelease];
    TBViewController *vc3 = [[[TBViewController alloc] init] autorelease];
    vc3.view.backgroundColor = [UIColor darkGrayColor];
    
    TBTabButton *t1 = [[[TBTabButton alloc] initWithIcon:[UIImage imageNamed:@"timelineIcon"]] autorelease];
    t1.highlightedIcon = [UIImage imageNamed:@"timelineIconHighlighted"];
    t1.viewController = vc1;
    TBTabButton *t2 = [[[TBTabButton alloc] initWithIcon:[UIImage imageNamed:@"mentionsIcon"]] autorelease];
    t2.highlightedIcon = [UIImage imageNamed:@"mentionsIconHighlighted"];
    t2.viewController = vc2;
    TBTabButton *t3 = [[[TBTabButton alloc] initWithIcon:[UIImage imageNamed:@"messagesIcon"]] autorelease];
    t3.highlightedIcon = [UIImage imageNamed:@"messagesIconHighlighted"];
    t3.viewController = vc3;
    TBTabButton *t4 = [[[TBTabButton alloc] initWithIcon:[UIImage imageNamed:@"favoritesIcon"]] autorelease];
    t4.highlightedIcon = [UIImage imageNamed:@"favoritesIconHighlighted"];
    t4.viewController = vc3;
    TBTabButton *t5 = [[[TBTabButton alloc] initWithIcon:[UIImage imageNamed:@"searchIcon"]] autorelease];
    t5.highlightedIcon = [UIImage imageNamed:@"searchIconHighlighted"];
    t5.viewController = vc3;
    NSArray *a = [NSArray arrayWithObjects:t1, t2, t3, t4, t5, nil];
    tabBar = [[TBTabBar alloc] initWithItems:a];
    tabBar.delegate = self;
    [self.view addSubview:tabBar];
    [tabBar showDefaults];
}

-(void)switchViewController:(UIViewController *)viewController {
    UIView *currentView = [self.view viewWithTag:SELECTED_VIEW_CONTROLLER_TAG];
    [currentView removeFromSuperview];
    
    viewController.view.frame = CGRectMake(0,0,self.view.bounds.size.width, self.view.bounds.size.height-(tabBar.frame.size.height));
    
    viewController.view.tag = SELECTED_VIEW_CONTROLLER_TAG;
    
    [self.view insertSubview:viewController.view belowSubview:tabBar];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
