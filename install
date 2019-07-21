#!/bin/bash

# This script install singularity.  eg run as:
#    sudo ./install --prefix=/opt --build=2.4.beta
#    sudo ./install --prefix=/opt --build=2.5.2  	# currently in lrc 2019.07
#    sudo ./install --prefix=/opt --build=2.6		# have to change line below to git check out right version
# intended to work as single command (with wget...|sh) to install singularity
# think tried to do PR, but then Vanessa said there were something else?  that she has in mind? ...
# never pushed it at the end.
# but I can use it myself!  -Tin

# libtool need to be installed for autogen to work, eg:
# sudo apt install libtool automake autoconf
## autogen not in 3.x release anymore... so this only work for older up to 2.6.2 ...

# think there was some env module thing
# was it template or creation script?  
# can't find that anymore... so just using sym link to bin for now

# option parsing ref: 
# https://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bash


function print_usage () {
	echo "This script download singularity, compile and installs it"
	echo "root prividge is needed as some files need to be installed to libexec dir with suid."
	echo "Example usage:"
	echo "sudo ./install will install to /usr/local/singularity-\$BUILD"
	echo "sudo ./install --prefix=/opt --build=2.4.alpha will install to /opt/singularity-2.4.alpha"
}

### process command line arguments ###
### sanitize input param?  care about detecting  --b='test;rm' kind of hack??
### not really important, since user doing it to him/herself at the shell then.
for i in "$@"; do
	case $i in 
		-p=*|--prefix=*)
			PREFIX="${i#*=}"
			shift # past argument=value
			;;
		-b=*|--build=*)
			#BUILD="${i#*=}"
			BUILD="${i#*=}"
			shift # past argument=value
			;;
		-h|--help)
			print_usage
			exit 255
			;;
		*)
			echo "Unknown argument.  Use -h for help"
			exit 255
			;;
	esac
done





### actual install ###

PREFIX="${PREFIX:-/usr/local}"				# default install to /usr/local unless otherwise specified
#VER="{VER:-}"
if [[ x${BUILD} == "x" ]] ; then
	BUILD=$(date "+%Y.%m%d")
fi
INSTALLDIR=${PREFIX}/singularity-${BUILD} 

echo "This script install singularity to ${INSTALLDIR}"
echo "Press ^C in the next 15 seconds to cancel"
sleep 1
#sleep 15
echo "Press ^C to cancel or the ANY key to continue..."
read CONFIRM
echo "installing..."



if [[ ! -d ${INSTALLDIR} ]]; then
 	mkdir -p ${INSTALLDIR} 
	EXITCODE=$?
	if [[ $EXITCODE -gt 0 ]]; then
		echo "Unable to create ${INSTALLDIR}.  Exiting."
		exit $EXITCODE
	fi
fi

GITSOURCE=${INSTALLDIR}/github
if [[ ! -d ${GITSOURCE} ]] ; then
	# singularity never pulled from github, setting it up now
	mkdir ${GITSOURCE}
	cd    ${GITSOURCE}
	git clone https://github.com/singularityware/singularity.git
else
	# update code before install
	cd    ${GITSOURCE}/singularity
	git pull
	# instruction likely drastically changed with 3.x, so old did not address the changes  
	#git checkout origin/vault/release-2.5  # 2.5.2, same as in lrc
	git checkout origin/vault/release-2.6 # have problem doing this in shell?
fi

cd    ${GITSOURCE}/singularity
## not in 3.x release anymore... so this only work for older up to 2.6.2 ...
./autogen.sh
EXITCODE=$?
if [[ $EXITCODE -gt 0 ]]; then
	echo "autogen didn't work correctly.  "
	echo "Please make sure the following packages are installed: autoconf automake libtool"
	exit $EXITCODE
fi
./configure --prefix=${INSTALLDIR}
make
sudo make install
EXITCODE=$?
if [[ $EXITCODE -eq 0 ]]; then
	echo "Done.  Singularity installed to ${INSTALLDIR}."
else
	echo "Something didn't go right, Singularity install exits with ${EXITCODE}."
fi
