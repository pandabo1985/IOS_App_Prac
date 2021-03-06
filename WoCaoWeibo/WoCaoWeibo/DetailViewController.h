//
//  DetailViewController.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-11-18.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "BaseViewController.h"
#import "CommentTableView.h"


@class WeiboModel;
@class WeiboView;



@interface DetailViewController
: BaseViewController<UITableViewEventDelegate>{
    WeiboView *_weiboView;
}

@property(nonatomic,retain)WeiboModel *weiboModel;
@property (retain, nonatomic) IBOutlet CommentTableView *tableView;
@property (retain, nonatomic) IBOutlet UIImageView *userImageView;
@property (retain, nonatomic) IBOutlet UILabel *nickLabel;
@property (retain, nonatomic) IBOutlet UIView *userBarView;

@end
