//
//  ThemeViewController.h
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-13.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "BaseViewController.h"

@interface ThemeViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *themes;
}
@property (retain, nonatomic) IBOutlet UITableView *tableView;

@end
