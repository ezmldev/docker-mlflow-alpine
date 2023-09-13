#!/usr/bin/env bash

set -ue

: "${MLFLOW_SERVICE_TYPE:?Parameter not set or empty}"
: "${MLFLOW_PORT:?Parameter not set or empty}"
: "${MLFLOW_MODEL_URI:?Parameter not set or empty}"

if [[ ${MLFLOW_SERVICE_TYPE} == "tracking" ]]; then
 exec mlflow server -p "${MLFLOW_PORT}" -h 0.0.0.0
elif [[ ${MLFLOW_SERVICE_TYPE} == "serving" ]]; then
  exec mlflow models serve -p "${MLFLOW_PORT}" -h 0.0.0.0 -m "${MLFLOW_MODEL_URI}" --no-conda
else
  echo Unkown service type: "${MLFLOW_SERVICE_TYPE}", valid values are [tracking, serving] 
  exit 1
fi

echo unkown command: "${COMMAND}". Please use tracking/serving 
