cmake_minimum_required(VERSION 3.28)
project(epta)

set(CMAKE_CXX_STANDARD 17)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

#add_library(mylib STATIC)
#target_include_directories(mylib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/mylib/include)
#target_sources(mylib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/mylib/src/MyLib.cpp)

find_package(MyLib MODULE REQUIRED)

add_executable(epta main.cpp)
target_link_libraries(epta PUBLIC MyLib::MyLib)
