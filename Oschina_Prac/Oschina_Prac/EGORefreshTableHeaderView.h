//
//  EGORefreshTableHeaderView.h
//  Oschina_Prac
//
//  Created by pan dabo on 13-10-2.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum{
    EGOPullRefreshPulling = 0,
    EGOPullRefreshNormal,
    EGOPullRefreshLoading
}EGOPullRefreshState;


@protocol EGORefreshTableHeaderDelegate;

@interface EGORefreshTableHeaderView : UIView
{
    id _delegate;
    EGOPullRefreshState _state;
    UILabel *_lastUpdateLabel;
    UILabel *_statusLabel;
    CALayer *_arrowImage;
    UIActivityIndicatorView *_activityView;
}

@property(nonatomic, assign) id<EGORefreshTableHeaderDelegate> delegate;

-(id)initWithFrame:(CGRect)frame arrowImageName:(NSString *)arrow textColor:(UIColor *)textColor;
-(void)refreshLastUpdatedDate;
-(void)egoRefreshScrollViewDidScroll:(UIScrollView *)scrollView;
-(void)egoRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView;
-(void)egoRefreshScrollViewDateSourceDidFinishedLoading:(UIScrollView *)scrollView;
@end


@protocol EGORefreshTableHeaderDelegate
- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view;
- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view;
@optional
- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view;
@end
