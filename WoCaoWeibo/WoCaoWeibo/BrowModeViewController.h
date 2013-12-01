//
//  BrowModeViewController.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-12-1.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "BaseViewController.h"

@interface BrowModeViewController : BaseViewController<UITableViewDataSource, UITableViewDelegate>{
    NSArray *browPic;
}
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end
