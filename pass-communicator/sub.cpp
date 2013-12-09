

#include <cstdio>

#include "mpi.h"

extern "C"
{
    void pass_comm_(MPI_Fint &extern_comm)
    {
        MPI_Comm comm = MPI_Comm_f2c(extern_comm);

        int num_proc, irank;
        MPI_Comm_size(comm, &num_proc);
        MPI_Comm_rank(comm, &irank);

        int ifoo = 0;
        if (irank == 0) ifoo = 1;

        printf("(cxx) rank %i before bcast: %i\n", irank, ifoo);

        MPI_Bcast(&ifoo, 1, MPI_INT, 0, comm);

        printf("(cxx) rank %i after bcast: %i\n", irank, ifoo);
    }
}
