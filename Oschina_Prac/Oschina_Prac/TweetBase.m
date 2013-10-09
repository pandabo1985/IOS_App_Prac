//
//  TweetBase.m
//  Oschina_Prac
//
//  Created by pan dabo on 13-9-21.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "TweetBase.h"

@implementation TweetBase

@synthesize segment_title;
@synthesize twitterView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self myInit];
    }
    return self;
}


-(void)myInit
{
    self.navigationController.view.backgroundColor = [UIColor grayColor];
    self.tabBarItem.image = [UIImage imageNamed:@"tweet"];
    self.title = @"动弹";
    self.tabBarItem.title = @"动弹";
    NSArray *segmentTextContent = [NSArray arrayWithObjects:@"最新动弹",@"热门动弹",@"我的动弹",nil];

    self.segment_title = [[UISegmentedControl alloc] initWithItems:segmentTextContent];
    self.segment_title.selectedSegmentIndex = 0;
    self.segment_title.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.segment_title.segmentedControlStyle = UISegmentedControlStyleBar;
    self.segment_title.frame = CGRectMake(0, 0, 300, 30);
    [self.segment_title addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = self.segment_title;
    
    //子页初始化
    self.twitterView = [[TwitterView alloc] init];
    [self addChildViewController:self.twitterView];
    [self.view addSubview:self.twitterView.view];
    self.twitterView.view.frame = self.view.bounds;
    self.twitterView.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //添加发布动弹按钮
    UIBarButtonItem *btnPubTweet = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleBordered target:self action:nil];
    btnPubTweet.image = [UIImage imageNamed:@"tweet24"];
    [btnPubTweet setAction:@selector(clickPubTweet:)];
    self.navigationItem.rightBarButtonItem = btnPubTweet;
}

-(void)clickPubTweet:(id)sender
{
    
}

-(void)segmentAction:(id)sender
{
    switch (self.segment_title.selectedSegmentIndex) {
        case 0:
          
            break;
            
        default:
            break;
    }
}


-(NSString *)getSegmentTitle
{
    return Nil;
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

@end
