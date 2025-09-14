// include/mylib.h
#ifndef MYLIB_H
#define MYLIB_H

// 导出符号标记（跨平台兼容）
#ifdef _WIN32
    #ifdef MYLIB_EXPORTS
        #define MYLIB_API __declspec(dllexport)
    #else
        #define MYLIB_API __declspec(dllimport)
    #endif
#else
    #define MYLIB_API __attribute__((visibility("default")))
#endif

// 函数声明
MYLIB_API int foo(int a, int b);  // 动态库导出的函数

#endif
