#!/bin/bash - 
#===============================================================================
#
#          FILE: chocolatebarnacle_srn_hw4.sh
# 
#         USAGE: ./chocolatebarnacle_srn_hw4.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Steven R. Nye (), stevennye@mail.weber.edu
#  ORGANIZATION: Weber State University
#       CREATED: 10/11/2016 12:36
#      REVISION:  ---
#===============================================================================

#set -o nounset                              # Treat unset variables as an error

#Declaration of usage function
usageState()
{
	echo "Usage: ./chocolatebarnacle_srn_hw4.sh [-y year (2015 or 2016)] [-e email] [-u user] [-p password]"
    echo "Year and email arguments REQUIRED, user and password arguments OPTIONAL"
} 

#Declaration of help function
helpFun()
{
	if [[ "$1" == "--help" ]]
	then
		echo "Usage ./chocolatebarnacle_srn_hw4.sh --help"
		echo "--help Print this help message"
		echo "-y specifies the year of file to be requested (must be 2015 or 2016)"
		echo "-e specifies the email of user"
		echo "-u specifies the user's username"
		echo "-p specifies the user's password"
		echo "With no arguments it provides a usage statement"
		exit
	fi
}

#Call help function with first parameter
helpFun "$1"

#Start getopts
while getopts ":y:e:u:p:" opt
do
	case $opt in
		y)
			YEAR=$OPTARG
			;;
		e)
			EMAIL=$OPTARG
			;;
		u)
			USER=$OPTARG
			;;
		p)
			PASSWD=$OPTARG
			;;
		\?)
			echo "Invalid argument, exiting..."
			exit 1
			;;
	esac
done

#Check for required arguments
if [[ ! "$YEAR" || ! "$EMAIL" ]]
then
	usageState
	exit 1
fi

#If user entered user, they must have entered password as well
if [[ "$USER" && ! "$PASSWD"]]
then
	echo "Please enter your password, exiting..."
	exit 1
fi

exit 0
