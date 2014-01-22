//
//  Funtion.h
//  c_review
//
//  Created by pan dabo on 14-1-2.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//


int sumOfNumber(int sum);

void swap(int x, int y);
void swap_p(int *x, int *y);
void changeArray(int e[]);

void checkFistAssigntStr(char *string,char assign);//在字符串中查找指定字符的第一个出现
void checkLastAssigntStr(char *string,char assign);//在字符串中查找指定字符的最后一个出现
void checkFistAppearStr(char *string, char *appear);//在串中查找指定字符的第一个出现
void changeStrToCharArray(char *string);//拷贝一个字符串到另一个字符串数组
int *funcStack();//测试栈
int *funcStack_static();//测试栈
int maxarr(int arr[],int length);