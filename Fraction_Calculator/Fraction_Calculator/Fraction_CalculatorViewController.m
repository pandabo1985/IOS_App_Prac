//
//  Fraction_CalculatorViewController.m
//  Fraction_Calculator
//
//  Created by pan dabo on 13-7-29.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "Fraction_CalculatorViewController.h"

@interface Fraction_CalculatorViewController ()

@end

@implementation Fraction_CalculatorViewController

{
    char op;
    int currentNumber;
    BOOL firstOperand, isNumerator;
    Calculator *myCaculator;
    NSMutableString *displayString;
}

@synthesize display;

-(void)processDigit:(int) digit
{
    currentNumber = currentNumber * 10 + digit;
    [displayString appendString:[NSString stringWithFormat:@"%i",digit]];
    display.text = displayString;
}
-(void)processOp: (char) theOp
{
    NSString *opStr;
    op = theOp;
    switch (theOp) {
        case '+':
            opStr = @" + ";
            break;
        case '-':
            opStr = @" - ";
            break;
        case '/':
            opStr = @" / ";
            break;
        case '*':
            opStr = @" * ";
            break;
        default:
            break;
    }
    
    [self storeFracPrat];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString:opStr];
    display.text = displayString;
    
}
-(void)storeFracPrat
{
    if (firstOperand) {
        if (isNumerator) {
            myCaculator.operand_1.numerator = currentNumber;
            myCaculator.operand_1.denominator = 1;
        }else
        {
            myCaculator.operand_1.denominator = currentNumber;
        }
    }else if (isNumerator)
    {
        myCaculator.operand_2.numerator= currentNumber;
        myCaculator.operand_2.denominator = 1;
        
    }else
    {
        myCaculator.operand_2.denominator =currentNumber;
        firstOperand = YES;
    }
    
    currentNumber = 0;
}

-(IBAction)clickDigit :(UIButton *)sender
{
    int digit = sender.tag;
    [self processDigit:digit];
}


-(IBAction) clickPlus
{
    [self processOp:'+'];
}
-(IBAction) clickMinus
{
    [self processOp:'-'];
}

-(IBAction)clickMultiply
{
    [self processOp:'*'];
}

-(IBAction)clickDivide
{
    [self processOp:'/'];
}

-(IBAction)clickOver
{
    [self storeFracPrat];
    isNumerator = NO;
    [displayString appendString:@"/"];
    display.text = displayString;
}
-(IBAction)clickEquals
{
    if (firstOperand == NO) {
        [self storeFracPrat];
        [myCaculator performOperation:op];
        
        [displayString appendString:@" = "];
        [displayString appendString:[myCaculator.accumulator convertToString]];
        display.text = displayString;
        currentNumber = 0;
        isNumerator  = YES;
        firstOperand = YES;
        [displayString setString:@""];
    }
}
-(IBAction)clickClear
{
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCaculator clear];
    [displayString setString:@""];
    display.text = displayString;
}


- (void)viewDidLoad
{
    firstOperand = YES;
    isNumerator  = YES;
    displayString = [NSMutableString stringWithCapacity:40];
     myCaculator = [[Calculator alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
