//
//  Calculator.m
//  Fraction_Calculator
//
//  Created by pan dabo on 13-7-30.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

@synthesize operand_1, operand_2, accumulator;


-(id)init
{
    self = [super self];
    if (self) {
        operand_1 = [[Fraction alloc] init];
        operand_2 = [[Fraction alloc] init];
        accumulator = [[Fraction alloc] init];
        
    }
    
    return  self;
}

-(void)clear
{
    accumulator.denominator = 0;
    accumulator .numerator = 0;
    
}

-(Fraction *)performOperation:(char)op
{
    Fraction *result;
    switch (op) {
        case '+':
            return [operand_1 add:operand_2];
            break;
        case '-':
            return [operand_1 subtact:operand_2];
            break;
            case '*':
            return [operand_1 multiply:operand_2];
            break;
            case '/':
            return [operand_1 divide:operand_2];
            break;
        default:
            break;
    }
    
    accumulator.numerator = result.numerator;
    accumulator.denominator = result.denominator;
    return accumulator;
}

@end
