//
//  BaseTableView.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-11-16.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"

@class BaseTableView;

@protocol UITableViewEventDelegate <NSObject>

@optional
//下拉
-(void)pullDown:(BaseTableView *)tableView;
//上拉
-(void)pullUp:(BaseTableView *)tableView;
//选中一个cell
-(void)tableView:(BaseTableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface BaseTableView : UITableView<EGORefreshTableHeaderDelegate,UITabBarDelegate,UITableViewDataSource,UITableViewDelegate>
{
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
    
    UIButton *_moreButton;
}

@property(nonatomic,assign)BOOL refreshHeader;
@property(nonatomic,retain)NSArray *data;
@property(nonatomic,assign) id<UITableViewEventDelegate> eventDelegate;

@property(nonatomic,assign)BOOL isMore;//是否还有下一页
- (void)doneLoadingTableViewData;

-(void)refreshData;

@end
