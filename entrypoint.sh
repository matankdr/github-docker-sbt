#!/bin/sh

set -x
COMMAND=""

if [[ -z ${1} || -z ${2} || -z ${3} ]]; then
  echo "One or more variables are not defined, will run command"
  COMMAND = $1
else
  DOCKER_USERNAME=$1
  DOCKER_PASSWORD=$2
  DOCKER_REGISTRY=$3
  COMMAND=$4
  echo "Running docker login into ${DOCKER_REGISTRY}"

  echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin ${DOCKER_REGISTRY}
fi

echo "Running command"
${COMMAND}

