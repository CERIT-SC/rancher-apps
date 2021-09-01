# MPIJob

MPIJob provide easy framework for running [MPI](https://www.open-mpi.org/) computation 
over traditional networks or [InfiniBand](https://en.wikipedia.org/wiki/InfiniBand) interconnect.

Builtin MPI operator creates launcher job and worker jobs. Launcher is meant to run
[mpirun](https://www.open-mpi.org/doc/v4.0/man1/mpirun.1.php) command together 
with selected user command. Workers do computation.

The MPI operator setups [ssh keys](https://www.ssh.com/academy/ssh/key) for access
among the launcher and the workers. User does not need to handle them.

Used docker image needs to be prepared. OpenMPI library must be installed. If one wants 
to use InfiniBand, also InfiniBand libs and drivers must be installed. Next, ssh client and
server must be installed. The server must be configured to listen on user port, e.g., 2222 and
the following options need to be set:
* PidFile -- pointing to writable are, /tmp, home
* HostKey -- pointing to _sshpath_ variable
* StrictModes no
* Port 2222

[Example](https://github.com/CERIT-SC/rancher-apps/tree/master/charts/mpijob/v0.1/example/) of Dockerfile.
