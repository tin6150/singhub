#!/bin/bash 

# Example script for starting topspin installed inside the singularity container
# A number of bind mounts are done so that 
# user's script and config can be saved on the hosts's file system (could be NFS for sharing)
# The container itself can be started without (w)rite access, using normal user credentials.


# export LD_LIBRARY_PATH=/prog/structchem/topspin_singularity/2.2.1/lib/:$LD_LIBRARY_PATH

HOST_BASE_DIR=/prog/structchem/topspin_singularity
CONTAINER_DIR=/opt/topsping3.5.b.85pl7

singularity exec -B \
  ${HOST_BASE_DIR}/user:${CONTAINER_DIR}/prog/curdir,\
  ${HOST_BASE_DIR}/logfiles:${CONTAINER_DIR}/prog/logfiles,\
  ${HOST_BASE_DIR}/au_script:${CONTAINER_DIR}/exp/stan/nmr/au/src/user,\
  ${HOST_BASE_DIR}/py_script:${CONTAINER_DIR}/exp/stan/nmr/py/user,\
  ${HOST_BASE_DIR}/conf_global:${CONTAINER_DIR}/conf/global,\
  ${HOST_BASE_DIR}/nonexistent:/nonexistent,\
topspin.img   ${CONTAINER_DIR}/topspin
