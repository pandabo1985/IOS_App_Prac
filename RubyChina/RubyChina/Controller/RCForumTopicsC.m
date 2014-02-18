//
//  RCForumTopicsC.m
//  RubyChina
//
//  Created by pan dabo on 14-2-10.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "RCForumTopicsC.h"

@interface RCForumTopicsC ()

@end

@implementation RCForumTopicsC

#pragma mark -UIViewController
// 根据类型初始化，无其他参数：热门帖子、精华帖等
- (id)initWithTopicsType:(RCForumTopicsType)topicsType
{
    self = [self initWithStyle:UITableViewStylePlain];
    if (self) {
        self.title = [self stringForTopicsType:topicsType];
//        ((RCForumTopicsModel*)self.model).topicsType = topicsType;
//        self.topicsType = topicsType;
//        self.navigationItem.rightBarButtonItems =
//        [NSArray arrayWithObjects:
//         [RCGlobalConfig createRefreshBarButtonItemWithTarget:self
//                                                       action:@selector(autoPullDownRefreshActionAnimation)],
//         [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
//                                                       target:self action:@selector(postNewTopicAction)],
//         nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.backgroundColor = TABLE_VIEW_BG_COLOR;
    self.tableView.backgroundColor = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

#pragma mark - Private

///////////////////////////////////////////////////////////////////////////////////////////////////
- (NSString*)stringForTopicsType:(RCForumTopicsType)topicsType
{
    NSString* topicsTypeName = nil;
    switch (topicsType) {
        case RCForumTopicsType_LatestActivity:
            topicsTypeName = @"热门讨论";
            break;
        case RCForumTopicsType_HighQuality:
            topicsTypeName = @"优质帖子";
            break;
        case RCForumTopicsType_NeverReviewed:
            topicsTypeName = @"无人问津";
            break;
        case RCForumTopicsType_LatestCreate:
            topicsTypeName = @"最新创建";
            break;
        default:
            topicsTypeName = @"暂无分类";
            break;
    }
    return topicsTypeName;
}


@end
