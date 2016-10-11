#!/bin/bash - 
#===============================================================================
#
#          FILE: chocolatebarnacle_unzip_kr_hw4.sh
# 
#         USAGE: ./chocolatebarnacle_unzip_kr_hw4.sh 
# 
#   DESCRIPTION: Create a temp folder and unzip data into it
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Kyle Richetti (), kylerichetti@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 10/11/2016 12:48
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

#Make sure file path for tar.gz is given

if [[ -z "$1" ]]
then
	echo "$0: Missing parameter: Name of tar.gz archive"
	exit 1
fi

#Create temp folder
mkdir tempData

#move archive into temp folder
mv $1 tempData

#change directory to tempData
cd tempData

#Unzip tar into temp folder
tar -xf $1

#Remove tar archive
rm $1

#Return to previous directory
cd ..

exit 0

