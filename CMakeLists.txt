cmake_minimum_required(VERSION 3.2.0)
project(spral VERSION 2.0.0 LANGUAGES C CXX Fortran)

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_SOURCE_DIR}/cmake-modules)



# options
option(BE_QUIET "Tell CMake to be quiet" OFF)
option(BUILD_TESTING "Build tests" OFF)
option(ENABLE_GPU "Attempt to compile GPU code if nvcc is detected" ON)
option(ENABLE_OPENMP "Enable OpenMP parallelism" ON)


if(BE_QUIET)
	set_property(GLOBAL PROPERTY RULE_MESSAGES OFF)
endif()


if(BUILD_TESTING)
	enable_testing()
endif()


# set compiler flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c99")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wextra -Wall -std=c++11 -pedantic")


# check for packages, features
include(CheckFunctionExists)

set(CMAKE_REQUIRED_INCLUDES "sched.h")
check_function_exists(sched_getcpu HAVE_SCHED_GETCPU)

set(CMAKE_REQUIRED_INCLUDES "memory")
check_function_exists(std::align HAVE_STD_ALIGN)


find_package(hwloc)

if(NOT HWLOC_FOUND)
	message(WARNING "hwloc not found; NUMA regions cannot be detected")
endif()

if(ENABLE_OPENMP)
	find_package(OpenMP REQUIRED)
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
endif()

if(ENABLE_GPU)
	find_package(CUDA)
endif()


# add subdirectories
include_directories("${CMAKE_SOURCE_DIR}/include")
include_directories("${CMAKE_BINARY_DIR}/include")

add_subdirectory(doc)
add_subdirectory(driver)
add_subdirectory(include)
add_subdirectory(src)
add_subdirectory(tests)
