#!/bin/sh

sbt version
set -x

DOCKER_USERNAME=$1
DOCKER_PASSWORD=$2
DOCKER_REGISTRY=$3

echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin ${DOCKER_REGISTRY}

$4

