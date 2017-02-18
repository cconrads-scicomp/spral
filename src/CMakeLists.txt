set(SPRAL_SOURCES
		blas_iface.f90
		compat.cxx
		core_analyse.f90
		lapack_iface.f90
		lsmr.f90
		match_order.f90
		matrix_util.f90
		metis5_wrapper.f90
		omp.cxx
		pgm.f90
		random.f90
		random_matrix.f90
		rutherford_boeing.f90
		scaling.f90
		timer.f90
		hw_topology/hw_topology.f90
		hw_topology/guess_topology.cxx
		ssids/akeep.f90
		ssids/anal.f90
		ssids/contrib.f90
		ssids/contrib.h
		ssids/contrib_free.f90
		ssids/datatypes.f90
		ssids/fkeep.f90
		ssids/inform.f90
		ssids/profile.cxx
		ssids/profile_iface.f90
		ssids/ssids.f90
		ssids/subtree.f90
		ssids/cpu/cpu_iface.f90
		ssids/cpu/NumericSubtree.cxx
		ssids/cpu/subtree.f90
		ssids/cpu/SymbolicSubtree.cxx
		ssids/cpu/ThreadStats.cxx
		ssids/cpu/kernels/cholesky.cxx
		ssids/cpu/kernels/ldlt_app.cxx
		ssids/cpu/kernels/ldlt_nopiv.cxx
		ssids/cpu/kernels/ldlt_tpp.cxx
		ssids/cpu/kernels/wrappers.cxx
		ssmfe/ssmfe.f90
		ssmfe/core.f90
		ssmfe/expert.f90
		interfaces/C/lsmr.f90
		interfaces/C/matrix_util.f90
		interfaces/C/random.f90
		interfaces/C/random_matrix.f90
		interfaces/C/rutherford_boeing.f90
		interfaces/C/scaling.f90
		interfaces/C/ssids.f90
		interfaces/C/ssmfe.f90
		interfaces/C/ssmfe_core.f90
		interfaces/C/ssmfe_expert.f90)


if(HAVE_CUDA)
	set(CUDA_SOURCES
			cuda/api_wrappers.cu
			cuda/cuda.f90
			ssids/gpu/alloc.f90
			ssids/gpu/cpu_solve.f90
			ssids/gpu/datatypes.f90
			ssids/gpu/dense_factor.f90
			ssids/gpu/factor.f90
			ssids/gpu/interfaces.f90
			ssids/gpu/solve.f90
			ssids/gpu/smalloc.f90
			ssids/gpu/subtree.f90
			ssids/gpu/kernels/assemble.cu
			ssids/gpu/kernels/dense_factor.cu
			ssids/gpu/kernels/reorder.cu
			ssids/gpu/kernels/solve.cu
			ssids/gpu/kernels/syrk.cu)
else()
	set(CUDA_SOURCES cuda/cuda_nocuda.f90 ssids/gpu/subtree_no_cuda.f90)
endif()

set(SPRAL_SOURCES ${SPRAL_SOURCES} ${CUDA_SOURCES})


add_library(spral SHARED ${SPRAL_SOURCES})
target_include_directories(spral PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}")
target_link_libraries(spral ${METIS_LIBRARIES})
target_link_libraries(spral ${LINALG_LIBRARIES})

install(TARGETS spral DESTINATION lib)
