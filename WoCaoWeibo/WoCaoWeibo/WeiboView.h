//
//  WeiboView.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-23.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTLabel.h"
#import "ThemeImageView.h"

#define KWEIWO_WITH_LIST (320 - 60) //微博列表的宽度
#define KWEIWO_WITH_DETAIL 300   //微博详情页面的宽度

@class WeiboModel;

@interface WeiboView : UIView<RTLabelDelegate>
{
    @private
    RTLabel *_textLabel;//微博内容
    UIImageView *_image;//微博图片
    ThemeImageView *_repostBackgroudView;//转发的微博背景
    WeiboView *_repostView; //转发的微博试图
    NSMutableString *_parseText;
    
}

//微博模型
@property(nonatomic,retain)WeiboModel *weiboModel;
//转发的微博试图
//@property(nonatomic,retain)WeiboView *repostView;

@property (nonatomic,assign)BOOL isRepost;//当前的微博视图是否是转发

@property (nonatomic,assign)BOOL isDetail;//当前的微博试图是否显示在详情


+(float)getFontSize:(BOOL)isDetail isRepost:(BOOL)isRespost;//获取字体大小

+(CGFloat)getWeiboViewHeight:(WeiboModel *)weiboModel isRepost:(BOOL)isRepost isDetai:(BOOL) isDetail;//微博的高度
@end
