//
//  Fraction_CalculatorViewController.h
//  Fraction_Calculator
//
//  Created by pan dabo on 13-7-29.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Calculator.h"

@interface Fraction_CalculatorViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *display;

-(void)processDigit:(int) digit;
-(void)processOp: (char) theOp;
-(void)storeFracPrat;

-(IBAction) clickDigit :(UIButton *)sender;

-(IBAction) clickPlus;
-(IBAction) clickMinus;
-(IBAction) clickMultiply;
-(IBAction) clickDivide;

-(IBAction) clickOver;
-(IBAction) clickEquals;
-(IBAction) clickClear;

@end
