//
//  HomeViewController.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-8.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "HomeViewController.h"
#import "WeiboModel.h"


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
    [self.view addSubview:_tableView];
    //判断是否验证
    if (self.sinaweibo.isAuthValid) {
        [self loadWeiboData];
    }
    
}



#pragma mark -load data
-(void)loadWeiboData
{
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObject:@"10" forKey:@"count"];
    [self.sinaweibo requestWithURL:@"statuses/home_timeline.json" params:params httpMethod:@"GET" delegate:self];
}
//下拉加载最新微博
-(void)pullDownData{
    if (self.topWeiBoID.length == 0) {
        NSLog(@"微博id为空");
        return;
    }
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"20", @"count",self.topWeiBoID,@"since_id",nil];
    [self.sinaweibo requestWithURL:@"statuses/home_timeline.json" params:params httpMethod:@"GET" block:^(id resut){
        [self pullDownFinishData:resut];
    }];
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
    NSLog(@"下拉更新条数： %d",updateCount);
}

#pragma mark -SinaWeiboRequestDelegate
- (void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"网络加载失败：%@",error);
}
//网络加载完成
- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result
{
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
    
}
//选中一个cell
-(void)tableView:(BaseTableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选中 cell:");
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
}
@end
