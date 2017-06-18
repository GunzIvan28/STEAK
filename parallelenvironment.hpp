#ifndef _PARALLELENVIRONMENT_HPP_
#define _PARALLELENVIRONMENT_HPP_

#include <mpi.h>
#include <exception>
#include <iostream>

  class parallel_environment{
  public:
    parallel_environment(int argc, char** argv);
    ~parallel_environment();
    static inline int get_process_num(){
      int i_process;
      MPI_Comm_rank(MPI_COMM_WORLD,&i_process);
      return i_process;
    }
    static inline int get_num_processes(){
      int n_processes;
      MPI_Comm_size(MPI_COMM_WORLD,&n_processes);
      return n_processes;
    }
    static inline void barrier(){
      MPI_Barrier(MPI_COMM_WORLD);
    }
  };



#endif
