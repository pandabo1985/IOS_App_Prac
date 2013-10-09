//
//  TwitterView.h
//  Oschina_Prac
//
//  Created by pan dabo on 13-10-2.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IocnDownloaderDelegate.h"
#import "IconDownloader.h"
#import "EGORefreshTableHeaderDelegate.h"
#import "EGORefreshTableHeaderView.h"

@interface TwitterView : UIViewController<UITableViewDataSource, UITableViewDelegate,IocnDownloaderDelegate,EGORefreshTableHeaderDelegate>
{
    NSMutableArray *tweets;
    BOOL isLoading;
    BOOL isLoadOver;
    int allCount;
    
    //下拉刷新
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
    BOOL _isInitialize;
    
}

//TableView
@property (strong, nonatomic) IBOutlet UITableView *tableTweets;

//异步加载图片
@property (retain, nonatomic) NSMutableDictionary *imageDownLoadsInProgress;
@property (retain, nonatomic) NSMutableDictionary *twwetDownloadsInProgress;
-(void)startIconDownload:(ImgRecord *)imgRecord forIndexPath:(NSIndexPath *)indexPath;
-(void)startIconDownload2:(ImgRecord *)imgRecord forIndexPath:(NSIndexPath *)indexPath;
//加载不同类型的动弹类表 最新、热门、我的
//如果为0则加载所有人最新的动弹 否则加载指定uid的最新动弹
@property int _uid;
-(void)reloadUID:(int)newUID;
-(void)reload:(BOOL)noRefresh;

//清空列表
-(void)clear;

//下拉刷新
-(void)refresh;
-(void)reloadTableViewDataSource;
-(void)doneLoadingTableViewData;

@end
