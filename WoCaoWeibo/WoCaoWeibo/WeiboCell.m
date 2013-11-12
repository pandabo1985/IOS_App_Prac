//
//  WeiboCell.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-23.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "WeiboCell.h"
#import "WeiboView.h"
#import "WeiboModel.h"
#import "UIImageView+WebCache.h"


@implementation WeiboCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _initView];
    }
    return self;
}


-(void)_initView
{
    
    //用户头像
    _userImage = [[UIImageView alloc] initWithFrame:CGRectZero];
    _userImage.backgroundColor = [UIColor clearColor];
    _userImage.layer.cornerRadius = 5;
    _userImage.layer.borderWidth = .5;
    _userImage.layer.borderColor = [UIColor greenColor].CGColor;
    _userImage.layer.masksToBounds = YES;
    [self.contentView addSubview:_userImage];
    
    //昵称
    _nickLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _nickLabel.backgroundColor = [UIColor clearColor];
    _nickLabel.font = [UIFont systemFontOfSize:14.0];
    [self.contentView addSubview:_nickLabel];
    
    //转发数
    _repostContLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _repostContLabel.font = [UIFont systemFontOfSize:12.0];
    _repostContLabel.backgroundColor = [UIColor clearColor];
    _repostContLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_repostContLabel];
    
    //评论数
    _commentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _commentLabel.font = [UIFont systemFontOfSize:12.0];
    _commentLabel.backgroundColor = [UIColor clearColor];
    _commentLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:_commentLabel];
    
    //来源
    _sourceLabe = [[UILabel alloc] initWithFrame:CGRectZero];
    _sourceLabe.font = [UIFont systemFontOfSize:12.0];
    _sourceLabe.backgroundColor = [UIColor clearColor];
    _sourceLabe.textColor = [UIColor blackColor];
    [self.contentView addSubview:_sourceLabe];
    //发布时间
    _createLabe = [[UILabel alloc] initWithFrame:CGRectZero];
    _createLabe.font = [UIFont systemFontOfSize:12.0];
    _createLabe.backgroundColor = [UIColor clearColor];
    _createLabe.textColor = [UIColor blueColor];
    [self.contentView addSubview:_createLabe];
    
    _weiboView = [[WeiboView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:_weiboView];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    //用户头像
    _userImage.frame = CGRectMake(5, 5, 35, 35);
    NSString *userImageUrl = _weiboModel.user.profile_image_url;
    [_userImage setImageWithURL:[NSURL URLWithString:userImageUrl]];
    //昵称
    _nickLabel.frame = CGRectMake(50, 5, 200, 20);
    _nickLabel.text = _weiboModel.user.screen_name;
    
    //微博视图
    _weiboView.weiboModel = _weiboModel;
    float h = [WeiboView getWeiboViewHeight:_weiboModel isRepost:NO isDetai:NO];
    _weiboView.frame = CGRectMake(50, _nickLabel.bottom+10, KWEIWO_WITH_LIST,h);
    
}
@end
