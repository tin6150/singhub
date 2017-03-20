#!/bin/bash 

# Example script for starting topspin installed inside the singularity container
# A number of bind mounts are done so that 
# user's script and config can be saved on the hosts's file system (could be NFS for sharing)
# The container itself can be started without (w)rite access, using normal user credentials.


export LD_LIBRARY_PATH=/prog/structchem/topspin_singularity/2.2.1/lib/:$LD_LIBRARY_PATH

/usr/local/bin/singularity exec -B \
  /prog/structchem/topspin_singularity/user:/opt/topspin3.5.b.85pl7/prog/curdir,\
  /prog/structchem/topspin_singularity/logfiles:/opt/topspin3.5.b.85pl7/prog/logfiles,\
  /prog/structchem/topspin_singularity/au_script:/opt/topspin3.5.b.85pl7/exp/stan/nmr/au/src/user,\
  /prog/structchem/topspin_singularity/py_script:/opt/topspin3.5.b.85pl7/exp/stan/nmr/py/user,\
  /prog/structchem/topspin_singularity/conf_global:/opt/topspin3.5.b.85pl7/conf/global,\
  /prog/structchem/topspin_singularity/nonexistent:/nonexistent,\
topspin3.img   /opt/topspin3.5.b.85pl7/topspin
