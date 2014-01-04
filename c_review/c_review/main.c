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

    return 0;
}

