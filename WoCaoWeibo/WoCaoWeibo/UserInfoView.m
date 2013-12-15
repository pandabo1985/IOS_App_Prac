//
//  UserInfoView.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-12-15.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "UserInfoView.h"

@implementation UserInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
          UIView *view =[[[NSBundle mainBundle] loadNibNamed:@"UserInfoView" owner:self options:nil] lastObject];
        [self addSubview:view];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc {
    [_userInfoImage release];
    [super dealloc];
}
@end
