//
//  ButtonFunViewController.h
//  ButtonFun
//
//  Created by pan dabo on 13-8-1.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonFunViewController : UIViewController

{
    UILabel *statusText;
}

@property (nonatomic, strong) IBOutlet UILabel *statusText;
-(IBAction) buttonPressed:(id)sender;

@end
