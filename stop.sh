#!/bin/bash

kill $(ps x|grep -m 1 "lib/conetcontroller.jar"|awk '{ print $1 }')

