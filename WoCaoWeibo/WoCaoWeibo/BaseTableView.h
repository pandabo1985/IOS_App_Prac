//
//  BaseTableView.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-11-16.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

@interface BaseTableView : UITableView<EGORefreshTableHeaderDelegate,UITabBarDelegate,UITableViewDataSource>
{
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
}

@property(nonatomic,assign)BOOL refreshHeader;
@property(nonatomic,retain)NSArray *data;

@end
