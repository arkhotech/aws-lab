#!/bin/bash

HOME="/home/ubuntu"

TOMCAT_INSTALL="${HOME}/tomcat"

TOMCAT_VERSION="7.0.91"

TOMCAT_URL="https://www-us.apache.org/dist/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.zip"

#Si no existe se instala
if [ ! -d ${TOMCAT_INSTALL} ]; then
	echo "Instalando Tomcat"
	#Bajar la distribución de Tomcat
	cd /home/ubuntu
	wget ${TOMCAT_URL}
	unzip apache-tomcat-${TOMCAT_VERSION}.zip
	mv apache-tomcat-${TOMCAT_VERSION} tomcat7
	chmod 765 tomcat7/bin/*.sh
	chown -R ubuntu:ubuntu $HOME/tomcat7
	echo "finalizando la instalación"
else
	echo "La instalación existe"
fi 