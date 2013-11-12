//
//  HomeViewController.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-8.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//
// 首页控制器
#import "BaseViewController.h"

@interface HomeViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate,SinaWeiboRequestDelegate>

@property(nonatomic,retain)NSArray *data;
@property(retain,nonatomic)IBOutlet UITableView *tableView;

@end
