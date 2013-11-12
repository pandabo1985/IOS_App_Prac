//
//  ThemeImageView.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-15.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "ThemeImageView.h"
#import "ThemeManaer.h"


@implementation ThemeImageView

//使用xib创建后，调用的初始化方法
-(void)awakeFromNib
{
    [super awakeFromNib];
       [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
}
-(id)init{
    self = [super init];
    if (self) {
          [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
    }
    return self;

}
-(id)initWithImageName:(NSString *)imageName
{
    self = [self init];
    if (self) {
        self.imageName = imageName;
    }
    return self;
}
-(void)loadThemeImage
{
    if (self.imageName == nil) {
        return;
    }
    UIImage *image = [[ThemeManaer shareInstance] getThemeImage:_imageName];
    image = [image stretchableImageWithLeftCapWidth:self.leftCapWith topCapHeight:self.topCapHeight];
    self.image= image;
}
-(void)setImageName:(NSString *)imageName
{
    if (_imageName !=imageName) {
        [_imageName release];
        _imageName = [imageName copy];
    }
    [self loadThemeImage];
}

-(void)dealloc
{
    [super dealloc];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:kThemeDidChangeNotification object:nil];
}

#pragma mark -notification actions
-(void)themeNotification:(NSNotification *)notification
{
    [self loadThemeImage];
}



@end
