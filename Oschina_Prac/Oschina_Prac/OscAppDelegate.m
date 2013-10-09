//
//  OscAppDelegate.m
//  Oschina_Prac
//
//  Created by pan dabo on 13-9-21.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "OscAppDelegate.h"

@implementation OscAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize tweetBase;
@synthesize postBase;
@synthesize profileBase;
@synthesize settingView;
@synthesize newsBase;

- (void)dealloc
{
    [window release];
    [tabBarController release];
    [tweetBase release];
    [postBase release];
    [profileBase release];
    [settingView release];
    [newsBase release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //初始化动态页
    self.tweetBase = [[TweetBase alloc] initWithNibName:@"TweetBase" bundle:nil];
    UINavigationController *tweetNav = [[UINavigationController alloc] initWithRootViewController:self.tweetBase];
   
    //初始化问答页
    self.postBase = [[PostBase alloc] initWithNibName:@"PostBase" bundle:nil];
    UINavigationController *postNav = [[UINavigationController alloc] initWithRootViewController:self.postBase];
    
    //初始化动态页
    self.profileBase = [[ProfileBase alloc]initWithNibName:@"ProfileBase" bundle:nil];
    UINavigationController *profileNav = [[UINavigationController alloc] initWithRootViewController:self.profileBase];
    
    //初始化设置页
    self.settingView = [[SettingView alloc] initWithNibName:@"SettingView" bundle:nil];
    UINavigationController *settingNav = [[UINavigationController alloc] initWithRootViewController:self.settingView];
    //初始化新闻页
    self.newsBase = [[NewsBase alloc]initWithNibName:@"NewsBase" bundle:nil];
    UINavigationController *newsNav = [[UINavigationController alloc] initWithRootViewController:self.newsBase];
    //初始化
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.delegate = self;
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:
                                             newsNav,
                                             postNav,
                                             tweetNav,
                                             profileNav,
                                             settingNav,
                                             nil];
    
    
    
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark UITab 双击事件
-(void) tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    int newTabIndex = self.tabBarController.selectedIndex;
    if (newTabIndex == m_lastTabIndex) {
        [[NSNotificationCenter defaultCenter] postNotificationName:Notification_TabClick object:[NSString stringWithFormat:@"%d",newTabIndex]];
    }else
    {
        m_lastTabIndex = newTabIndex;
    }
}

@end
