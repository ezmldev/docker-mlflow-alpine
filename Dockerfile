FROM python:alpine as mlflow

RUN apk add bash curl py3-scikit-learn py3-pandas py3-numpy py3-pyarrow py3-matplotlib
ENV PYTHONPATH=/usr/lib/python3.11/site-packages/
RUN pip install pydantic==1.10.9 mlflow==2.6.0

COPY start.sh /
RUN chmod 755 /start.sh

ENV MLFLOW_PORT=5000
ENV MLFLOW_SERVICE_TYPE="tracking"
ENV MLFLOW_MODEL_URI=/model
EXPOSE 5000
CMD [ "/start.sh" ]
