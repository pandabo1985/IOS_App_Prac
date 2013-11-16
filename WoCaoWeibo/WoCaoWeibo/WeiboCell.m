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
#import "UIUtils.h"
#import "RegexKitLite.h"


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
    //背景颜色选中图片
    UIView *selectedBackgroundView  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
    selectedBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"statusdetail_cell_sepatator"]];
    self.selectedBackgroundView = selectedBackgroundView;
    [selectedBackgroundView release];
    
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
    
    //发布时间
    NSString *createDate = _weiboModel.createDate;
    if (createDate != nil) {
        _createLabe.hidden = NO;
//        NSDate *date = [UIUtils dateFromFomate:createDate formate:@"E M d HH:mm:ss Z yyyy"];
//        NSString *datestring = [UIUtils stringFromFomate:date formate:@"MM-dd HH:mm"];
//        _createLabe.text = datestring;
        _createLabe.text = [UIUtils fomateString:createDate];
        
        _createLabe.frame = CGRectMake(50, self.height - 20, 100, 20);
        [_createLabe sizeToFit];
    }else{
        _createLabe.hidden = YES;
    }
   
    //微博来源
    NSString *source = _weiboModel.source;
    NSString *ret = [self parseSouce:source];
    if (ret !=nil) {
        _sourceLabe.hidden = NO;
        _sourceLabe.text = [NSString stringWithFormat:@"来自：%@",ret];
        _sourceLabe.frame = CGRectMake(_createLabe.right+8, _createLabe.top, 100, 20);
        [_sourceLabe sizeToFit];
    }else{
        _sourceLabe.hidden = YES;
    }
    
}

-(NSString *)parseSouce:(NSString *)source{
    NSString *regex = @">\\w+<";
        NSArray *array = [source componentsMatchedByRegex:regex];
    if (array.count > 0) {
        NSString *ret = [array objectAtIndex:0];
        NSRange range;
        range.location = 1;
        range.length = ret.length -2;
        NSString *resultstring = [ret substringWithRange:range];
        return resultstring;
    }
    return nil;
}
@end
