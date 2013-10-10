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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//初始化控制器
-(void)_initViewController{
    
    HomeViewController *home =[[HomeViewController alloc] init];
    MessageViewController *message = [[MessageViewController alloc] init];
    ProfileViewController *profile = [[ProfileViewController alloc] init];
    DiscoverViewController *discover = [[DiscoverViewController alloc] init];
    MoreViewController *more = [[MoreViewController alloc] init];
    
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
    _tabbarView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background.png"]];
    [self.view addSubview:_tabbarView];
    
    NSArray *background = @[@"tabbar_home.png",@"tabbar_message_center.png",@"tabbar_profile.png",@"tabbar_discover.png",@"tabbar_more.png"];
    NSArray *heightBackground = @[@"tabbar_home_highlighted.png",@"tabbar_message_center_highlighted.png",@"tabbar_profile_highlighted.png",@"tabbar_discover_highlighted",@"tabbar_more_highlighted.png"];
    for (int i = 0; i < background.count; i++) {
        NSString *backImage = background[i];
        NSString *heightImage = heightBackground[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((ScreenWith/5-30)/2+(i*ScreenWith/5),(49-30)/2, 30, 30);
        button.tag = i;
        [button setImage:[UIImage imageNamed:backImage] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:heightImage] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(selectedTab:) forControlEvents:UIControlEventTouchUpInside];
        [_tabbarView addSubview:button];
    }
}

-(void)selectedTab:(UIButton *)button
{
    self.selectedIndex = button.tag;
}

#pragma mark -sinaWeibo delegate
- (void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo
{
    NSLog(@"sinaweiboDidLogIn");
}
- (void)sinaweiboDidLogOut:(SinaWeibo *)sinaweibo
{
    
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
