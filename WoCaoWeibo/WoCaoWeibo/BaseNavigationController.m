//
//  BaseNavigationController.m
//  WoCaoWeibo
//
//  Created by pan dabo on 13-10-8.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "BaseNavigationController.h"
#import "ThemeManaer.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNotification object:nil];
    }
    return self;
}

-(void)dealloc
{
    [super dealloc];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kThemeDidChangeNotification object:nil];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadThemeImage];
    
    UISwipeGestureRecognizer *swipGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipAction:)];
    swipGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipGesture];
    [swipGesture release];
//	float version = WXHLOSVersion();
////    if (version >= 5.0) {
////        UIImage *image = [UIImage imageNamed:@"navigationbar_background.png"];
////        [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
////    }
//    if ([self.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
//        UIImage *image = [UIImage imageNamed:@"navigationbar_background.png"];
//        [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
//    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -nsnotification acitons
-(void)themeNotification:(NSNotification *)notification
{
    [self loadThemeImage];
}

-(void)loadThemeImage{
    float version = WXHLOSVersion();
   if (version >= 5.0) {
    UIImage *image = [[ThemeManaer shareInstance] getThemeImage:@"navigationbar_background.png"];
    [self.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
  }else{
      //调用setNeddsDisplay方法让渲染引擎异步调用drawRec方法 
      [self.navigationBar setNeedsDisplay];
  }
    
}

-(void)swipAction:(UISwipeGestureRecognizer *)gesture{
    if(self.viewControllers.count>1){
        if (gesture.direction == UISwipeGestureRecognizerDirectionRight) {
            [self popViewControllerAnimated:YES];
        }
    }
}
@end
