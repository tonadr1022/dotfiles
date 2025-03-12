cmake_minimum_required(VERSION 3.24)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(projectwow VERSION 0.1)

set(target_name "project")

add_executable(${target_name}
src/main.cpp
)

target_compile_options(${target_name}
    PRIVATE
    $<$<OR:$<CXX_COMPILER_ID:AppleClang>,$<CXX_COMPILER_ID:GNU>,$<CXX_COMPILER_ID:Clang>>:
    -Wall
    -Wextra
    -pedantic-errors
    -Wno-missing-field-initializers
    -Wno-unused-result
    >
    $<$<CXX_COMPILER_ID:MSVC>:
    /W4
    /WX
    /permissive-
    >
)
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
        target_compile_options(${target_name} PRIVATE -Wall -Wextra -Werror)
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "MSVC")
        target_compile_options(${target_name} PRIVATE /W4 /WX)
    endif()
endif()


