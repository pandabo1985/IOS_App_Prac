//
//  MacroDefines.h
//  RubyChina
//
//  Created by pan dabo on 14-2-11.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//
/**
 * Creates an opaque UIColor object from a byte-value color definition.
 */
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

/////////////////////////////////////////////////////////////////////////////////////////////////////

// APP 基本信息

#define FORUM_BASE_API_TYPE [RCGlobalConfig forumBaseAPIType]

// Color配色
#define TABLE_VIEW_BG_COLOR RGBCOLOR(237, 234, 234)
#define APP_THEME_COLOR RGBCOLOR(41, 41, 41)



// 左侧菜单栏可视宽度比
#define LEFT_GAP_PERCENTAGE 0.55f