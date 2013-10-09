//
//  TwitterView.m
//  Oschina_Prac
//
//  Created by pan dabo on 13-10-2.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "TwitterView.h"

@implementation TwitterView

@synthesize tableTweets;
@synthesize imageDownLoadsInProgress;
@synthesize twwetDownloadsInProgress;
@synthesize _uid;

#pragma mark -生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    allCount = 0;
    self.imageDownLoadsInProgress = [NSMutableDictionary dictionary];
    self.twwetDownloadsInProgress = [NSMutableDictionary dictionary];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
