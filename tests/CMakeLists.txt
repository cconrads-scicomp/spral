if(NOT BUILD_TESTING)
	return()
endif()


include_directories("${CMAKE_BINARY_DIR}/src")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fstack-protector-all")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fstack-protector-all")


function(add_f90_test FILENAME)
	get_filename_component(TEST_EXECUTABLE ${FILENAME} NAME_WE)
	add_executable(${TEST_EXECUTABLE} ${FILENAME})
	target_link_libraries(${TEST_EXECUTABLE} spral metis lapack blas)

	add_test(${TEST_EXECUTABLE} ${TEST_EXECUTABLE})
endfunction()

add_f90_test(lsmr.f90)
add_f90_test(random.f90)
add_f90_test(random_matrix.f90)
add_f90_test(rutherford_boeing.f90)
add_f90_test(scaling.f90)

add_subdirectory(ssids)
add_subdirectory(ssmfe)
