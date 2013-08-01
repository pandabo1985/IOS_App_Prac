//
//  Calculator.h
//  Fraction_Calculator
//
//  Created by pan dabo on 13-7-30.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"

@interface Calculator : NSObject

@property (strong,nonatomic) Fraction *operand_1, *operand_2,*accumulator;

-(Fraction *) performOperation: (char) op;
-(void) clear;

@end
