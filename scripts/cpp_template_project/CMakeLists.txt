cmake_minimum_required(VERSION 3.10)
project(test_project)
set(CMAKE_CXX_STANDARD 14)

set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_CXX_FLAGS "-Wall -Wextra")
set(CMAKE_CXX_FLAGS_DEBUG "-g -O0")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(main main.cpp)
