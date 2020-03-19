#!/bin/sh

set -x
COMMAND=$1
IVY_CONF=$2
if [[ -z "${3}" || -z "${4}" || -z "${5}" ]]; then
  echo "One or more variables are not defined, will only run command"
else
  DOCKER_USERNAME=$3
  DOCKER_PASSWORD=$4
  DOCKER_REGISTRY=$5
  echo "Running docker login into ${DOCKER_REGISTRY}"
  echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin ${DOCKER_REGISTRY}
fi

mkdir ~/.ivy2/ || echo "Ivy folder is exists"
mkdir /root/.ivy2/ || echo "Ivy folder is exists"

echo ${IVY_CONF} >> ~/.ivy2/credentials || echo "Couldn't write ivy into ~/.ivy2/credentials"
echo ${IVY_CONF} >> /root/.ivy2/credentials || sudo echo ${IVY_CONF} >> /root/.ivy2/credentials || echo "Couldn't write ivy into /root/.ivy2/credentials"

echo "Running command"
${COMMAND}

