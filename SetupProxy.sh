#!/bin/bash
ans="$1"
echo $ans
port="8080"
if test "$ans" = "on"; then
	addr=$(dig www.google.com | grep -o "SERVER:.*" | sed 's/\(SERVER:\|#.*\| \)//g')
	export http_proxy="http://${addr}:${port}/"
	export https_proxy="http://${addr}:${port}/"
	export ftp_proxy="http://${addr}:${port}/"
	export all_proxy="http://${addr}:${port}/"
	export docker_proxy="${addr}:${port}"
else

	ans="192.168.${ans}"
	echo $ans
	export http_proxy="http://${ans}:${port}/"
	export https_proxy="http://${ans}:${port}/"
	export ftp_proxy="http://${ans}:${port}/"
	export all_proxy="http://${ans}:${port}/"
fi
