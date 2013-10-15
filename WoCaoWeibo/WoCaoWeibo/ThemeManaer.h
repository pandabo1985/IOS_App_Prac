//
//  ThemeManaer.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-13.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//
//主题管理类
#import <Foundation/Foundation.h>


@interface ThemeManaer : NSObject

@property(nonatomic, retain) NSString *themeName;//当前使用的主题名称
@property(nonatomic,retain) NSDictionary *themesPlist;


+ (ThemeManaer *)shareInstance;
//获得当前主题下的图片
-(UIImage *)getThemeImage:(NSString *)imageName;
@end
