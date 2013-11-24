//
//  CommentCell.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-11-24.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RTLabel.h"
@class CommentModel;

@interface CommentCell : UITableViewCell<RTLabelDelegate>{
    UIImageView *_userImage;
    UILabel *_nickLabel;
    UILabel *_timeLabel;
    RTLabel *_commentLabel;
}

@property(nonatomic,retain)CommentModel *commentModel;

+(float)getCommentHeight:(CommentModel *)commentModel;

@end
