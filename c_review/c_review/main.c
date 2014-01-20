//
//  main.c
//  c_review
//
//  Created by pan dabo on 14-1-1.
//  Copyright (c) 2014年 pan dabo. All rights reserved.
//

#include <stdio.h>
#include<stdlib.h>
#include "Funtion.h"
#include <string.h>

typedef struct Date{
    int year;
    int mounth;
    int day;

}myDate;

//结构体是类型
struct stu {
    int number;//学号
    char name[20];//姓名
    char sex;//性别
    float sore;//分数
    myDate myBirthday;
    
};

typedef struct stu student;


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
    
    printf("-----------函数------------\n");
    printf("sum = %d\n",sumOfNumber(5));
    
    printf("-----------实参形参------------\n");
    int x = 2;
    int y = 3;
    swap(2,3);
    printf("x = %d; y = %d\n",x,y);
    
    printf("-----------数组------------\n");
    int e[5] = {2,4,5,6,7};
    changeArray(e);
    for (int i = 0; i < 5;  i++) {
        printf("e[%d] = %d\n",i,e[i]);
    }
     printf("-----------结构体------struct----typedef--\n");
    
    /**结构所占的空间可以简单的认为是各个成员所占内存空间之和，
    而实际是最大成员变量所占空间的最小整数倍*/
    
    
    //定义变量3要素，类型，变量名，初值
    struct stu student_1 ={1,"张三",'m',75.0};
    struct stu student_2 ={2,"小丽",'f',65.0};
    student student_3 = {3,"小鹿",'f',88.0};
    student_3.sore = 93.0;
//    student_2.name = "小丽丽";//不能直接赋值
    strcpy(student_2.name, "小萝莉");
    
//    struct stu students[3]={student_1,student_2,student_3};
     student students[3]={student_1,student_2,student_3};
    
    for (int i = 0; i < 3; i ++) {
        struct stu student = students[i];
        printf("number = %d  ",student.number);
         printf("sore = %f  ",student.sore);
        printf("name = %s\n",student.name);
    }
    
    printf("-----------结构体直接赋值-------\n");
    student_1 = student_3;
    printf("-----------赋值-------\n");
    printf("number = %d  ",student_1.number);
    printf("sore = %f  ",student_1.sore);
    printf("name = %s\n",student_1.name);
    printf("-----------赋值-------\n");
    student students_new[3]={student_1,student_2,student_3};
    for (int i = 0; i < 3; i ++) {
        struct stu student = students[i];
        printf("number = %d  ",student.number);
        printf("sore = %f  ",student.sore);
        printf("name = %s\n",student.name);
    }
      printf("-----------直接赋值证明-------\n");
    for (int i = 0; i < 3; i ++) {
        struct stu student = students_new[i];
        printf("number = %d  ",student.number);
        printf("sore = %f  ",student.sore);
        printf("name = %s\n",student.name);
    }
    printf("-----------三目运算符------\n");
    student maxStu_1 = (student_1.sore > student_2.sore)?student_1:student_2;
    student maxStu = (maxStu_1.sore > student_3.sore) ? maxStu_1 : student_3;
    printf("%d,%s,%f",maxStu.number,maxStu.name,maxStu.sore);
      printf("-----------结构体混合使用------\n");
    student stu_date = {1,"张三",'m',75.0,{1976,12,1}};
    student studenst_date[2] = {stu_date,{1,"李四",'m',75.0,{1986,1,2}}};
    for (int i = 0; i < 2; i++) {
        student stu = studenst_date[i];
        printf("%s的生日：%d年%d月%d日\n",stu.name,stu.myBirthday.year,stu.myBirthday.mounth,stu.myBirthday.day);
        
    }
    printf("-----------C语言字符串操作常用库函数------\n");
    checkFistAssigntStr("panda1985", 'a');
    checkLastAssigntStr("panda1985", 'a');
    char check[] = "panda1985";
//    checkFistAppearStr("panda1985", "a");//第一个参数必须未字符串数组
    checkFistAppearStr(check, "a");//第一个参数必须未字符串数数组（有点乱，搞混了）
   changeStrToCharArray("panda1985");
    
    printf("-----------C语言指针变量------\n");
    int z = 5;
    int *p = NULL;//null 恒等于0
    p = &z;
    printf("%p,%p\n",&z,p);
    printf("%d\n",*p);
    
    int ap = 3,bp = 6;
    int *abp = &ap;
    printf("%d\n",*abp);
    abp = &bp;
    printf("%d\n",*abp);
    
//    int *intp = NULL;
//    double *doublep = NULL;
//    char *charp = NULL;
//    printf("%d, %d, %d \n",sizeof(int *),sizeof(double *),sizeof(char *));
    
      printf("-----------C语言指针赋值------\n");
    int fui, *fup,*fuq;
    fup = &fui;
    fuq = fup;
    printf("%d, %d \n",*fup,*fuq);
    *fup = 1;
     printf("%d, %d \n",*fup,*fuq);
    *fuq = 2;
     printf("%d, %d \n",*fup,*fuq);
    
    int swap_m = 3,swap_n = 5;
    swap(swap_m, swap_n);
    printf("%d, %d\n",swap_m,swap_n);
    printf("swap_m = %p,swap_n=%p\n",swap_m,swap_n);
    printf("swap_m = %d,swap_n=%d\n",&swap_m,&swap_n);
    swap_p(&swap_m,&swap_n);
    printf("%d, %d\n",swap_m,swap_n);
    
    printf("-----------栈\n-------由编译器自动分配和释放\n--在函数体中定义的变量通常在栈上\n---栈中的变量是先进后出--\n栈中的变量一般都是除了函数会被释放\n");
    int *func_stack_p = funcStack();
    printf("%d\n",*func_stack_p);
    printf("%d\n",*func_stack_p);
    printf("%d\n",*func_stack_p);
    
    printf("--------静态区\n全局变量和静态变量的存储是放在一块的，存储在静态区\n程序结束释放-\n");
    int *func_stack_p_s = funcStack_static();
    printf("%d\n",*func_stack_p_s);
    printf("%d\n",*func_stack_p_s);
    printf("%d\n",*func_stack_p_s);
    
    printf("--------结构体指针指向结构体变量的指针------\n");
    student stu = {110};
    student *student_p = &stu;
    (*student_p).sore = 99.0f;
    student_p->sex = 'm';
    
    student stus[5] = {0};
    student *stu_q = stus;
    stu_q[0].sex = 'f';
    stu_q[0].sore = 78.0f;
    stu_q[1].sore = 88.0f;
    printf("%f,%f\n",stu_q[0].sore,stu_q[1].sore);
    
     printf("--------结构体内指针------\n");
    
    return 0;
}

