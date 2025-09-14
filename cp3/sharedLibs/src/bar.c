// src/bar.c
#include <stdio.h>
#include "mylib.h"

// 静态函数（仅库内可见）
static void helper() {
    printf("Internal helper\n");
}

// 导出函数调用内部 helper
MYLIB_API void bar() {
    helper();
    printf("Bar called\n");
}
