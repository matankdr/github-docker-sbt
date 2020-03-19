#!/bin/sh

set -x
COMMAND=""
IVY_CONF=""
if [[ -z ${1} || -z ${2} || -z ${3} ]]; then
  echo "One or more variables are not defined, will run command"
  COMMAND = $1
  IVY_CONF = $2
else
  DOCKER_USERNAME=$1
  DOCKER_PASSWORD=$2
  DOCKER_REGISTRY=$3
  COMMAND=$4
  IVY_CONF=$5
  echo "Running docker login into ${DOCKER_REGISTRY}"

  echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin ${DOCKER_REGISTRY}
fi

mkdir ~/.ivy2/ || echo "Ivy folder is exists"
mkdir /root/.ivy2/ || echo "Ivy folder is exists"

echo ${IVY_CONF} >> ~/.ivy2/credentials || echo "Couldn't write ivy into ~/.ivy2/credentials"
echo ${IVY_CONF} >> /root/.ivy2/credentials || sudo echo ${IVY_CONF} >> /root/.ivy2/credentials || echo "Couldn't write ivy into /root/.ivy2/credentials"

echo "Running command"
${COMMAND}

