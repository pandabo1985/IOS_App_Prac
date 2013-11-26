//
//  HomeViewController.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-8.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "HomeViewController.h"
#import "WeiboModel.h"
#import "UIFactory.h"
#import <AudioToolbox/AudioToolbox.h>
#import "MainViewController.h"
#import "DetailViewController.h"


@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"微博";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *bindItem = [[UIBarButtonItem alloc] initWithTitle:@"绑定账号" style:UIBarButtonItemStyleBordered target:self action:@selector(bindAction:)];
    self.navigationItem.rightBarButtonItem =[bindItem autorelease];
   
    UIBarButtonItem *logoutItem = [[UIBarButtonItem alloc] initWithTitle:@"注销账号" style:UIBarButtonItemStyleBordered target:self action:@selector(logoutAction:)];
    self.navigationItem.leftBarButtonItem =[logoutItem autorelease];
   
    _tableView = [[WeiboTableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWith, ScreenHeight-20-49-44)style:UITableViewStylePlain];
    _tableView.eventDelegate = self;
    _tableView.hidden = YES;
    [self.view addSubview:_tableView];
    //判断是否验证
    if (self.sinaweibo.isAuthValid) {
        
        [self loadWeiboData];
    }
    
}

//新微博的数量
-(void)showNewWeiboCount:(int)count{
    if (barView == nil) {
        barView = [[UIFactory createImageView:@"timeline_new_status_background.png"] retain];
        UIImage *image = [barView.image stretchableImageWithLeftCapWidth:5 topCapHeight:5];
        barView.image = image;
        barView.leftCapWith = 5;
        barView.topCapHeight = 5;
        barView.frame = CGRectMake(5, -40, ScreenWith-10, 40);
        
        [self.view addSubview:barView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.tag = 2013;
        label.font = [UIFont systemFontOfSize:16.0f];
        label.textColor = [UIColor whiteColor];
        label.backgroundColor = [UIColor clearColor];
        [barView addSubview:label];
        [label release];
    }
    if (count >0) {
        UILabel *label = (UILabel *)[barView viewWithTag:2013];
        label.text = [NSString stringWithFormat:@"%d条新微博",count];
        [label sizeToFit];
        label.origin = CGPointMake((barView.width - label.width)/20, (barView.height - label.height)/2);
        
        [UIView animateWithDuration:0.6 animations:^{
            barView.top = 5;
        } completion:^(BOOL finish){
            if (finish) {
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:0.6];
                barView.top = -40;
                
            }
        }];
        
        NSString *filePaht = [[NSBundle mainBundle] pathForResource:@"msgcome" ofType:@"wav"];
        NSURL *url = [NSURL fileURLWithPath:filePaht];
        
        SystemSoundID soundID;
        AudioServicesCreateSystemSoundID((CFURLRef)url, &soundID);
        AudioServicesPlaySystemSound(soundID);
        
    }
    //隐藏未读数目
   MainViewController *mainCtrl = (MainViewController *) self.tabBarController;
    [mainCtrl showBage:NO];
}
  

#pragma mark -load data
-(void)loadWeiboData
{
    [super showLoanding:YES];
//    [super showHUD:@"正在加载。。。" isDim:NO];
    [super showHUD];
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:@"10" forKey:@"count"];
    [self.sinaweibo requestWithURL:@"statuses/home_timeline.json" params:params httpMethod:@"GET" delegate:self];
}
//上拉加载最新微博
-(void)pullUpData{
    if (self.topWeiBoID.length == 0) {
        NSLog(@"微博id为空");
        return;
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"20", @"count",self.lastWeBoID,@"max_id",nil];
    [self.sinaweibo requestWithURL:@"statuses/home_timeline.json" params:params httpMethod:@"GET" block:^(id resut){
        [self pullUpFinishData:resut];
    }];
}

//下拉加载最新微博
-(void)pullDownData{
    if (self.lastWeBoID.length == 0) {
        NSLog(@"微博id为空");
        return;
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"20", @"count",self.topWeiBoID,@"since_id",nil];
    [self.sinaweibo requestWithURL:@"statuses/home_timeline.json" params:params httpMethod:@"GET" block:^(id resut){
        [self pullDownFinishData:resut];
    }];
}

-(void)pullUpFinishData:(id) result{
    
    NSArray *statues = [result objectForKey:@"statuses"];
    NSMutableArray *weibosnew = [NSMutableArray arrayWithCapacity:statues.count];
    for (NSDictionary *statuesDic in statues) {
        WeiboModel *weibo = [[WeiboModel alloc] initWithDataDic:statuesDic];
        [weibosnew addObject:weibo];
        [weibo release];
    }
    
    if (weibosnew.count > 0) {
        WeiboModel *topWeiBo = [weibosnew lastObject];
        self.lastWeBoID = [topWeiBo.weiboId  stringValue];
    }
    [self.weibos addObjectsFromArray:weibosnew];
    //刷新UI
    self.tableView.data = self.weibos;
    [self.tableView reloadData];
}


-(void)pullDownFinishData:(id) result{

    NSArray *statues = [result objectForKey:@"statuses"];
    NSMutableArray *weibosnew = [NSMutableArray arrayWithCapacity:statues.count];
    for (NSDictionary *statuesDic in statues) {
        WeiboModel *weibo = [[WeiboModel alloc] initWithDataDic:statuesDic];
        [weibosnew addObject:weibo];
        [weibo release];
    }
    
    if (weibosnew.count > 0) {
        WeiboModel *topWeiBo = [weibosnew objectAtIndex:0];
        self.topWeiBoID = [topWeiBo.weiboId  stringValue];
    }
    
    [weibosnew addObjectsFromArray:self.weibos];
    self.weibos = weibosnew;
    self.tableView.data = weibosnew;
    //刷新UI
    [self.tableView reloadData];
    //弹回下拉
    [self.tableView doneLoadingTableViewData];
    //显示更新的数目
    int updateCount = [statues count];
    [self showNewWeiboCount:updateCount];
    NSLog(@"下拉更新条数： %d",updateCount);
}

-(void)refreshWeibo{
    //ui下拉
    [self.tableView refreshData];
    //取得数据
    [self pullDownData];
}

#pragma mark -SinaWeiboRequestDelegate
- (void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"网络加载失败：%@",error);
}
//网络加载完成
- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result
{
    //隐藏加载提示
//    [super performSelector:@selector(showHUDComplete:) withObject:@"发布成功" afterDelay:10];
//    [super showHUDComplete:@"加载完成"];
    [super showLoanding:NO];
    [super hideHUD];
    self.tableView.hidden = NO;
//    NSLog(@"%@",request);
  NSArray *statues = [result objectForKey:@"statuses"];
    NSMutableArray *weibos = [NSMutableArray arrayWithCapacity:statues.count];
    for (NSDictionary *statuesDic in statues) {
        WeiboModel *weibo = [[WeiboModel alloc] initWithDataDic:statuesDic];
        [weibos addObject:weibo];
        [weibo release];
    }
//    NSLog(@"---%@",weibos);
    self.tableView.data = weibos;
    self.weibos = weibos;
    
    //保存第一个微博ID
    if (weibos.count>0) {
        WeiboModel *topWeiBo = [weibos objectAtIndex:0];
        self.topWeiBoID = [topWeiBo.weiboId stringValue];
        WeiboModel *lastWeiBo = [weibos lastObject];
                     
        self.lastWeBoID =[lastWeiBo.weiboId stringValue];
    }
    
    [self.tableView reloadData];
    
}

#pragma mark UITableViewEventDelegate
//下拉
-(void)pullDown:(BaseTableView *)tableView{
    NSLog(@"请求网络数据：");
    [self pullDownData];
//    [tableView performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3];
}

//上拉
-(void)pullUp:(BaseTableView *)tableView
{
    [self pullUpData];
}
//选中一个cell
-(void)tableView:(BaseTableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选中 cell:");
    WeiboModel *weibo = [self.weibos objectAtIndex:indexPath.row];
    DetailViewController *detail = [[DetailViewController alloc]init];
    detail.weiboModel = weibo;
    [weibo release];
    [self.navigationController pushViewController:detail animated:YES];
    [detail release];
    
    
}

#pragma mark -action
-(void)bindAction:(UIBarButtonItem *)buttonItem
{
    [self.sinaweibo logIn];
}

-(void)logoutAction:(UIBarButtonItem *)buttonItem
{
    [self.sinaweibo logOut];
}

#pragma mark -memory manager
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)dealloc
{
    [super dealloc];
    [_tableView release];
    _tableView = nil;
    [barView release];
    barView = nil;
}
@end
