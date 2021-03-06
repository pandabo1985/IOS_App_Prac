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



typedef struct {
    char name[20];
    int age;
} student_new01;
typedef struct {
    char *name;
    int age;
} student_new02;



typedef struct {char name[30];int age; float score} Person;

void chang_p_name(char name[]){
    
    strcat(name, "（月薪过万）");
};

void change_p_fun(Person pers[], int arr_count, void (*p)(char name[])){
    for (int i = 0;  i< arr_count; i++) {
        if (pers[i].score > 90) {
            p(pers[i].name);
        }
    }
}

#define KMAXVALUE(a,b) (a>b?a:b);
#define FLAG 0;

enum season {
    spring,
    summer,
    autumn=5,
    winter
    };

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
    student_new01 stu_new01 = {0};
    strcpy(stu_new01.name, "张三");//因为数组名是个常量指针，不可以改变它的值
     printf("name=%s\n",stu_new01.name);
//    stu_new01.name="张三";
    student_new02 stu_new02={0};
    stu_new02.name ="张三";//字符指针是一个指针变量，可以重复赋值。
    printf("name=%s\n",stu_new02.name);
    printf("--------最大值-----\n");
    int maxint[]={1,3,4,5};
    int max_int = maxarr(maxint, 4);
    printf("max = %d\n",max_int);
    
     printf("--------栈---系统分配和释放，函数体中定义的变量通常在栈上，栈中的先进后出---\n");
    int stack_a = 3;
    int stack_b = 5;
    printf("satck_a=%d,stack_b=%d\n",stack_a,stack_b);
    printf("--------堆---程序员分配和释放，若程序不释放，程序介绍时由OS释放--\n");
      printf("---静态区-全局变量和静态变量放在一块-\n");
    
    int *stack_q = testMemory();
    printf("*stack_q = %d\n",*stack_q);
      printf("*stack_q = %d\n",*stack_q);
      printf("*stack_q = %d\n",*stack_q);
    
    char *me_str = malloc(sizeof(char)*10);
    strcpy(me_str, "abc");
    printf("me_str=%s\n",me_str);
    free(me_str);
    me_str = NULL;
    printf("me_str=%s\n",me_str);
    printf("me_str=%s\n",me_str);
    
     printf("---常量区-存放在常量区-\n");
     printf("---代码区-存放二进制代码的区域-\n");
    
     printf("---宏，预编译时进行替换。无参宏，带参宏。-\n");
    int hong_a = KMAXVALUE(3,5 );
    printf("%d\n",hong_a);
    
    printf("---条件编译-\n");
    #ifdef FLAG
    printf("hello\n");
    #else
    printf("world\n");
    #endif

    printf("---枚举类型-\n");
    printf("spring = %d\n",spring);
    printf("summer = %d\n",summer);
    printf("winter = %d\n",winter);
    
    printf("---const 限定的变量不能被修改-\n");
    int con_a = 3;
    const int *con_p = &con_a;
    
     printf("--函数指针--\n");
    int (*method_p)(int x, int y) = NULL;
    method_p = max_method_int;
    printf("max int = %d\n",method_p(3,5));
    
    typedef int (*MAX_METHOD_P) (int , int);
    MAX_METHOD_P max_method_p = NULL;
    max_method_p = max_method_int;
    printf("max int = %d\n",max_method_p(3,5));
    //函数指针的是赋值，是对地址的赋值。
    printf("method = %p\n",max_method_p);
    printf("method = %p\n",max_method_int);
    
    printf("--回调函数：由调用方自己实现，供被调方调用的函数。回调函数的核心是指针作为参数。--\n");
    
   
    Person person[5]={{"zhangsan1",17,77},
    {"zhangsan2",18,97},
    {"zhangsan3",19,97},
    {"zhangsan4",15,87},
    {"zhangsan5",16,78}
    };
    
    void (*change_p)(char name[]) = chang_p_name;
    
    change_p_fun(person, 5, change_p);
    for (int i  = 0; i < 5 ; i++ ) {
        printf("person[%d].name = %s\n",i,person[i].name);
    }
    
    return 0;
}




