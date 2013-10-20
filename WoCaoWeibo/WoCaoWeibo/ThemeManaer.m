//
//  ThemeManaer.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-13.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "ThemeManaer.h"


static ThemeManaer *singleton = nil;

@implementation ThemeManaer


@synthesize themesPlist;

+(ThemeManaer *)shareInstance
{
    if (singleton == nil) {
        @synchronized(self){
            singleton = [[ThemeManaer alloc] init];
        }
    }
    
    return singleton;
}
-(id)init{
    self = [super init];
    if (self) {
        NSString *themePath = [[NSBundle mainBundle] pathForResource:@"theme" ofType:@"plist"];
        self.themesPlist = [NSDictionary dictionaryWithContentsOfFile:themePath];
        
        self.themeName = nil;
    }
    return self;
}

-(NSString *)getThemePath{
    if (self.themeName == nil) {
        NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
        return resourcePath;
    }
    //get theme path
    NSString *themePaht = [self.themesPlist objectForKey:self.themeName];
    //get app packege roo path
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    //完整的路径
    NSString *path = [resourcePath stringByAppendingPathComponent:themePaht];
    return path;
    
}

-(UIImage *)getThemeImage:(NSString *)imageName
{
    if (imageName.length == 0) {
        return nil;
    }
    NSString *themePath = [self getThemePath];
    NSString *imagePath = [themePath stringByAppendingPathComponent:imageName];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    return image;
}


-(UIColor *)getColorWithName:(NSString *)name
{
    if (name.length == 0) {
        return nil;
    }
   NSString *rgb = [self.fontColorPlist objectForKey:name];
        NSArray *rgbs = [rgb componentsSeparatedByString:@","];
    if (rgbs.count == 3) {
        float r = [rgbs[0]floatValue];
        float g = [rgbs[1]floatValue];
        float b = [rgbs[2]floatValue];
        UIColor *color = Color(r, g, b, 1);
        return color;
    }
    return nil;
}

//切换主题时，会调用此方法设置主题名称
-(void)setThemeName:(NSString *)themeName{
    
    if (_themeName !=themeName) {
        [_themeName release];
        _themeName = [themeName copy];
    }
    
    NSString *themeDir = [self getThemePath];
    NSString *filePath = [themeDir stringByAppendingPathComponent:@"fontColor.plist"];
    self.fontColorPlist = [NSDictionary dictionaryWithContentsOfFile:filePath];
                          
    
}

#pragma mark -singleton setting
+(id)allocWithZone:(NSZone *)zone
{
    @synchronized(self){
        if (singleton == nil) {
            singleton = [super allocWithZone:zone];
        }
    }
    return singleton;
}

+(id)copyWithZone:(NSZone *)zone{
    return self;
}

-(id)retain{
    return self;
}

-(unsigned)retainCount{
    return UINT_MAX;
}

-(oneway void)release{
    
}
-(id)autorelease{
    return self;
}


@end
