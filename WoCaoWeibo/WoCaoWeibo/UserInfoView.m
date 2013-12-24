//
//  UserInfoView.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-12-15.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "UserInfoView.h"
#import "UIImageView+WebCache.h"
#import "UserModel.h"
#import "RectButton.h"

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


-(void)layoutSubviews{
    [super layoutSubviews];
    
    NSString *urlstring = self.userModel.avatar_large;
    [self.userImage setImageWithURL:[NSURL URLWithString:urlstring]];
    self.nameLabel.text =self.userModel.screen_name;
    NSString *gender = self.userModel.gender;
    NSString *sexName = @"未知";
    if ([gender isEqualToString:@"f"]) {
        sexName = @"女";
    }else if([gender isEqualToString:@"m"]){
        sexName = @"男";
    }
    NSString *location = self.userModel.location;
    if (location == nil) {
        location = @"";
    }
    self.addressLabel.text = [NSString stringWithFormat:@"%@ %@",sexName,location];
    
    self.infoLabel.text = (self.userModel.description == nil)?@"":self.userModel.description;
    
    NSString *count = [self.userModel.statuses_count stringValue];
    self.countLabel.text = [NSString stringWithFormat:@"共%@条微博",count];
    
    long favL = [self.userModel.followers_count longValue];
    NSString *fans = [NSString stringWithFormat:@"%ld",favL];
    if (favL >= 10000) {
        favL = favL / 1000;
        fans = [NSString stringWithFormat:@"%ld万",favL];
    }
 
    self.fansButton.title = @"粉丝";
    self.fansButton.subtitle = fans;
    
     self.attButton.title = @"关注";
    self.attButton.subtitle = [self.userModel.friends_count stringValue];
   
}

- (void)dealloc {
    [_userImage release];
    [_nameLabel release];
    [_addressLabel release];
    [_infoLabel release];
    [_attButton release];
    [_fansButton release];
    [_countLabel release];
    [super dealloc];
}
@end
