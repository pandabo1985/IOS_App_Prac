//
//  Funtion.m
//  c_review
//
//  Created by pan dabo on 14-1-2.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#import <stdlib.h>

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
void swap_p(int *x, int *y)
{
    printf("begin ** *x = %d, *y = %d\n",*x,*y);
    int temp = *x;
    *x = *y;
    *y = temp;
    printf("end ** *x = %d, *y = %d\n",*x,*y);
    
}

void changeArray(int e[5]){
    for (int i = 0; i < 5; i++) {
        e[i] = i;
    }
}

void checkFistAssigntStr(char *string,char assign){
    
    char *ptr;
    ptr = strchr(string,assign);
    printf("在字符串%s中查找指定字符%c的第一个出现%s\n",string,assign,ptr);
    
}

void checkLastAssigntStr(char *string,char assign){
    char *ptr;
    ptr = strrchr(string,assign);
    printf("在字符串%s中查找指定字符%c的最后一个出现%s\n",string,assign,ptr);
    
}

void checkFistAppearStr(char *string, const char *appear){
     char *first;
     first= strtok(string,appear);
    printf("在字符串%s中查找指定字符的第一个出现%s\n",appear,first);
}
void changeStrToCharArray(char *string){
    char ret[10];
  
    stpcpy(ret, string);
    printf("%s\n", ret);
   
}
int *funcStack(){
    int m = 3;
    int *n = &m;
    printf("&m = %p\n",n);
    printf("*n = %p\n",n);
    return n;
}

int *funcStack_static(){
   static int m = 3;
    int *n = &m;
    printf("&m = %p\n",n);
    printf("*n = %p\n",n);
    return n;
}

int maxarr(int arr[],int length){
    int max = 0;
    for (int i =0 ; i < length; i++) {
        if (arr[i]>max) {
            max = arr[i];
        }
    }
    return max;
}

int *testMemory(){
//    int a = 11;
    static int a = 11; 
//    int *p = &a;
    int *p = malloc(sizeof(4));
    p = &a;
    return p;

}

int max_method_int(int x, int y){
    return x>y?x:y;
}