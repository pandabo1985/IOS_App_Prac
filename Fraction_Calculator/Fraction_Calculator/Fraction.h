//
//  Fraction.h
//  Fraction_Calculator
//
//  Created by pan dabo on 13-7-30.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject

@property int numerator, denominator;

-(void)print;
-(void) setTo:(int) n over:(int) d;

-(Fraction *)add:(Fraction *)f;
-(Fraction *)subtact:(Fraction *) f;
-(Fraction *)multiply:(Fraction *)f;
-(Fraction *)divide:(Fraction *) f;

-(void) reduce;
-(double) convertToNum;
-(NSString *)convertToString;


@end
