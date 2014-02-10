//
//  RCLeftMenuC.h
//  RubyChina
//
//  Created by pan dabo on 14-2-10.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    LeftMenuType_Home=0,
    LeftMenuType_ForumNodes,
    LeftMenuType_CoolSites,
    LeftMenuType_TopMembers,
    LeftMenuType_MyHomePage,
    LeftMenuType_Wiki,
    LeftMenuType_More
}LeftMenuType;

@protocol RCLeftMenuDelegate;

@interface RCLeftMenuC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(assign,nonatomic)id<RCLeftMenuDelegate> delegate;

-(id)initWithStyle:(UITableViewStyle)style;
-(void)setSelectedMenuType:(LeftMenuType)type;

@end

@protocol RCLeftMenuDelegate <NSObject>

-(void)didSelectLeftMenuType:(LeftMenuType)type;

@end
