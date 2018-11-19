#!/bin/bash

if [ $# != 2 ]; then
  echo "Uso:  $0 [parametro] [archivo]"
  exit 1
fi

#Chequer si el archivo existe

if [ ! -f "$2" ]; then
	echo "El archivo no existe"
	exit 1
fi

PARAM=$1
FILE=$2

#Checkerar que las variables que indican el ambiente en el que se encuentran son validas
if [ -z "${AMBIENTE}" ]; then
   echo "No se ha establecido la variable de ambiente AMBIENTE"
   exit 1
fi

VALUE=$(aws ssm get-parameter --name ${PARAM}-${AMBIENTE} | jq -r '.Parameter.Value')

echo $VALUE

sed  "s/#{PASS}/${VALUE}/g" ${FILE}

#Code deploy environment variables
#  LIFECYCLE_EVENT
#  APPLICATION_NAME
#  DEPLOYMENT_GROUP_NAME
#  DEPLOYMENT_GROUP_ID

function chosee_deployment(){

	case $DEPLOYMENT_ID in

	"ENV1")
		echo "Procesando comando 1, para ambiente 1"
	;;
	*)
		echo "Opcion por defecto"
	;;
	esac

}