//
//  WeiboCell.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-23.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WeiboModel;
@class WeiboView;

@interface WeiboCell : UITableViewCell
{
    UIImageView *_userImage;//用户头像视图
    UILabel *_nickLabel;    //昵称
    UILabel *_repostContLabel;  //转发数
    UILabel *_commentLabel;   //回复数
    UILabel *_sourceLabe ; //发布来源
    UILabel *_createLabe;//发布时间
    
}

@property(nonatomic,retain)WeiboModel *weiboModel;
@property(nonatomic,retain)WeiboView *weiboView;



@end
