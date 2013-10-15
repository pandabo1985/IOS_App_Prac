//
//  CustomCatagory.m
//  WXMovie
//
//  Created by wei.chen on 12-7-2.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CustomCatagory.h"
#import "ThemeManaer.h"

//5.0以下系统自定义UINavigationBar背景
@implementation UINavigationBar(setbackgroud)

- (void)drawRect:(CGRect)rect {
//    UIImage *image = [UIImage imageNamed:@"navigationbar_button_background.png"];
    UIImage *image = [[ThemeManaer shareInstance] getThemeImage:@"navigationbar_button_background.png"];
    [image drawInRect:rect];
}

@end
