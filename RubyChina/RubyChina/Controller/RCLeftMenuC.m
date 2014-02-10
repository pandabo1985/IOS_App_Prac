//
//  RCLeftMenuC.m
//  RubyChina
//
//  Created by pan dabo on 14-2-10.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#import "RCLeftMenuC.h"

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
-(void)setSelectedMenuType:(LeftMenuType)type{
    self.currentMenuType = type;
    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:self.currentMenuType inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
////////////////////////////////////////////////////////////////////////////////////////////////////
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
