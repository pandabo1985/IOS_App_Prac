//
//  AppDelegate.m
//  UIViewDemo
//
//  Created by pan dabo on 13-12-24.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    self.view1 = [[UIView alloc] initWithFrame:CGRectMake(60, 120, 200, 100)];
    self.view1.backgroundColor = [UIColor redColor];
    [self.window addSubview:self.view1];
    [self.view1 release];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view2.backgroundColor = [UIColor purpleColor];
    [self.view1 addSubview:view2];
    [view2 release];

    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(60,200, 200, 100)];
    view3.backgroundColor = [UIColor blueColor];
    [self.window addSubview:view3];
    [view3 release];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.backgroundColor = [UIColor purpleColor];
    button.frame = CGRectMake(100,400,120, 40);
    [button setTitle:@"change" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(changeView) forControlEvents:UIControlEventTouchUpInside];
    [self.window addSubview:button];

    return YES;
}


-(void)changeView{
    [self.window bringSubviewToFront:self.view1];
}


@end
