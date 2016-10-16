#!/bin/sh
#kill server
ps -ef | grep "server-$1"|awk '{print $2}'|xargs kill -9
#start server
sh /opt/IBM/WebSphere/AppServer/profiles/Custom01/bin/startServer.sh "server-$1"