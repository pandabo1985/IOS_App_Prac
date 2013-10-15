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

@interface BaseViewController : UIViewController
@property(nonatomic, assign) BOOL isBackButton;

- (SinaWeibo *)sinaweibo;

@end
