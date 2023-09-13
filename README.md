This is an alpine base mlflow image.

## Why

- The official mlflow image is debian based and huge (>2GB)
- The alpine based is smaller (~800MB)
- default entrypoint starts model serving

## TODO

[ ] pin mlflow version
[ ] use matching tag version
[X] default entrypoint should start tracking server

## Usage

There are two operation modes of this image:
1) MLflow tracking: Start a tracking server. Note that at this moment this is a sandbox tracking server and it doesn't preserve it's state beyond the lifetime of the container. 
2) MLflow model serving: Start a model serving REST API

### Starting a tracking server
A tracking server is started by default, simply starting a container:
```docker run -d -p 5000:5000 ghcr.io/ezmldev/mlflow```

### Starting a model serving
You want to pass the `MLFLOW_SERVICE_TYPE=serving` environment variable to start model serving. The MLflow model can be provided from a named volume, like:
```
docker run -d -e MLFLOW_SERVICE_TYPE=serving -p 5000:5000 -v model:/model ghcr.io/ezmldev/mlflow
```

Or even from a local dir
```
docker run -d MLFLOW_SERVICE_TYPE=serving -p 5000:5000 -v $PWD/my-model:/model ghcr.io/ezmldev/mlflow
```

#### Testing model serving
```
curl \
  -H "content-type: application/json" \
  localhost:5000/invocations \
  -d '{"inputs": [["feature1", "feature2"]]}'
```

You can also specify an alternative model location by the env var `MLFLOW_MODEL_URI`.