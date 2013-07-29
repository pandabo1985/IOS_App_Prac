//
//  SampleDelegate.m
//  HelloWorld_LifeCycle
//
//  Created by pan dabo on 13-7-29.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//
//
/**
 启动程序
lifeCycle[40428:11303] willFinishLaunchingWithOptions
lifeCycle[40428:11303] didFinishLaunchingWithOptions
lifeCycle[40428:11303] applicationDidBecomeActive
按下home键
lifeCycle[40428:11303] applicationWillResignActive
lifeCycle[40428:11303] applicationDidEnterBackground
双击home键，再打开程序
lifeCycle[40428:11303] applicationWillEnterForeground
lifeCycle[40428:11303] applicationDidBecomeActive
*/

#import "SampleDelegate.h"
#import "SimpleViewController.h"

@implementation SampleDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    // 说明：当程序载入后执行
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    SimpleViewController *viewCon = [[SimpleViewController alloc]init];
    [window addSubview:viewCon.view];
    [window makeKeyAndVisible];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    //说明：当应用程序将要入非活动状态执行，在此期间，应用程序不接收消息或事件，比如来电话了
}


- (void)applicationDidBecomeActive:(UIApplication *)application
{
    //说明：当应用程序入活动状态执行，这个刚好跟上面那个方法相反
}

-(void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

-(void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    
}

-(void)applicationWillTerminate:(UIApplication *)application
{
    
}

@end
