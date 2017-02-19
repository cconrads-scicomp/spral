add_executable(ssmfe ssmfe.f90)
target_link_libraries(ssmfe spral metis lapack blas)
add_test(ssmfe ssmfe)

add_executable(ssmfe_ciface ssmfe_ciface.c)
target_include_directories(ssmfe_ciface PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
target_link_libraries(ssmfe_ciface spral metis lapack cblas blas m)
add_test(ssmfe_ciface ssmfe_ciface)
