#!/bin/bash
#cleanup
#
LOG_DIR=/var/log	#log directory
ROOT_UID=0		#
LINES=50		#
E_XCD=66		#
E_NOTROOT=67		#


if [ "$UID" -ne "$ROOT_UID" ] 
	then
		echo "You need root credentials"
	exit $E_NOTROOT
fi

echo "you are root"

if [ -n "$1" ] 
	then
		lines=$1
	else
		lines=$LINES
fi

cd $LOG_DIR


if [ "$PWD" != "$LOG_DIR" ]
	then
		echo "not in log directory" >&2
	exit $E_XCD
fi



tail -$lines messages > mesg.tmp
#mv mesg.tmp messages

cat /dev/null > wtmp
echo "logs cleared"

exit 0



