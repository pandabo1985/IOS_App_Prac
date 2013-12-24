//
//  UserViewController.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-12-15.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "UserViewController.h"
#import "UserInfoView.h"
#import "UserModel.h"
#import "UIFactory.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
           }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"个人资料";
    UserInfoView *userInfo = [[[UserInfoView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)] autorelease];
    self.tableView.tableHeaderView = userInfo;

    UIButton *homeButton = [UIFactory createButton:@"tabbar_home.png" highlighted:@"tabbar_home_highlighted.png"];
    homeButton.frame = CGRectMake(0, 0, 34, 27);
    [homeButton addTarget:self action:@selector(goHome) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *homeItem = [[UIBarButtonItem alloc] initWithCustomView:homeButton];
    self.navigationItem.rightBarButtonItem = [homeItem autorelease];
    [self loadUserData];
  
}

#pragma mark -data
-(void)loadUserData{
    if (self.userName.length == 0) {
        NSLog(@"error:用户为空!");
        return;
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:self.userName forKey:@"screen_name"];
    [self.sinaweibo requestWithURL:@"users/show.json" params:params httpMethod:@"GET" block:^(id result){
        [self loadUserDataFinish:result];
    }];
}

#pragma mark -action
-(void)goHome{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)loadUserDataFinish:(NSDictionary *)result{
    UserModel *userModel = [[UserModel alloc] initWithDataDic:result];
    self.userInfo.userModel = userModel;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
