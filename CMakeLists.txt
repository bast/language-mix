cmake_minimum_required(VERSION 2.8 FATAL_ERROR)

project(language-mix)

enable_language(Fortran CXX)

find_package(MPI)
if(MPI_FOUND)
    set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${MPI_COMPILE_FLAGS}")
    include_directories(${MPI_INCLUDE_PATH})
else()
    message(FATAL_ERROR "-- CMake could not find any MPI installation, check $PATH")
endif()

# demonstrate how to forward MPI communicator from Fortran to C(++)
add_executable(
    pass-communicator.x
    pass-communicator/main.F90
    pass-communicator/sub.cpp
    )
set_property(TARGET pass-communicator.x PROPERTY LINKER_LANGUAGE Fortran)

# demonstrate how to pass strings between Fortran and C(++)
add_executable(
    pass-string.x
    pass-string/main.F90
    pass-string/subf.F90
    pass-string/subc.cpp
    )
set_property(TARGET pass-string.x PROPERTY LINKER_LANGUAGE Fortran)
