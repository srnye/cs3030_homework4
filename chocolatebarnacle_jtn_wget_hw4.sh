#!/bin/bash - 
#===============================================================================
#
#          FILE: chocolatebarnacle_jtn_wget_hw4.sh
# 
#         USAGE: ./chocolatebarnacle_jtn_wget_hw4.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Jordan Newkirk (), 
#  ORGANIZATION: 
#       CREATED: 10/11/2016 12:43
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error
YEAR=$1

if [[ $YEAR -eq 2015 ]]
then
	echo "Year equals 2015, web getting 2015/2016 MOCK DATA"
	wget icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_$YEAR.tar.gz
	wget icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_2016.tar.gz
fi

if [[ $YEAR -eq 2016 ]]
then
	echo "Year equals 2016, web getting 2016/2015 MOCK DATA"
	wget icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_$YEAR.tar.gz
	wget icarus.cs.weber.edu/~hvalle/cs3030/MOCK_DATA_2015.tar.gz
fi

if [[ ! $YEAR -eq 2015 || ! $YEAR -eq 2016 ]]
then
	echo "Year must equal 2015 or 2016"
fi

exit 0
