#!/bin/sh

kill $(ps x|grep -m 1 "lib/conetcontroller.jar"|awk '{ print $1 }')
./run.sh >& /dev/null &


