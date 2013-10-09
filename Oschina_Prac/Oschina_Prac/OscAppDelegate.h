//
//  OscAppDelegate.h
//  Oschina_Prac
//
//  Created by pan dabo on 13-9-21.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TweetBase.h"
#import "PostBase.h"
#import "ProfileBase.h"
#import "SettingView.h"
#import "NewsBase.h"

@interface OscAppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>

{
      int m_lastTabIndex;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) TweetBase *tweetBase;
@property (strong, nonatomic) PostBase *postBase;
@property (strong, nonatomic) ProfileBase *profileBase;
@property (strong, nonatomic) SettingView *settingView;
@property (strong, nonatomic) NewsBase *newsBase;

@end
