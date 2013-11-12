//
//  ThemeImageView.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-15.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeImageView : UIImageView

@property(nonatomic,assign)int leftCapWith;
@property(nonatomic,assign)int topCapHeight;

@property(nonatomic,copy)NSString *imageName;
-(id)initWithImageName:(NSString *)imageName;
@end
