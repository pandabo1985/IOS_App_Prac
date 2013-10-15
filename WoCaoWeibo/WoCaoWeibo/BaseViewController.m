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
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLable.textColor = [UIColor blackColor];
    titleLable.font = [UIFont boldSystemFontOfSize:18.0f];
    titleLable.backgroundColor = [UIColor clearColor];
    titleLable.text = title;
    [titleLable sizeToFit];
  self.navigationItem.titleView = [titleLable autorelease];
    
}


@end
