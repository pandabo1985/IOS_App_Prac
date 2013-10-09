//
//  TweetBase.h
//  Oschina_Prac
//
//  Created by pan dabo on 13-9-21.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterView.h"

@interface TweetBase : UIViewController<UIActionSheetDelegate>

@property(nonatomic, strong) UISegmentedControl *segment_title;

@property(nonatomic, strong) TwitterView *twitterView;

-(NSString *)getSegmentTitle;
-(void)myInit;

@end
