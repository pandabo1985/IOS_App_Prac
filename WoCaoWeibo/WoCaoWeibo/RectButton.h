//
//  RectButton.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-12-15.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RectButton : UIButton{
    UILabel *_rectTitleLabel;
    UILabel *_subtitleLabel;
}

@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy)NSString *subtitle;

@end
