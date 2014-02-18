//
//  RCGlobalConfig.h
//  RubyChina
//
//  Created by pan dabo on 14-2-11.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import <Foundation/Foundation.h>

// API 接口类型:ruby-china、v2ex
typedef enum {
    ForumBaseAPIType_RubyChina,
    ForumBaseAPIType_V2EX
}ForumBaseAPIType;


// 帖子类型
typedef enum {
    RCForumTopicsType_LatestActivity,//当前活跃帖子
    RCForumTopicsType_HighQuality,//优质帖子
    RCForumTopicsType_NeverReviewed,//无人问津
    RCForumTopicsType_LatestCreate,//最新创建
    RCForumTopicsType_NodeList,//某一分类帖子
    RCForumTopicsType_UserPosted,//某个用户发的
    RCForumTopicsType_UserFavorited//某个用户收藏
}RCForumTopicsType;


@interface RCGlobalConfig : NSObject

@end
