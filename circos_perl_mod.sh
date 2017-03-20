#!/bin/bash 


# Install CPAN modules need by circos
#
# Could have placed them in the singularity definition file
# but a bug (as of Singularity 2.2) could not read a long .def file like this
# thus placing this as add_on script 

# the container is expected to have the following package installed:
# - perl
# - curl
# cpanminus and many perl modules will be installed by this script

# wget https://raw.githubusercontent.com/tin6150/singhub/master/circos_perl_mod.sh

SRC_DIR=/tmp/src
test -d $SRC_DIR || mkdir -p $SRC_DIR
cd $SRC_DIR

curl -L http://cpanmin.us | perl - App::cpanminus
CPANM=/usr/local/bin/cpanm

$CPANM Compress::Zlib       # not explicitly stated but needed
$CPANM Test::Warnings       # not absolute, but reduces warnings in XSLoader test
$CPANM Test::Fatal
$CPANM Carp
$CPANM Clone
$CPANM Config::General
$CPANM Cwd
$CPANM "Data::Dumper"
$CPANM Digest::MD5
$CPANM File::Basename
$CPANM File::Spec::Functions
$CPANM File::Temp
$CPANM FindBin
$CPANM Font::TTF::Font

$CPANM List::Util
$CPANM Math::Round
$CPANM Math::Trig
$CPANM "Math::VecStat"

$CPANM Memoize
$CPANM Params::Validate
$CPANM Pod::Usage

$CPANM POSIX
$CPANM Readonly
$CPANM Regexp::Common
$CPANM Statistics::Basic
$CPANM Sys::Hostname
$CPANM Text::Balanced
$CPANM Text::Format

$CPANM Math::Bezier
$CPANM Set::IntSpan
$CPANM SVG

$CPANM Getopt::Long
$CPANM IO::File
$CPANM --notest Storable
$CPANM --notest List::MoreUtils     # picky about XSLoader version 

#$CPANM GD
$CPANM GD::Image

$CPANM --force Time::HiRes
## Time::HiRes has some complain:
## df: Warning: cannot read table of mounted file systems: No such file or directory
## Unknown fstype for Time-HiRes-utime-_w5ptKunu
## and fail some 6/18 test, but they seems to be rounding errors, so likely safe to ignore and use --force

