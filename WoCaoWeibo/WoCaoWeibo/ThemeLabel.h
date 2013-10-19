//
//  ThemeLabel.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-17.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeLabel : UILabel

@property(nonatomic,copy)NSString *colorName;



-(id)initWithColorName:(NSString *)colorName;


@end
