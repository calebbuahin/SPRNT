#! /bin/bash

# get packages from University of Florida CISE
# 
# NOTE: the exact locations of the files could be changed without notice
#       modify this script if necessary!

echo " "
echo "Fetching SuiteSparse from TIM DAVIS U. Tamu webpage,"
echo " may take a few minutes depending on the speed of the internet connection ...."
echo " "
if [ ! -f SuiteSparse-3.7.1.tar.gz ]; then
curl http://faculty.cse.tamu.edu/davis/SuiteSparse/SuiteSparse-3.7.1.tar.gz -o SuiteSparse-3.7.1.tar.gz
fi


echo " "
echo "Expanding the source code ......"
echo " "
tar -xzvf SuiteSparse-3.7.1.tar.gz  > /dev/null 2>&1

# the original UFconfig.mk doesn't quite work for me
# use the hacked version
# 

echo " "
echo "Moving contents to main folder ......"
echo " "
mv Makefile Makefile.temp
mv -v SuiteSparse/* ./
mv Makefile.temp Makefile

# the original UFconfig.mk doesn't quite work for me
# use the hacked version
# 

echo " "
echo "Updating the config file ......"
echo " "
\mv -f UFconfig/UFconfig.mk UFconfig/UFconfig.mk.org
\cp -f UFconfig.mk.linux UFconfig/UFconfig.mk

echo "... Done!"
