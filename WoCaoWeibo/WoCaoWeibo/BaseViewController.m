//
//  BaseViewController.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-8.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (SinaWeibo *)sinaweibo
{
    AppDelegate *appDelgate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    SinaWeibo *sinaWeibo = appDelgate.sinaweibo;
    return sinaWeibo;
}

//override
-(void)setTitle:(NSString *)title
{
    [super setTitle:title];
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLable.textColor = [UIColor blackColor];
    titleLable.font = [UIFont boldSystemFontOfSize:18.0f];
    titleLable.backgroundColor = [UIColor clearColor];
    titleLable.text = title;
    [titleLable sizeToFit];
  self.navigationItem.titleView = [titleLable autorelease];
    
}


@end
