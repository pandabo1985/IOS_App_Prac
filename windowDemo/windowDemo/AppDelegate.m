//
//  AppDelegate.m
//  windowDemo
//
//  Created by pan dabo on 13-12-24.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "AppDelegate.h"
/**
 *级别的高低顺序从小到大为Normal < StatusBar < Alert，下面
 */

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor yellowColor];
    [self.window makeKeyAndVisible];

    UIWindow *normalWindow = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    normalWindow.backgroundColor = [UIColor blueColor];
    normalWindow.windowLevel = UIWindowLevelNormal;
    [normalWindow makeKeyAndVisible];
    
    CGRect windowRect = CGRectMake(100, 100, [[UIScreen mainScreen] bounds].size.width -100, [[UIScreen mainScreen] bounds].size.width -100);
    UIWindow *alertLevelWindow = [[UIWindow alloc] initWithFrame:windowRect];
    alertLevelWindow.windowLevel = UIWindowLevelAlert;
    alertLevelWindow.backgroundColor = [UIColor redColor];
    [alertLevelWindow makeKeyAndVisible];
    
    UIWindow *statusLevelWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0, 50, [[UIScreen mainScreen] bounds].size.width, 20)];
    statusLevelWindow.windowLevel = UIWindowLevelStatusBar;
    statusLevelWindow.backgroundColor = [UIColor blackColor];
    [statusLevelWindow makeKeyAndVisible];
    
    
    NSLog(@"normal window level : %f",UIWindowLevelNormal);
    NSLog(@"alert window level : %f",UIWindowLevelAlert);
    NSLog(@"status window level : %f",UIWindowLevelStatusBar);
    return YES;
}



@end
