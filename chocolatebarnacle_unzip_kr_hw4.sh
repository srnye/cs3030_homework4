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


#Create temp folder
if [[ ! -d tempData ]]
then
	mkdir tempData
fi

for archive in `ls *.tar.gz`
do
#move archive into temp folder
mv $archive tempData

#change directory to tempData
cd tempData

#Unzip tar into temp folder
tar -xf $archive

#Remove tar archive
rm $archive

#Return to previous directory
cd ..
done

exit 0

