//
//  MainViewController.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-8.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SinaWeibo.h"



@interface MainViewController : UITabBarController<SinaWeiboDelegate>
{
    UIView *_tabbarView;
    UIImageView *_sliderView;
    UIImageView *_bageView;
}

-(void)showBage:(BOOL)show;

@end
