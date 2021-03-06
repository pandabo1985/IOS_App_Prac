//
//  BrowModeViewController.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-12-1.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "BrowModeViewController.h"
#import "UIFactory.h"

@interface BrowModeViewController ()

@end

@implementation BrowModeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        browPic = [[NSArray alloc] initWithObjects:@"大图模式",@"小图模式", nil];
        NSLog(@"browPic.count == %d",browPic.count);
        self.title = @"图片浏览设置";
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- UITableDateSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return browPic.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify = @"browPic";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify]autorelease];
        UILabel *textLabel = [UIFactory createLable:kNavigationBarTitleLale];
          textLabel.frame = CGRectMake(10, 10, 200, 30);
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        textLabel.tag = 101;
        [cell.contentView addSubview:textLabel];
    }
    
    UILabel *textLabel = (UILabel *)[cell.contentView viewWithTag:101];
    NSString *name = browPic[indexPath.row];
    textLabel.text = name;
    return  cell;
}

#pragma mark- UITableDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int mode = -1;
    if (indexPath.row == 0) {
        mode = LargeBrowMode;
    }else if(indexPath.row ==1){
        mode = SmallBrowMode;
    }
    
    [[NSUserDefaults standardUserDefaults] setInteger:mode forKey:kBrowMode];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kReloadWeboTableNotification object:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
