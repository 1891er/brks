#!/bin/bash

check_process()
{
	count=`ps -x | grep "./src/brks" | grep -v "grep" | wc -l`
	if [ $count -gt 0 ]; then
		echo "brks started successfully~~~"
	else
		echo "brks already stoped~~~"
	fi
}


case "$1" in
    start)
        echo "start brks"
        ./src/brks ./conf/log.conf &
	check_process 
       ;;
    
    stop)
        echo "stop brks"
        killall brks
	check_process
        ;;
    
    restart)
        echo "restart brks"
        killall brks
        ./src/brks ./conf/log.conf &
        check_process
	;;

    *)
	echo "./brks start/stop/restart"
        ;;
esac
