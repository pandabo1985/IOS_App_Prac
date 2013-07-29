//
//  FirstAppViewController.m
//  My First App
//
//  Created by pan dabo on 13-7-29.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "FirstAppViewController.h"

@interface FirstAppViewController ()

@end

@implementation FirstAppViewController

@synthesize display;

-(IBAction)click_1
{
    display.text =@"1";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
