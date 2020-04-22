#!/bin/sh

set -x
git config --global user.email ${GITHUB_USER_EMAIL}
git config --global user.name ${GITHUB_USERNAME}
git config --global user.password ${GITHUB_PASSWORD}

COMMAND=$1
WORKING_DIR=$2
if [ -z "${3}" ] || [ -z "${4}" ] || [ -z "${5}" ]; then
  echo "One or more variables are not defined, will only run command"
else
  DOCKER_USERNAME=$3
  DOCKER_PASSWORD=$4
  DOCKER_REGISTRY=$5
  echo "Running docker login into ${DOCKER_REGISTRY}"
  echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin ${DOCKER_REGISTRY}
fi

echo "Running command in ${WORKING_DIR}"
cd "$WORKING_DIR" || { echo "Cannot change into directory ${WORKING_DIR}"; exit 1; }
${COMMAND}