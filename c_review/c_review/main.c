//
//  main.c
//  c_review
//
//  Created by pan dabo on 14-1-1.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#include <stdio.h>
#include<stdlib.h>

int main(int argc, const char * argv[])
{

    printf("------------定义数组，对数组赋值-----------");
    int a[20]={1};
    for (int i = 0; i< 20; i++) {
        a[i] = rand()%10;
        printf("%d == ",a[i]);
    }
    printf("\n");
    printf("-----------数组拷贝------------\n");

    int b[5] = {1,2,3,4};
    int c[5]={5};
    for (int i = 0; i < 5; i++) {
        b[i]=c[i];
    }
    for (int i = 0; i < 5; i++) {
        printf("b[%d] = %d ",i,b[i]);
        printf("c[%d] = %d\n",i,c[i]);
    }
     printf("-----------冒泡排序------------\n");
    int d[5] = {13,17,11,16,8};
    for (int i = 0; i < 5 -1; i++) {
        for (int j = 0; j < 5 - 1 -i; j++) {
            if (d[j]>d[j+1]) {
                int temp = d[j];
                d[j] = d[j+1];
                d[j+1] = temp;
            }
        }
    }
    for (int i  = 0; i < 5; i++) {
    printf("d[%d] = %d\n",i,d[i]);
    }
    
    return 0;
}

