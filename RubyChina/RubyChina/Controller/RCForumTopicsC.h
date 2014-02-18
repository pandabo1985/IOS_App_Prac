//
//  RCForumTopicsC.h
//  RubyChina
//
//  Created by pan dabo on 14-2-10.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "JLNimbusTableViewController.h"

@interface RCForumTopicsC : JLNimbusTableViewController

// 根据类型初始化，无其他参数：热门帖子、精华帖等
- (id)initWithTopicsType:(RCForumTopicsType)topicsType;

// 分类节点帖子列表
- (id)initWithNodeName:(NSString*)nodeName nodeId:(NSUInteger)nodeId;

// 用户的帖子列表
- (id)initWithUserLoginId:(NSString*)loginId;

// 用户收藏的帖子列表
- (id)initForFavoritedWithUserLoginId:(NSString*)loginId;
@end
