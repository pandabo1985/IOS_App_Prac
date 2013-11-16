//
//  HomeViewController.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-8.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//
// 首页控制器
#import "BaseViewController.h"
#import "WeiboTableView.h"
@class ThemeImageView;

@interface HomeViewController : BaseViewController<SinaWeiboRequestDelegate,UITableViewEventDelegate>
{
    ThemeImageView *barView;
}


@property(retain,nonatomic)IBOutlet WeiboTableView *tableView;
@property(nonatomic,copy)NSString *topWeiBoID;
@property(nonatomic,retain)NSMutableArray *weibos;

@end
