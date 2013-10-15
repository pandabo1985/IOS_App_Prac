//
//  UIFactory.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-13.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "UIFactory.h"

@implementation UIFactory

+(ThemeButton *)createButton:(NSString *)imageName highlighted:(NSString *)highlightedName
{
    ThemeButton *button = [[ThemeButton alloc] initWithBackground:imageName highlighteBackgroundImageName:highlightedName];
    return [button autorelease];
}
+(ThemeButton *)createButtonWithBackground:(NSString *)backgroundImageName backgroundHighlighted:(NSString *)backgroundHighlightedName
{
    ThemeButton *button = [[ThemeButton alloc] initWithBackground:backgroundImageName highlighteBackgroundImageName:backgroundHighlightedName];
    return [button autorelease];
}

@end
