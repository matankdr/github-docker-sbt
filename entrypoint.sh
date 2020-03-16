#!/bin/sh

sbt version
set -x
sbt "${@}";

