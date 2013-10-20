//
//  ThemeLabel.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-17.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "ThemeLabel.h"
#import "ThemeManaer.h"

@implementation ThemeLabel


- (void)dealloc {
    [super dealloc];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_colorName release];
}

-(id)init
{
    self = [super init];
    if (self !=nil) {
        NSLog(@"%@",self);
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
    }
    return self;
}

-(id)initWithColorName:(NSString *)colorName
{
    self = [self init];
    if (self !=nil) {
        self.colorName = colorName;
    }
    return self;
}

-(void)setColorName:(NSString *)colorName
{
    if (_colorName !=colorName) {
        [_colorName release];
        _colorName = [colorName copy];
    }
    [self setColor];
}

-(void)setColor
{
    NSLog(@"setColor == %@",_colorName);
    UIColor *textColor = [[ThemeManaer shareInstance] getColorWithName:_colorName];
    NSLog(@"%@",textColor);
    self.textColor = textColor;
}

#pragma mark -notification actions
-(void)themeNotification:(NSNotification *)notification
{
    [self setColor];
}


@end
