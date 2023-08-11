#!/usr/bin/env bash

set -x
exec mlflow models serve -p ${PORT} -h 0.0.0.0 -m ${MLFLOW_MODEL_URI} --no-conda