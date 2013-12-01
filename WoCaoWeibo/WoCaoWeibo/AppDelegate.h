//
//  AppDelegate.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-8.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDMenuController.h"

@class SinaWeibo;
@class MainViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) SinaWeibo *sinaweibo;
@property(nonatomic, retain) MainViewController *mainCtrl;

@property(nonatomic,retain) DDMenuController *menuCtrl;

@end
