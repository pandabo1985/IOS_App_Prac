//
//  UserInfoView.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-12-15.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UserModel;
@class RectButton;

@interface UserInfoView : UIView

@property(nonatomic,retain)UserModel *userModel;
@property (retain, nonatomic) IBOutlet UIImageView *userImage;

@property (retain, nonatomic) IBOutlet UILabel *nameLabel;
@property (retain, nonatomic) IBOutlet UILabel *addressLabel;
@property (retain, nonatomic) IBOutlet UILabel *infoLabel;
@property (retain, nonatomic) IBOutlet RectButton *attButton;
@property (retain, nonatomic) IBOutlet RectButton *fansButton;
@property (retain, nonatomic) IBOutlet UILabel *countLabel;

@end
