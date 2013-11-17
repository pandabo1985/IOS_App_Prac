//
//  MainViewController.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-8.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "MainViewController.h"

#import "HomeViewController.h"
#import "MessageViewController.h"
#import "ProfileViewController.h"
#import "DiscoverViewController.h"
#import "MoreViewController.h"
#import "BaseNavigationController.h"
#import "ThemeButton.h"
#import "UIFactory.h"
#import "SinaWeibo.h"
#import "AppDelegate.h"



@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //隐藏系统tabBar
        [self.tabBar setHidden:YES];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _initViewController];
    [self _initTabbarView];
    
    //每隔60秒钟请求最新数据接口
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showBage:(BOOL)show{
    _bageView.hidden = !show;
}
#pragma mark -UI
//初始化控制器
-(void)_initViewController{
    
    HomeViewController *home =[[[HomeViewController alloc] init] autorelease];
    MessageViewController *message = [[[MessageViewController alloc] init] autorelease];
    ProfileViewController *profile = [[[ProfileViewController alloc] init] autorelease];
    DiscoverViewController *discover = [[[DiscoverViewController alloc] init] autorelease];
    MoreViewController *more = [[[MoreViewController alloc] init] autorelease];
    
    NSArray *views = @[home,message,profile,discover,more];
    NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:5];
    for (UIViewController *viewController in views) {
        BaseNavigationController *nav = [[BaseNavigationController alloc]  initWithRootViewController:viewController];
        [viewControllers addObject:nav];
        [nav release];
    }
    self.viewControllers = viewControllers;
}

-(void)_initTabbarView{
    _tabbarView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight-49 -20, ScreenWith, 49)];
//    _tabbarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background.png"]];
    [self.view addSubview:_tabbarView];
   
    UIImageView *tabbarGroundImage = [UIFactory createImageView:@"tabbar_background.png"];
    tabbarGroundImage.frame = _tabbarView.bounds;
    [_tabbarView addSubview:tabbarGroundImage];
    
    NSArray *background = @[@"tabbar_home.png",@"tabbar_message_center.png",@"tabbar_profile.png",@"tabbar_discover.png",@"tabbar_more.png"];
    NSArray *heightBackground = @[@"tabbar_home_highlighted.png",@"tabbar_message_center_highlighted.png",@"tabbar_profile_highlighted.png",@"tabbar_discover_highlighted",@"tabbar_more_highlighted.png"];
    for (int i = 0; i < background.count; i++) {
        NSString *backImage = background[i];
        NSString *heightImage = heightBackground[i];
        
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        ThemeButton *button = [[ThemeButton alloc] initWithImage:backImage highlighteImageName:heightImage];
        UIButton *button = [UIFactory createButton:backImage highlighted:heightImage];
        button.frame = CGRectMake((ScreenWith/5-30)/2+(i*ScreenWith/5),(49-30)/2, 30, 30);
        button.tag = i;
//        [button setImage:[UIImage imageNamed:backImage] forState:UIControlStateNormal];
//        [button setImage:[UIImage imageNamed:heightImage] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        [_tabbarView addSubview:button];
    }
    
    _sliderView = [[UIFactory createImageView:@"tabbar_slider.png"] retain];
    _sliderView.backgroundColor = [UIColor clearColor];
    _sliderView.frame = CGRectMake((64 - 15)/2, 5, 15, 44);
    [_tabbarView addSubview:_sliderView];
}

-(void) refreshUnReadView:(NSDictionary *)result{
    //新微博未读数
    NSNumber *status = [result objectForKey:@"status"];
    if (_bageView == nil) {
        _bageView = [UIFactory createImageView:@"main_badge.png"];
        _bageView.frame = CGRectMake(64 - 25, 5, 20, 20);
        [_tabbarView addSubview:_bageView];
        UILabel *badgeLabel = [[UILabel alloc] initWithFrame:_bageView.bounds];
        badgeLabel.textAlignment = NSTextAlignmentCenter;
        badgeLabel.backgroundColor = [UIColor clearColor];

        badgeLabel.font = [UIFont boldSystemFontOfSize:13.0f];
        badgeLabel.textColor = [UIColor purpleColor];
        badgeLabel.tag = 100;
        [_bageView addSubview:badgeLabel];
        [badgeLabel release];
    }
    
    int n = [status intValue];
    if (n>0) {
          UILabel *bageLabel = (UILabel *)[_bageView viewWithTag:100];
        if (n>99) {
            n = 99;
        }
        bageLabel.text = [NSString stringWithFormat:@"%d",n];
        _bageView.hidden = NO;
    }else{
        _bageView.hidden =YES;
    }
  
    
    
}
#pragma mark -loaddata
-(void)loadUnReadData{
    AppDelegate *appDelgate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    SinaWeibo *sinaWeibo = appDelgate.sinaweibo;
    [sinaWeibo requestWithURL:@"remind/unread_count.json" params:nil httpMethod:@"GET" block:^(id reulst){
      
        [self refreshUnReadView:reulst];
    }];
}



#pragma mark -action
-(void)selectedTab:(UIButton *)button
{
  
    float x = button.left + (button.width-_sliderView.width)/2;
    [UIView animateWithDuration:0.2 animations:^{
        _sliderView.left = x;
    }];
    
    //是否是重复点击tab按钮
    if (button.tag == self.selectedIndex && button.tag == 0) {
        UINavigationController *homeNav = [self.viewControllers objectAtIndex:0];
        HomeViewController *homeCtrl = [homeNav.viewControllers objectAtIndex:0];
        [homeCtrl refreshWeibo];
    }
    
      self.selectedIndex = button.tag;
}

-(void)timerAction:(NSTimer *) timer{
    [self loadUnReadData];
}
#pragma mark -sinaWeibo delegate
- (void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo
{
    //保存认证数据到本地
    NSDictionary *authData = [NSDictionary dictionaryWithObjectsAndKeys:
                              sinaweibo.accessToken, @"AccessTokenKey",
                              sinaweibo.expirationDate, @"ExpirationDateKey",
                              sinaweibo.userID, @"UserIDKey",
                              sinaweibo.refreshToken, @"refresh_token", nil];
    [[NSUserDefaults standardUserDefaults] setObject:authData forKey:@"SinaWeiboAuthData"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}



- (void)sinaweiboDidLogOut:(SinaWeibo *)sinaweibo
{
    //移除renzhengxinxi
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"SinaWeiboAuthData"];
}
- (void)sinaweiboLogInDidCancel:(SinaWeibo *)sinaweibo
{
    
}
- (void)sinaweibo:(SinaWeibo *)sinaweibo logInDidFailWithError:(NSError *)error
{
    
}
- (void)sinaweibo:(SinaWeibo *)sinaweibo accessTokenInvalidOrExpired:(NSError *)error
{
    
}

@end
