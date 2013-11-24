//
//  CommentCell.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-11-24.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "CommentCell.h"
#import "RTLabel.h"
#import "UIImageView+WebCache.h"
#import "CommentModel.h"
#import "UIUtils.h"


@implementation CommentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)awakeFromNib{
    _userImage = [(UIImageView *)[self viewWithTag:100] retain];
    _nickLabel = [(UILabel *)[self viewWithTag:101] retain];
    _timeLabel = [(UILabel *)[self viewWithTag:102] retain];
    _commentLabel = [[RTLabel alloc] initWithFrame:CGRectMake(_userImage.right+10, _nickLabel.bottom+5, 240, 21)];
    _commentLabel.font = [UIFont systemFontOfSize:14.0f];
    _commentLabel.delegate = self;
    
    _commentLabel.linkAttributes = [NSDictionary dictionaryWithObject:@"blue" forKey:@"color"];
    _commentLabel.selectedLinkAttributes = [NSDictionary dictionaryWithObject:@"darkGray" forKey:@"color"];
    [self.contentView addSubview:_commentLabel];

}

-(void)layoutSubviews{
    [super layoutSubviews];
   NSString *urlString =  self.commentModel.user.profile_image_url;
    [_userImage setImageWithURL:[NSURL URLWithString:urlString]];
    
    _nickLabel.text = self.commentModel.user.screen_name;
    _timeLabel.text = [UIUtils fomateString:self.commentModel.created_at];
    
    
     NSString *commentTexst = self.commentModel.text;
    //解析替换超链接
    commentTexst = [UIUtils parseLink:commentTexst];
    _commentLabel.text = commentTexst;
    _commentLabel.height = _commentLabel.optimumSize.height;
    
}

//单元格得到高度
+(float)getCommentHeight:(CommentModel *)commentModel{
    RTLabel *rt = [[RTLabel alloc] initWithFrame:CGRectMake(0, 0, 240, 0)];
    rt.font = [UIFont systemFontOfSize:14.0f];
    rt.text = commentModel.text;
    
    return rt.optimumSize.height;
}

#pragma mark -RTLdelegate
- (void)rtLabel:(id)rtLabel didSelectLinkWithURL:(NSURL*)url{
    
}

@end
