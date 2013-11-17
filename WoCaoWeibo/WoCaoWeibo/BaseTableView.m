//
//  BaseTableView.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-11-16.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

- (id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self _initView];
    }
    return self;
}

-(void)_initView{
    _refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.bounds.size.height, self.bounds.size.width, self.bounds.size.height)];
    _refreshHeaderView.delegate = self;
    _refreshHeaderView.backgroundColor = [UIColor clearColor];
    
    self.dataSource = self;
    self.delegate = self;
    self.refreshHeader = YES;
    
}

//xib文件创建
-(void)awakeFromNib{
    [self _initView];
}

-(void)setRefreshHeader:(BOOL)refreshHeader{
    refreshHeader = refreshHeader;
    if (refreshHeader) {
          [self addSubview:_refreshHeaderView];
    }else{
        if ([_refreshHeaderView superview]) {
            [_refreshHeaderView removeFromSuperview];
        }
    }
}

#pragma mark -UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
    return cell;
}

-(void)tableView:(BaseTableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.eventDelegate respondsToSelector:@selector(tableView:didDeselectRowAtIndexPath:)]) {
        [self.eventDelegate tableView:self didDeselectRowAtIndexPath:indexPath];
    }
}

#pragma mark -
#pragma mark 下拉刷新的相关方法

- (void)reloadTableViewDataSource{
	_reloading = YES;
	
}

- (void)doneLoadingTableViewData{
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self];
}

-(void)refreshData{
    [_refreshHeaderView initLoading:self];
}
#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
	
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods
//下拉到一定距离，手指放开时调用
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
    
    //停止加载，弹回下拉
//	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
    if ([self.eventDelegate respondsToSelector:@selector(pullDown:)]) {
    [self.eventDelegate pullDown:self];
    }
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

//取得下拉刷新的时间
- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}


-(void)dealloc{
    [super dealloc];
    [_refreshHeaderView release];
    _refreshHeaderView = nil;
}

@end
