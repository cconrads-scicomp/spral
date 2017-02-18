# Copyright 2016 Christoph Conrads

find_package(PkgConfig REQUIRED)
pkg_check_modules(PC_HWLOC hwloc)

find_path(HWLOC_INCLUDE_DIR NAMES hwloc.h HINTS ${PC_HWLOC_INCLUDE_DIRS})
find_library(HWLOC_LIBRARY NAMES hwloc HINTS ${PC_HWLOC_LIBRARY_DIRS})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(
	hwloc DEFAULT_MSG HWLOC_LIBRARY HWLOC_INCLUDE_DIR)

if(HWLOC_FOUND)
	set(HWLOC_LIBRARIES ${HWLOC_LIBRARY})
	set(HWLOC_INCLUDE_DIRS ${HWLOC_INCLUDE_DIR})
endif()

mark_as_advanced(HWLOC_INCLUDE_DIR HWLOC_LIBRARY)
