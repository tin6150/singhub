
# Singularity container definition 
# Cuda 7.5 run time on CentOS 6
# 

# ref https://hub.docker.com/r/nvidia/cuda/
# ref https://gitlab.com/nvidia/cuda/blob/centos6/9.0/runtime/Dockerfile
# ref http://singularity-hub.org/containers/712


BootStrap: docker
From: nvidia/cuda:7.5-runtime-centos6
#From: nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04


%help
This container is a CentOS 6 with nvidia cuda runtime 

%runscript
	echo "zsh from inside the container..."
	/bin/zsh


%post
	#echo "Hello from inside the container"
	touch /THIS_IS_INSIDE_SINGULARITY
	yum -ty install vim bash zsh wget curl tar coreutils which util-linux-ng man \
			environment-modules \
			ipmitool \
			pciutils \
			epel-release  # sl6 may need diff mech to enable epel
			#libpng libpng-devel libpng-static \
			#openmotif openmotif-devl openmotif22 \



	echo "end"                  >> /THIS_IS_INSIDE_SINGULARITY
	date                        >> /THIS_IS_INSIDE_SINGULARITY

%labels
MAINTAINER  Tin Ho tin'at'lbl.gov


## sudo    /opt/singularity-2.4.2/bin/singularity build -w ./perf_tools.simg ./Singularity
## sudo    /opt/singularity-2.4.2/bin/singularity build -w ./sl6_lbl.simg ./sl6_lbl.def

