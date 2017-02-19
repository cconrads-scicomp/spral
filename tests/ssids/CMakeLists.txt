add_executable(ssids ssids.f90)
target_link_libraries(ssids spral metis lapack blas)
add_test(ssids ssids)
