This is an alpine base mlflow image.

## Why

- The official mlflow image is debian based and huge (>2GB)
- The alpine based is smaller (~800MB)
- default entrypoint starts model serving

## Usage

Model can be provide from a named volume:
```
docker run -d -p 5000:5000 -v model:/model ezmlops/mlflow
```

Or even from a local dir
```
docker run -d -p 5000:5000 -v $PWD/my-model:/model ezmlops/mlflow
```

```
curl \
  -H "content-type: application/json" \
  localhost:5000/invocations \
  -d '{"inputs": [["feature1", "feature2"]]}'
```

## Config

You can specify an alternative model location by the env var: `MLFLOW_MODEL_URI`