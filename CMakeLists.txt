cmake_minimum_required(VERSION 3.28)
project(epta)

set(CMAKE_CXX_STANDARD 17)


add_library(mylib STATIC)
target_include_directories(mylib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/mylib/include)
target_sources(mylib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/mylib/src/MyLib.cpp)

add_executable(epta main.cpp)
target_link_libraries(epta PUBLIC mylib)


