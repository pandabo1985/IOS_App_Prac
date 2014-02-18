//
//  RCLeftMenuC.m
//  RubyChina
//
//  Created by pan dabo on 14-2-10.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "RCLeftMenuC.h"
#import "UIViewAdditions.h"
#import "RCForumTopicsC.h"
#import "UIViewController+JASidePanel.h"
#import "JASidePanelController.h"

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface FELeftMenuCell : UITableViewCell
@property (nonatomic,retain)UIImageView* lineImageView;
@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@implementation FELeftMenuCell
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.lineImageView.bottom = self.height;
  
}

-(UIImageView*)lineImageView
{
    if (!_lineImageView) {
        _lineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"setting_line.png"]];
        [self addSubview:_lineImageView];
    }
    return _lineImageView;
}

@end

///////////////////////////////////////////////////////////////////////////////////////////////////
@interface RCLeftMenuC ()
@property(strong,nonatomic)UITableView* tableView;
@property(nonatomic,assign)LeftMenuType currentMenuType;
@end

@implementation RCLeftMenuC

////////////////////////////////////////////////////////////////////////////////////////////////////
-(id)initWithStyle:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
    }
    return self;
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor = APP_THEME_COLOR;
    self.tableView.frame = CGRectMake(0.f, 0.f, self.view.width*LEFT_GAP_PERCENTAGE, self.view.height);
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor= APP_THEME_COLOR;
    [self.view addSubview:self.tableView];
    
    [self setSelectedMenuType:LeftMenuType_Home];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
-(void)setSelectedMenuType:(LeftMenuType)type{
    self.currentMenuType = type;
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:self.currentMenuType inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
}



////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark error here
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (ForumBaseAPIType_RubyChina == 0) {
        return LeftMenuType_More + 1;
    }
    else {
        return LeftMenuType_ForumNodes + 1;
    }   }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIndentifier = @"LeftViewCell";
    FELeftMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    if (!cell) {
        cell = [[FELeftMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
    }
    NSString *title = nil;
    LeftMenuType type = indexPath.row;
    switch (type) {
        case LeftMenuType_Home:
            title = @"热门讨论";
            break;
            
        case LeftMenuType_ForumNodes:
            title = @"节点分类";
            break;
            
        case LeftMenuType_CoolSites:
            title = @"酷站导航";
            break;
            
        case LeftMenuType_TopMembers:
            title = @"活跃会员";
            break;
            
        case LeftMenuType_MyHomePage:
            title = @"我的主页";
            break;
            
        case LeftMenuType_Wiki:
            title = @"站点Wiki";
            break;
            
        case LeftMenuType_More:
            title = @"更多设置";
            break;
            
        default:
            break;

    }
    cell.textLabel.text = title;
    cell.textLabel.textColor = [UIColor lightGrayColor];
    cell.textLabel.highlightedTextColor = [UIColor whiteColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:16.f];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    
     UIColor* bgColor = RGBACOLOR(71.f, 139.f, 201.f, 0.2f);
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = bgColor;
    cell.selectedBackgroundView = bgView;
    return cell;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Table view delegate
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != self.currentMenuType) {
        self.currentMenuType = indexPath.row;
        switch (self.currentMenuType) {
      case LeftMenuType_Home:
            {
                RCForumTopicsC *c = [[RCForumTopicsC alloc] initWithTopicsType:RCForumTopicsType_LatestActivity];
                UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:c];
                nav.navigationBar.translucent = NO;
                self.sidePanelController.centerPanel=nav;
            }
                break;
            default:
                break;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
