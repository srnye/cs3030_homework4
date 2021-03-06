#!/bin/bash - 
#===============================================================================
#
#          FILE: chocolatebarnacle_cleanup_kr_hw4.sh
# 
#         USAGE: ./chocolatebarnacle_cleanup_kr_hw4.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Kyle Richetti (), kylerichetti@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 10/11/2016 13:14
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

#Clean up temp data folder
if [[ -d tempData ]]
then
	rm -rf tempData
fi


#Remove filtered data file
rm *.csv


exit 0

