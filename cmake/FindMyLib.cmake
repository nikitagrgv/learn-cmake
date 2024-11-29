

set(INTERNAL_MYLIB_NAME "mylib")
set(INTERNAL_MYLIB_DIR "${PROJECT_SOURCE_DIR}/mylib")
set(INTERNAL_MYLIB_INCLUDE_DIR "${INTERNAL_MYLIB_DIR}/include")
set(INTERNAL_MYLIB_LIBRARY_DIR "${INTERNAL_MYLIB_DIR}/lib")

find_path(MyLib_INCLUDE_DIR
        NAMES "MyLib.h"
        PATHS ${INTERNAL_MYLIB_INCLUDE_DIR}
        NO_DEFAULT_PATH
)

find_library(MyLib_LIBRARY
        NAMES ${INTERNAL_MYLIB_NAME}
        PATHS ${INTERNAL_MYLIB_LIBRARY_DIR}
        NO_DEFAULT_PATH
)

if (NOT MyLib_INCLUDE_DIR OR NOT MyLib_LIBRARY)
    message(FATAL_ERROR "NOT Found ${INTERNAL_MYLIB_NAME} in ${INTERNAL_MYLIB_DIR}")
endif ()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(MyLib
        FOUND_VAR MyLib_FOUND
        REQUIRED_VARS
        MyLib_INCLUDE_DIR
        MyLib_LIBRARY
)

if (MyLib_FOUND AND NOT TARGET MyLib::MyLib)
    message(STATUS "Found MyLib in ${INTERNAL_MYLIB_DIR}")
    add_library(MyLib::MyLib STATIC IMPORTED)
    set_target_properties(MyLib::MyLib PROPERTIES
            IMPORTED_LOCATION ${MyLib_LIBRARY}
            INTERFACE_INCLUDE_DIRECTORIES ${MyLib_INCLUDE_DIR}
    )
endif ()
