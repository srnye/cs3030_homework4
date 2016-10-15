#!/bin/bash - 
#===============================================================================
#
#          FILE: chocolatebarnacle_jtn_ftp_hw4.sh
# 
#         USAGE: ./chocolatebarnacle_jtn_ftp_hw4.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Jordan Newkirk (), 
#  ORGANIZATION: 
#       CREATED: 10/15/2016 11:11
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

#Username and Password fron getopts are passed in as $1 and $2
#in the wrapper script

USERN=$1
PASSWD=$2

#HOSTNAME of YOUR FTP SERVER
HOST='137.190.19.102'

filename=MOCK_DATA_FILTER_$(date +%F_%H:%m)

#Info for anonymous account
AUSER='anonymous'
APASS='anonymous@weber.edu'

#If no username or password are given use anonymous account
if [[ ! $USERN && ! $PASSWD ]]
then
	echo "Using anonymous FTP account"
	ftp -inv $HOST << EOF
	user $AUSER $APASS
	get $filename.zip retrieval.$$
	bye
EOF
fi

#If username and password are given use information for ftp
if [[ -n "$USERN" && -n "$PASSWD" ]]
then
	echo "Using $USERN FTP account"
	ftp -inv $HOST << EOF
	user $USERN $PASSWD
	cd .
	get $filename.zip retrieval.$$
	bye
EOF
fi

exit 0
