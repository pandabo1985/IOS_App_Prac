//
//  RCGlobalConfig.m
//  RubyChina
//
//  Created by pan dabo on 14-2-11.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "RCGlobalConfig.h"

static ForumBaseAPIType forumBaseAPIType = ForumBaseAPIType_RubyChina;

@implementation RCGlobalConfig



///////////////////////////////////////////////////////////////////////////////////////////////////
+ (ForumBaseAPIType)forumBaseAPIType
{
    return forumBaseAPIType;
}

@end
