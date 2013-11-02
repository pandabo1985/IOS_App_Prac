//
//  WeiboView.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-23.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTLabel.h"
@class WeiboModel;

@interface WeiboView : UIView<RTLabelDelegate>
{
    @private
    RTLabel *_textLabel;//微博内容
    UIImageView *_image;//微博图片
    UIImageView *_repostBackgroudView;//转发的微博背景
    WeiboView *_repostView; //转发的微博试图
    
}

//微博模型
@property(nonatomic,retain)WeiboModel *weiboModel;
//转发的微博试图
//@property(nonatomic,retain)WeiboView *repostView;

@property (nonatomic,assign)BOOL isRepost;//当前的微博试图是否是转发

+(CGFloat)getWeiboViewHeight:(WeiboModel *)weiboModel isRepost:(BOOL)isRepost;//微博的高度
@end
