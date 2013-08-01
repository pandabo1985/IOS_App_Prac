//
//  ButtonFunViewController.m
//  ButtonFun
//
//  Created by pan dabo on 13-8-1.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "ButtonFunViewController.h"

@interface ButtonFunViewController ()

@end

@implementation ButtonFunViewController

@synthesize statusText;

-(IBAction)buttonPressed:(id)sender
{
    NSString *title = [sender titleForState:UIControlStateNormal];
    NSString *newText = [[NSString alloc] initWithFormat:@"%@ button pressed.",title];
    self.statusText.text = newText;
    [newText release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    statusText.text = nil;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    NSLog(@"didReceiveMemoryWarning");
    // Dispose of any resources that can be recreated.
}

-(void)dealloc
{
    [statusText release];
    [super dealloc];
}

@end
