//
//  MoreViewController.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-8.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "MoreViewController.h"
#import "ThemeViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"更多";
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

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}

#pragma mark - uitablevie delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"count == numberOfRowsInSection");
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        NSLog(@"initCellView == cellForRowAtIndexPath==%d",indexPath.row);
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (indexPath.row == 0) {
         NSLog(@"initCellView =11111= cellForRowAtIndexPath==%d",indexPath.row);
        cell.textLabel.text = @"设置主题";
    }    
    return cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
      NSLog(@"select == didDeselectRowAtIndexPath==%d",indexPath.row);
    if (indexPath.row == 0) {
           NSLog(@"select =11111= didDeselectRowAtIndexPath==%d",indexPath.row);
        ThemeViewController *themeCtrl = [[ThemeViewController alloc] init];
        [self.navigationController  pushViewController:themeCtrl animated:YES];
        [themeCtrl release]; 
    }
}

@end
