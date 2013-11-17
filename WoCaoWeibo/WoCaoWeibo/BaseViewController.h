//
//  BaseViewController.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-8.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"
#import "ThemeManaer.h"

@class MBProgressHUD;

@interface BaseViewController : UIViewController
{
    UIView *_loadView;
}
@property(nonatomic, assign) BOOL isBackButton;
@property(nonatomic,retain) MBProgressHUD *hub;

- (SinaWeibo *)sinaweibo;

//提示
-(void)showLoanding:(BOOL)show;
-(void)showHUD:(NSString *)title isDim:(BOOL)isDim;
-(void)showHUDComplete:(NSString *)title;
-(void)showHUD;
-(void)hideHUD;

@end
