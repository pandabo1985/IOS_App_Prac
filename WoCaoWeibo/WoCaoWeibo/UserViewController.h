//
//  UserViewController.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-12-15.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "BaseViewController.h"
#import "WeiboTableView.h"
@class UserInfoView;

@interface UserViewController : BaseViewController<UITableViewEventDelegate>

@property(nonatomic,copy)NSString *userName;
@property(nonatomic,retain)UserInfoView *userInfo;

@property (retain, nonatomic) IBOutlet WeiboTableView *tableView;

@end
