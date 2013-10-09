//
//  EGORefreshTableHeaderView.m
//  Oschina_Prac
//
//  Created by pan dabo on 13-10-2.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "EGORefreshTableHeaderView.h"

#define TEXT_COLOR [UIColor colorWithRed:87.0/255.0 green:108.0/255.0 blue:137.0/255 alpha:1.0]
#define FLIP_ANIMATION_DURATION 0.18f

@interface EGORefreshTableHeaderView (Private)
-(void)setState:(EGOPullRefreshState) aState;
@end


@implementation EGORefreshTableHeaderView

-(id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame arrowImageName:@"blueArrow.png" textColor:TEXT_COLOR];

}

-(id)initWithFrame:(CGRect)frame arrowImageName:(NSString *)arrow textColor:(UIColor *)textColor
{
    if (self == [super initWithFrame:frame]) {
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
     	self.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:231.0/255.0 blue:237.0/255.0 alpha:1.0];
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0.0f,frame.size.height - 30.0, self.frame.size.width, 20.0)];
        lable.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        lable.font = [UIFont systemFontOfSize:12.0f];
        lable.textColor = textColor;
        lable.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0f];
        lable.backgroundColor = [UIColor clearColor];
        lable.textAlignment = UITextAlignmentCenter;
        [self addSubview:lable];
        _lastUpdateLabel = lable;
        [lable release];
        
        lable = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, frame.size.height - 48.0f, self.frame.size.width,20.0f)];
        lable.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        lable.font = [UIFont boldSystemFontOfSize:13.0f];
        lable.textColor = textColor;
        lable.shadowColor = [UIColor colorWithWhite:0.9f alpha:1.0];
        lable.shadowOffset = CGSizeMake(0.0f, 1.0f);
        lable.backgroundColor = [UIColor clearColor];
        lable.textAlignment = UITextAlignmentCenter;
        [self addSubview:lable];
        _statusLabel = lable;
        [lable release];
        
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(25.0f, frame.size.height - 65, 30.0, 55.0f);
        layer.contentsGravity = kCAGravityResizeAspect;
        layer.contents = (id)[UIImage imageNamed:arrow].CGImage;
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
        if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
            layer.contentsScale = [[UIScreen mainScreen] scale];
        
        }
        
#endif
        [[self layer] addSublayer:layer];
        _arrowImage = layer;
        
        UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        view.frame = CGRectMake(25.0, frame.size.height - 38.0f, 20.0f, 20.0f);
        [self addSubview:view];
        _activityView = view;
        [view release];
        [self setState:EGOPullRefreshNormal];
    }
    
    return self;
}

#pragma mark -
#pragma  mark Setters
-(void)refreshLastUpdatedDate
{
   
}
-(void)egoRefreshScrollViewDidScroll:(UIScrollView *)scrollView
{
    
}
-(void)egoRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView
{
    
}
-(void)egoRefreshScrollViewDateSourceDidFinishedLoading:(UIScrollView *)scrollView
{
    
}


@end