//
//  BaseViewController.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-8.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
#import "UIFactory.h"
#import "MBProgressHUD.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.isBackButton = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *viewContollers = self.navigationController.viewControllers;
    if (viewContollers.count > 1 && self.isBackButton) {
        
        UIButton *button = [UIFactory createButton:@"navigationbar_back.png" highlighted:@"navigationbar_back_highlighted.png"];
        button.showsTouchWhenHighlighted = YES;
        button.frame = CGRectMake(0, 0, 24, 24);
        [button addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = [backItem autorelease];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)backAction
{
    NSLog(@"backAction====");
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (SinaWeibo *)sinaweibo
{
    AppDelegate *appDelgate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    SinaWeibo *sinaWeibo = appDelgate.sinaweibo;
    return sinaWeibo;
}

//override
-(void)setTitle:(NSString *)title
{
    [super setTitle:title];
    
    
    //    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectZero];
    //    titleLable.textColor = [UIColor blackColor];
    UILabel *titleLable = [UIFactory createLable:kNavigationBarTitleLale];
    titleLable.font = [UIFont boldSystemFontOfSize:18.0f];
    titleLable.backgroundColor = [UIColor clearColor];
    titleLable.text = title;
    [titleLable sizeToFit];
    //  self.navigationItem.titleView = [titleLable autorelease]; //popViewControllerAnimated exc_bad_access
    self.navigationItem.titleView = titleLable;
}

-(void)showLoanding:(BOOL)show{
    if (_loadView == nil) {
        _loadView = [[UIView alloc]initWithFrame:CGRectMake(0, ScreenHeight/2 - 80, ScreenWith, 20)];
        
        UIActivityIndicatorView *activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [activityView startAnimating];
        UILabel *loadLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        loadLabel.backgroundColor = [UIColor clearColor];
        loadLabel.text = @"正在加载中...";
        loadLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        loadLabel.textColor = [UIColor blackColor];
        [loadLabel sizeToFit];
        
        loadLabel.left = (320 - loadLabel.width)/2;
        activityView.right = loadLabel.left - 5;
        [_loadView addSubview:loadLabel];
        [_loadView addSubview:activityView];
        [activityView release];
        
    }
    
    if (show) {
        if (![_loadView superview]) {
            [self.view addSubview:_loadView];
            
        }     }else{
            [_loadView removeFromSuperview];
        }
    
}

-(void)showHUD{
    self.hub =[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hub.dimBackground = YES;
}

-(void)hideHUD{
    [self.hub hide:YES];
}

-(void)showHUD:(NSString *)title isDim:(BOOL)isDim{
    self.hub = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    self.hub.dimBackground = isDim;
    self.hub.labelText = title;
}

-(void)showHUDComplete:(NSString *)title{
    self.hub.customView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark"]] autorelease];
    self.hub.mode = MBProgressHUDModeCustomView;
    if (title.length > 0) {
        self.hub.labelText = title;
    }
    [self.hub hide:YES afterDelay:1];
}


-(AppDelegate *)appDelegate{
      AppDelegate *appDelgate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return appDelgate;
}
@end
