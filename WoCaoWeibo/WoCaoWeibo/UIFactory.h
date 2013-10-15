//
//  UIFactory.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-13.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThemeButton.h"
#import "ThemeImageView.h"

@interface UIFactory : NSObject

+(ThemeButton *)createButton:(NSString *)imageName highlighted:(NSString *)highlightedName;
+(ThemeButton *)createButtonWithBackground:(NSString *)backgroundImageName backgroundHighlighted:(NSString *)backgroundHighlightedName;

+(ThemeImageView *)createImageView:(NSString *)imageName;

@end
