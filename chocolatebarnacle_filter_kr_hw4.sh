#!/bin/bash - 
#===============================================================================
#
#          FILE: chocolatebarnacle_filter_kr_hw4.sh
# 
#         USAGE: ./chocolatebarnacle_filter_kr_hw4.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Kyle Richetti (), kylerichetti@mail.weber.edu
#  ORGANIZATION: WSU
#       CREATED: 10/11/2016 13:12
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error


#Check if argument was given
if [[ -z  "$1" ]]
then
	echo "$0: Missing awk file argument"
	exit 1
fi

#Setup filename
filename=MOCK_DATA_FILTER_$(date +%F_%H:%m)


#Loop over data files
for file in `ls tempData/*.csv`
do
	cat  $file |` awk -f $1 >> tempData/$filename`
done

#zip filtered file
`gzip tempData/$filename`

#Move and rename zipped file
mv tempData/$filename.gz $filename.zip

exit 0

