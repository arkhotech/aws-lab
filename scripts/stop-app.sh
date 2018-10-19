#!/bin/bash

HOME="/home/ubuntu"

TOMCAT_INSTALL="${HOME}/tomcat7"


if [ -d ${TOMCAT_INSTALL} ]; then
	echo "Deteneniendo la ejecución"
	#Bajar la distribución de Tomcat
	${TOMCAT_INSTALL}/bin/shutdown.sh
fi 