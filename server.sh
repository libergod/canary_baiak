#!/bin/bash
ulimit -c unlimited
while true; 
do
TEMPO="$(date +'%d-%m-%Y-%H-%M')"
./canary | tee "/home/otserv/logs/serverlog-"$TEMPO".log"; done
