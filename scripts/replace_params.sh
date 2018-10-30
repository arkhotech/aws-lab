#!/bin/bash

if [ $# != 2 ]; then
  echo "Uso:  $0 [parametro] [archivo]
fi

PARAM=$1
FILE=$2

if [ -z "${AMBIENTE}" ]; then
   echo "No se ha establecido la variable de ambiente AMBIENTE"
   exit 1
fi

VALUE=$(aws ssm get-parameter --name ${PARAM}-${AMBIENTE} | jq -r '.Parameter.Value')

echo $VALUE

sed  "s/#{PASS}/${VALUE}/g" ../config/tomcat-users.xml
