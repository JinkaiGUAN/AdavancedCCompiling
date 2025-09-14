cmake_minimum_required(VERSION 3.10)
project(mylib LANGUAGES C)

# 设置动态库输出目录
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# 添加动态库目标
add_library(mylib SHARED
    src/foo.c
    src/bar.c
)

# 设置头文件路径（公共接口）
target_include_directories(mylib PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

# 定义导出宏（Windows需 MYLIB_EXPORTS）
target_compile_definitions(mylib PRIVATE
    MYLIB_EXPORTS
)

# 设置符号可见性（Unix隐藏非导出符号）
if(UNIX AND NOT APPLE)
    set_target_properties(mylib PROPERTIES
        C_VISIBILITY_PRESET hidden
    )
endif()

# 设置动态库版本（可选）
set_target_properties(mylib PROPERTIES
    VERSION 1.0.0
    SOVERSION 1
    OUTPUT_NAME "mylib"  # 生成 libmylib.so（Unix）或 mylib.dll（Windows）
)

# 安装规则
install(TARGETS mylib
    LIBRARY DESTINATION lib      # Unix: .so
    ARCHIVE DESTINATION lib      # Windows: .lib
    RUNTIME DESTINATION bin      # Windows: .dll
)
install(FILES include/mylib.h DESTINATION include)
