//
//  Funtion.m
//  c_review
//
//  Created by pan dabo on 14-1-2.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#include <stdio.h>

int sumOfNumber(int sum){
    int ret = 0;
    for (int i = 0 ; i < sum+1; i++) {
        ret +=i;
    }
    return ret;
}


void swap(int x, int y)
{
    printf("begin ** x = %d, y = %d\n",x,y);
    int temp = x;
    x = y;
    y = temp;
  printf("end ** x = %d, y = %d\n",x,y);
    
}

void changeArray(int e[5]){
    for (int i = 0; i < 5; i++) {
        e[i] = i;
    }
}
