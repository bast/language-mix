program fortran_main

   implicit none

#include "mpif.h"

   integer :: irank, num_proc, ierr, ifoo

   call mpi_init(ierr)

   call mpi_comm_size(MPI_COMM_WORLD, num_proc, ierr)
   call mpi_comm_rank(MPI_COMM_WORLD, irank, ierr)

   if (irank == 0) then
      ifoo = 1
   else
      ifoo = 0
   end if

   print *, '(fortran) rank', irank, 'before bcast:', ifoo

   call mpi_bcast(ifoo, 1, MPI_INTEGER, 0, MPI_COMM_WORLD, ierr)

   print *, '(fortran) rank', irank, 'after bcast:', ifoo

   call pass_comm(MPI_COMM_WORLD)

   call mpi_finalize(ierr)

end program
