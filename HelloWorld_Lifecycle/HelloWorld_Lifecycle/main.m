    //
//  main.m
//  HelloWorld_LifeCycle
//
//  Created by pan dabo on 13-7-29.
//  Copyright (c) 2013年 pan dabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SampleDelegate.h"


int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"SampleDelegate");
    NSLog(@"retVal = %d",retVal);
    return retVal;
}
