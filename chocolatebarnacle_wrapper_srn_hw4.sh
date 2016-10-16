#!/bin/bash - 
#===============================================================================
#
#          FILE: chocolatebarnacle_wrapper_srn_hw4.sh
# 
#         USAGE: ./chocolatebarnacle_wrapper_srn_hw4.sh 
# 
#   DESCRIPTION: Wrapper file for homework 4
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
	echo "Usage: ./chocolatebarnacle_wrapper_srn_hw4.sh [-y year (2015 or 2016)] [-e email] [-u user] [-p password]"
    echo "Year and email arguments REQUIRED, user and password arguments OPTIONAL"
} 

#Declaration of help function
helpFun()
{
	if [[ "$1" == "--help" ]]
	then
		echo "Usage ./chocolatebarnacle_wrapper_srn_hw4.sh --help"
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
			USERN=$OPTARG
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
if [[ -n "$USERN" && ! "$PASSWD" ]]
then
	echo "Please enter your password, exiting..."
	exit 1
fi

#If user entered password but no username
if [[ -n "$PASSWD" && ! "$USERN" ]]
then
	echo "Please enter username if password is entered, exiting..."
	exit 1
fi

#Check for valid year
if [[ ! $YEAR -eq 2015 && ! $YEAR -eq 2016 ]]
then
	echo "Please enter a valid year (2015 or 2016)"
	exit 1
fi

#Call wget with year parameter
bash chocolatebarnacle_jtn_wget_hw4.sh $YEAR

#Expand tar.gz files
bash chocolatebarnacle_unzip_kr_hw4.sh

#Loop over files generated and retrieve the first, last, and email columns and create new output file. Then zip file
bash chocolatebarnacle_filter_kr_hw4.sh chocolatebarnacle_awk_kr_hw4.awk

#FTP file to anonymous on server if given no username/pass arguments
#If user provided username and password, FTP to the users home area
bash chocolatebarnacle_jtn_ftp_hw4.sh $USERN $PASSWD

#Clean up mess
bash chocolatebarnacle_cleanup_kr_hw4.sh

#Schedule script using cronjob

#If everything works out correctly, send email to email passed in
mail -s "File Transferred" $EMAIL <<< "Successfully transferred file to FTP 137.190.19.102 server"


exit 0
