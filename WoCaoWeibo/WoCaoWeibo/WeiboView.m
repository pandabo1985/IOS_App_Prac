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
#import "NSString+URLEncoding.h"
#import "UIUtils.h"
#import "UserViewController.h"

#define LIST_FONT 14.0f //列表微博内容字体
#define  LIST_REPOST_FONT 13.0f//列表转发微博内容字体
#define DETAIL_FONT 18.0f//微博详情文本字体
#define DETAIL_REPOST_FONT 17.0f//详情微博内容转发字体



@implementation WeiboView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _initView];
//        _parseText = [NSMutableString string];//全局的变量应该自己管理内存，不能交给自动释放池。
        _parseText = [[NSMutableString alloc] init];
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
    _repostBackgroudView.leftCapWith = 25;
    _repostBackgroudView.topCapHeight = 10;
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
        _repostView.isDetail = self.isDetail;
        [self addSubview:_repostView];
    }
    
    [self parseLink];
}
//解析超连接
-(void)parseLink{
    [_parseText setString:@""];
    
    //判断当前微博是否为转发微博
    if (_isRepost) {
        //将源微博作者拼接
        //源微博作者昵称
        NSString *nickName = _weiboModel.user.screen_name;
        NSString *encodeName = [nickName URLEncodedString];
        [_parseText appendFormat:@"<a href='user://%@‘>%@</a>:",encodeName,nickName];
    }
    
    NSString *text = _weiboModel.text;
    text = [UIUtils parseLink:text];
    [_parseText appendString:text];
}
//展示数据，设置布局
-(void)layoutSubviews
{
    [super layoutSubviews];
   //微博内容
    [self _renderLabel];
    
    //源微博_textlabel视图
    [self _renderSourceWeiboView];
    //微博图片视图
    
    [self _renderImage];
    //转发微博视图的背景
    if (self.isRepost){
        _repostBackgroudView.frame = self.bounds;
        _repostBackgroudView.hidden = NO;
    }else{
        _repostBackgroudView.hidden = YES;
    }
}

-(void)_renderLabel
{
    //微博内容_textLabel子视图
    float fontSize =  [WeiboView getFontSize:self.isDetail isRepost:self.isRepost];
    _textLabel.font = [UIFont systemFontOfSize:fontSize];
    _textLabel.frame = CGRectMake(0, 0, self.width, 20);
    if (self.isRepost) {
        _textLabel.frame = CGRectMake(10, 10, self.width - 20, 0);
    }
    _textLabel.text = _parseText;
    CGSize textSize =  _textLabel.optimumSize;
    _textLabel.height = textSize.height;
}

-(void)_renderSourceWeiboView{
    WeiboModel *respostWeibo = _weiboModel.relWeibo;
    if (respostWeibo !=nil) {
        _repostView.weiboModel = respostWeibo;
        
        float height =  [WeiboView getWeiboViewHeight:respostWeibo isRepost:YES isDetai:self.isDetail];
        _repostView.frame = CGRectMake(0, _textLabel.bottom, self.width, height);
        _repostView.hidden = NO;
        
    }else{
        _repostView.hidden = YES;
    }
}

-(void)_renderImage{
    if (self.isDetail) {
        
        //中等图，微博详情
        NSString *bmiddleImage = _weiboModel.bmiddleImage;
        if (bmiddleImage !=nil &&![@"" isEqualToString:bmiddleImage]) {
            _image.hidden = NO;
            _image.frame = CGRectMake(10, _textLabel.bottom+10, 280, 200);
            [_image setImageWithURL:[NSURL URLWithString:bmiddleImage]];
        }else{
            _image.hidden = YES;
        }
        
        
    }else{
        
        int mode = [[NSUserDefaults standardUserDefaults] integerForKey:kBrowMode];
        if (mode == 0) {
            mode = SmallBrowMode;
        }
        if (mode == SmallBrowMode) {
            //缩略图
            NSString *thumbnailImage = _weiboModel.thumbnailImage;
            if (thumbnailImage !=nil &&![@"" isEqualToString:thumbnailImage]) {
                _image.hidden = NO;
                _image.frame = CGRectMake(10, _textLabel.bottom+10, 70, 80);
                [_image setImageWithURL:[NSURL URLWithString:thumbnailImage]];
            }else{
                _image.hidden = YES;
            }
        }else if (mode == LargeBrowMode){
            //缩略图
            NSString *thumbnailImage = _weiboModel.bmiddleImage;
            if (thumbnailImage !=nil &&![@"" isEqualToString:thumbnailImage]) {
                _image.hidden = NO;
                _image.frame = CGRectMake(10, _textLabel.bottom+10, self.width -20, 180);
                [_image setImageWithURL:[NSURL URLWithString:thumbnailImage]];
            }else{
                _image.hidden = YES;
            }
        }
     
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
    
    NSString *weiboText = nil;
    if (isRepost) {
        textLabel.width -=20;
        NSString *nickName = weiboModel.user.screen_name;
        weiboText = [NSString stringWithFormat:@"%@:%@",nickName,weiboModel.text];
        
    }else {
        weiboText = weiboModel.text;
    }
    textLabel.text =weiboText;
    height +=textLabel.optimumSize.height;
    //计算微博图片的高度
    
    if (isDetail) {
        
        //中等图，微博详情
        NSString *bmiddleImage = weiboModel.bmiddleImage;
        if (bmiddleImage  != nil && ![@"" isEqualToString:bmiddleImage]) {
            height +=(200 + 10);
        }
    }else{
        int mode = [[NSUserDefaults standardUserDefaults] integerForKey:kBrowMode];
        if (mode == 0) {
            mode = SmallBrowMode;
        }
        if (mode == SmallBrowMode) {
            NSString *thumbmailImage = weiboModel.thumbnailImage;
            if (thumbmailImage  != nil && ![@"" isEqualToString:thumbmailImage]) {
                height +=(80 + 10);
            }
        }else{
            //中等图，微博详情
            NSString *bmiddleImage = weiboModel.bmiddleImage;
            if (bmiddleImage  != nil && ![@"" isEqualToString:bmiddleImage]) {
                height +=(180 + 10);
            }

        }
        
       
    }
    
   
    
    WeiboModel *relWeibo =  weiboModel.relWeibo;
    if (relWeibo != nil) {
        float repostHeight = [WeiboView getWeiboViewHeight:relWeibo isRepost:YES isDetai:isDetail];
        height +=repostHeight;
    }
    if (isRepost) {
        height += 30;
    }
    [textLabel release];
    return height;
}

#pragma mark -RTLabel delegate

- (void)rtLabel:(id)rtLabel didSelectLinkWithURL:(NSURL*)url
{
    NSString *absoluteString = [url absoluteString];
    if ([absoluteString hasPrefix:@"user"]) {
        NSString *urlstring =  [url host];
        urlstring = [urlstring URLDecodedString];
       
        UserViewController *viewCtrl = [[UserViewController alloc]init];
        [self.viewController.navigationController pushViewController:viewCtrl animated:YES];
    }else if([absoluteString hasPrefix:@"http"]){
        NSLog(@"连接： %@",absoluteString);
    }else if([absoluteString hasPrefix:@"topic"]){
        NSString *urlstring = [url host];
        urlstring = [urlstring URLDecodedString];
        NSLog(@"话题 ： %@",urlstring);
    }
    
    
}

@end
