#!/bin/sh

set -x
git config --global user.email ${GITHUB_USER_EMAIL}
git config --global user.name ${GITHUB_USERNAME}
git config --global user.password ${GITHUB_PASSWORD}

COMMAND=$1
if [[ -z "${2}" || -z "${3}" ]]; then
  echo "One or more variables are not defined, will only run command"
else
  DOCKER_USERNAME=$2
  DOCKER_PASSWORD=$3
  DOCKER_REGISTRY=$4
  echo "Running docker login"
  [ -z "$DOCKER_REGISTRY" ] || echo "Using custom registry: ${DOCKER_REGISTRY}"
  echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin ${DOCKER_REGISTRY}
fi

echo "Running command"
${COMMAND}