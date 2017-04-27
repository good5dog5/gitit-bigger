#!/usr/bin/env bash

path_current_dir=$(cd `dirname $0`; pwd)

GITIT=gitit
BASEDIR=`dirname $0`

conf_file=mywiki.conf
pid_file=pid
log_file=log

case $1 in
	start)
        echo "Starting gitit wiki..."                                                             
        nohup gitit -f $conf_file > $log_file & echo $! > $pid_file 2>&1 &
	;;
	stop)
		echo "Stoping gitit wiki..."
        cat $pid_file | xargs kill; echo "stoped $conf_file"
	;;
	restart)
        cat $pid_file | xargs kill ; nohup gitit -f $conf_file > $log_file  & echo $! > $pid_file 2>&1 &
	;;
	*)
		echo "Use 'start', 'stop', or 'restart'"
	;;
esac

