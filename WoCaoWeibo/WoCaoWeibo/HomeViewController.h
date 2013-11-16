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

@interface HomeViewController : BaseViewController<SinaWeiboRequestDelegate,UITableViewEventDelegate>


@property(retain,nonatomic)IBOutlet WeiboTableView *tableView;

@end
