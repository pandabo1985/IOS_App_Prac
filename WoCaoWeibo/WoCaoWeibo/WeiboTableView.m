//
//  WeiboTableView.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-11-16.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "WeiboTableView.h"
#import "WeiboCell.h"
#import "WeiboView.h"


@implementation WeiboTableView

-(id)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self !=nil) {
       
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


#pragma mark -UITableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"weiboCell";
    WeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[[WeiboCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify]autorelease];
    }
    WeiboModel *weibo = [self.data objectAtIndex:indexPath.row];
    cell.weiboModel = weibo;
    return cell;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeiboModel *weibo = [self.data objectAtIndex:indexPath.row];
    float height = [WeiboView getWeiboViewHeight:weibo isRepost:NO isDetai:NO];
    height += 60;
    return height;
}

@end
