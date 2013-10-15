//
//  ThemeButton.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-13.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeButton : UIButton

@property(nonatomic,copy)NSString *imageName;
@property(nonatomic,copy)NSString *highlightImageName;

@property(nonatomic,copy)NSString *backgroundImageName;
@property(nonatomic,copy)NSString *backgroundHighlightImageName;

-(id)initWithImage:(NSString *)imageName highlighteImageName:(NSString *)highlighteImageName;

-(id)initWithBackground:(NSString *)BackgroundImageName
highlighteBackgroundImageName:(NSString *)BackgroundHighlighteImageName;


@end
