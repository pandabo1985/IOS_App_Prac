//
//  WeiboView.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-23.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "WeiboView.h"
#import "UIFactory.h"
#import "WeiboModel.h"
#import "UIImageView+WebCache.h"

@implementation WeiboView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)_initView
{
    //微博
    _textLabel = [[RTLabel alloc]initWithFrame:CGRectZero];
    _textLabel.delegate = self;
    _textLabel.font = [UIFont systemFontOfSize:14.0f];
    _textLabel.linkAttributes = [NSDictionary dictionaryWithObject:@"blue" forKey:@"color"];
    _textLabel.selectedLinkAttributes = [NSDictionary dictionaryWithObject:@"darkGray" forKey:@"color"];
    [self addSubview:_textLabel];
    
    _image = [[UIImageView alloc] initWithFrame:CGRectZero];
    _image.image = [UIImage imageNamed:@"page_image_loading.png"];
    [self addSubview:_image];
    
    _repostBackgroudView = [UIFactory createImageView:@"timeline_retweet_background.png"];
    UIImage *image = [_repostBackgroudView.image stretchableImageWithLeftCapWidth:25 topCapHeight:10];
    _repostBackgroudView.image = image;
    _repostBackgroudView.backgroundColor =[UIColor clearColor];
    [self insertSubview:_repostBackgroudView atIndex:0];
    
   
    
}
-(void)setWeiboModel:(WeiboModel *)weiboModel
{
    if (_weiboModel != weiboModel) {
        [_weiboModel release];
        _weiboModel = [weiboModel  retain];
    }
    if (_repostView == nil) {
        _repostView = [[WeiboView alloc]initWithFrame:CGRectZero];
        _repostView.isRepost = YES;
        [self addSubview:_repostView];
    }
}

//展示数据，设置布局
-(void)layoutSubviews
{
    [super layoutSubviews];
    //微博内容_textLabel子视图
    _textLabel.frame = CGRectMake(0, 0, self.width, 20);
    if (self.isRepost) {
        _textLabel.frame = CGRectMake(10, 10, self.width - 20, 0);
    }
    _textLabel.text = _weiboModel.text;
   CGSize textSize =  _textLabel.optimumSize;
    _textLabel.height = textSize.height;
    //转发的微博_textlabel视图
    WeiboModel *respostWeibo = _weiboModel.relWeibo;
    if (respostWeibo !=nil) {
        _repostView.weiboModel = respostWeibo;
#warning 高度待定
        _repostView.frame = CGRectMake(0, _textLabel.bottom, self.width, 0);
        _repostView.hidden = NO;
        
    }else{
        _repostView.hidden = YES;
    }
    //微博图片视图
    NSString *thumbnailImage = _weiboModel.thumbnailImage;
    if (thumbnailImage !=nil &&[@"" isEqualToString:thumbnailImage]) {
        _image.hidden = NO;
        _image.frame = CGRectMake(10, _textLabel.bottom, 70, 80);
        [_image setImageWithURL:[NSURL URLWithString:thumbnailImage]];
    }else{
        _image.hidden = YES;
    }
    //转发微博视图的背景
    if (self.isRepost){
        _repostBackgroudView.frame = self.bounds;
        _repostBackgroudView.hidden = NO;
    }else{
        _repostBackgroudView.hidden = YES;
    }
}
#pragma weibo height
+(CGFloat)getWeiboViewHeight:(WeiboModel *)weiboModel isRepost:(BOOL)isRepost{
    return 0;
}

#pragma mark -RTLabel delegate

- (void)rtLabel:(id)rtLabel didSelectLinkWithURL:(NSURL*)url
{
    
}

@end
