//
//  ThemeButton.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-13.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "ThemeButton.h"
#import "ThemeManaer.h"
@implementation ThemeButton



-(id)initWithImage:(NSString *)imageName highlighteImageName:(NSString *)highlighteImageName
{
    self = [self init];
    if (self) {
        self.imageName =imageName;
        self.highlightImageName = highlighteImageName;
    }
    return self;
}

-(id)initWithBackground:(NSString *)BackgroundImageName
highlighteBackgroundImageName:(NSString *)BackgroundHighlighteImageName
{
    self = [self init];
    if (self) {
        self.backgroundImageName =BackgroundImageName;
        self.backgroundHighlightImageName = BackgroundHighlighteImageName;
    }
    return self;

}

-(id)init
{
    self = [super init];
    if (self) {
         NSLog(@"%@",self);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
    }
    return self;
}

-(void)themeNotification:(NSNotification *)notification
{
    [self loadThemeImage];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}

-(void)loadThemeImage{
    ThemeManaer *themeMage = [ThemeManaer shareInstance];
    
    UIImage *image = [themeMage getThemeImage:self.imageName];
    UIImage *highlightImage = [themeMage getThemeImage:self.highlightImageName];
    
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:highlightImage forState:UIControlStateHighlighted];
    

    UIImage *backImage = [themeMage getThemeImage:_backgroundImageName];
    UIImage *backHighlightImage = [themeMage getThemeImage:_backgroundHighlightImageName];
    
    [self setBackgroundImage:backImage forState:UIControlStateNormal];
    [self setBackgroundImage:backHighlightImage forState:UIControlStateHighlighted];
    
}

#pragma mark -setter
-(void)setImageName:(NSString *)imageName
{
    if (_imageName != imageName) {
        [_imageName release];
        _imageName = [imageName copy];
    }
    [self loadThemeImage];
}

-(void)setHighlightImageName:(NSString *)highlightImageName
{
    if (_highlightImageName !=highlightImageName) {
        [_highlightImageName release];
        _highlightImageName = [highlightImageName copy];
    }
    [self loadThemeImage];
}


-(void)setBackgroundImageName:(NSString *)backgroundImageName
{
    if (_backgroundImageName !=backgroundImageName) {
        [_backgroundImageName release];
        _backgroundImageName = backgroundImageName;
    }
    [self loadThemeImage];
}

-(void)setBackgroundHighlightImageName:(NSString *)backgroundHighlightImageName
{
    if (_backgroundHighlightImageName !=backgroundHighlightImageName) {
        [_backgroundHighlightImageName release];
        _backgroundHighlightImageName = backgroundHighlightImageName;
    }
    [self loadThemeImage];
}

@end
