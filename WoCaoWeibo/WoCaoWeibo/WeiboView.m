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

#define LIST_FONT 14.0f //列表微博内容字体
#define  LIST_REPOST_FONT 13.0f//列表转发微博内容字体
#define DETAIL_FONT 18.0f//微博详情文本字体
#define DETAIL_REPOST_FONT 17.0f//详情微博内容转发字体

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
   float fontSize =  [WeiboView getFontSize:self.isDetail isRepost:self.isRepost];
    _textLabel.font = [UIFont systemFontOfSize:fontSize];
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

       float height =  [WeiboView getWeiboViewHeight:respostWeibo isRepost:YES isDetai:self.isDetail];
        _repostView.frame = CGRectMake(0, _textLabel.bottom, self.width, height);
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

+(float)getFontSize:(BOOL)isDetail isRepost:(BOOL)isRespost
{
    float fontSize = 14.0f;
    if (!isDetail && !isRespost) {
        return LIST_FONT;
    }else if(!isDetail && isRespost){
        return LIST_REPOST_FONT;
    }else if (isDetail && !isRespost){
        return DETAIL_FONT;
    }else if(isDetail && isRespost){
        return DETAIL_REPOST_FONT;
    }
    return fontSize;
}
#pragma weibo height
+(CGFloat)getWeiboViewHeight:(WeiboModel *)weiboModel isRepost:(BOOL)isRepost isDetai:(BOOL)isDetail{
    /**
     *实现思路：计算每个子视图的高度，然后相加
     */
    float height = 0;
    //计算微博内容text高度
    RTLabel *textLabel = [[RTLabel alloc]initWithFrame:CGRectZero];
    float fontSize = [WeiboView getFontSize:isDetail isRepost:isRepost];
    textLabel.font = [UIFont systemFontOfSize:fontSize];
    if (isDetail) {
        textLabel.width = KWEIWO_WITH_DETAIL;
    }else{
        textLabel.width = KWEIWO_WITH_LIST;
    }
    
    textLabel.text = weiboModel.text;
    height +=textLabel.optimumSize.height;
    //计算微博图片的高度
    NSString *thumbmailImage = weiboModel.thumbnailImage;
    if (thumbmailImage  != nil && [@"" isEqualToString:thumbmailImage]) {
        height +=(80 + 10);
    }
    
    WeiboModel *relWeibo =  weiboModel.relWeibo;
    if (relWeibo != nil) {
        float repostHeight = [WeiboView getWeiboViewHeight:relWeibo isRepost:YES isDetai:isDetail];
        height +=repostHeight;
    }
    return height;
}

#pragma mark -RTLabel delegate

- (void)rtLabel:(id)rtLabel didSelectLinkWithURL:(NSURL*)url
{
    
}

@end
