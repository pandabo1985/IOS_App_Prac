//
//  CommentModel.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-11-24.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "WXBaseModel.h"
#import "UserModel.h"
#import "WeiboModel.h"

@interface CommentModel : WXBaseModel

@property(nonatomic,copy)NSString *created_at;
@property(nonatomic,retain)NSNumber *id;
@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *source;
@property(nonatomic,retain)UserModel *user;
@property(nonatomic,copy)NSString *mid;
@property(nonatomic,copy)NSString *idstr;
@property(nonatomic,retain)WeiboModel *weibo;


@end
