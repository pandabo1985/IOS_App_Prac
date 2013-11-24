//
//  DetailViewController.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-11-18.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "DetailViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+WebCache.h"
#import "WeiboModel.h"
#import "WeiboView.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    [self _initView];
    
}

-(void)_initView
{
    UIView *talbleHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWith, 0)];
    talbleHeadView.backgroundColor = [UIColor clearColor];
    //用户栏试图
    [talbleHeadView addSubview:self.userBarView];
    
    NSString *userImageUrl =  _weiboModel.user.profile_image_url;
    self.userImageView.layer.cornerRadius = 5;
    self.userImageView.layer.masksToBounds = YES;
    [self.userImageView setImageWithURL:[NSURL URLWithString:userImageUrl]];
    self.nickLabel.text = _weiboModel.user.screen_name;
    talbleHeadView.height  += 60;
    
    //-----------创建微博视图--------
    float h = [WeiboView getWeiboViewHeight:self.weiboModel isRepost:NO isDetai:YES];
    _weiboView = [[WeiboView alloc] initWithFrame:CGRectMake(10, _userBarView.bottom+10, ScreenWith-20, h)];
    _weiboView.isDetail = YES;
    _weiboView.weiboModel = _weiboModel;
    [talbleHeadView addSubview:_weiboView];
    [_weiboView release];
    talbleHeadView.height +=(h+10);
    
    self.tableView.tableHeaderView = talbleHeadView;
    [talbleHeadView release];
   
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark -UITableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    return cell;
}

- (void)dealloc {
    [_tableView release];
    [_userImageView release];
    [_nickLabel release];
    [_userBarView release];
    [super dealloc];
}
@end
