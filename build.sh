#!/usr/bin/env bash

echo "Building ..."

mvn clean package > build.log 2>&1

if [[ "$?" -eq 0 ]]; then
  echo "Build was successful"
else
  echo "Build failed"
fi

echo "Build output can be found in build.log"
