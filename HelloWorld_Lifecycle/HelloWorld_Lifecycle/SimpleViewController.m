//
//  SimpleViewController.m
//  HelloWorld_LifeCycle
//
//  Created by pan dabo on 13-7-29.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "SimpleViewController.h"

@interface SimpleViewController ()

@end

@implementation SimpleViewController

-(void)loadView
{
    UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    
    contentView.backgroundColor = [UIColor blackColor];
    
    self.view = contentView;
    
    [contentView release];
    
    CGRect labelFrame = CGRectMake(40.0f, 200.0f, 240.0f, 60.0f);
    
    UILabel *frontLabel = [[UILabel alloc] initWithFrame:labelFrame];
    
    frontLabel.text = @"Hello World!";
    
    frontLabel.font = [UIFont fontWithName:@"Georgia" size:24.0f];
    
    frontLabel.textColor = [UIColor colorWithRed:0.82f green:1.0f blue:0.286f alpha:1.0f];
    
    frontLabel.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f];
    
    [contentView addSubview:frontLabel];
    
    [frontLabel release];
}

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

@end
