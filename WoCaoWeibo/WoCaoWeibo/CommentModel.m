//
//  CommentModel.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-11-24.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel
-(void)setAttributes:(NSDictionary *)dataDic{
    [super setAttributes:dataDic];
    NSDictionary *userDic = [dataDic objectForKey:@"user"];
    NSDictionary *statusDic = [dataDic objectForKey:@"status"];
    
    UserModel *user = [[UserModel alloc] initWithDataDic:userDic];
    WeiboModel *weibo = [[WeiboModel alloc] initWithDataDic:statusDic];

    self.user = [user autorelease];
    self.weibo = [weibo autorelease];
}

@end
