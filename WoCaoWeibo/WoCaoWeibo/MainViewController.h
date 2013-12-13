//
//  MainViewController.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-8.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"
@class HomeViewController;


@interface MainViewController : UITabBarController<SinaWeiboDelegate,UINavigationControllerDelegate>
{
    UIView *_tabbarView;
    UIImageView *_sliderView;
    UIImageView *_bageView;
    HomeViewController *_home;
}

-(void)showBage:(BOOL)show;

-(void)showTabbar:(BOOL)show;

@end
