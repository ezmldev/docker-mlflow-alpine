FROM python:alpine as mlflow

RUN apk add bash curl py3-scikit-learn py3-pandas py3-numpy py3-pyarrow py3-matplotlib
ENV PYTHONPATH=/usr/lib/python3.11/site-packages/
RUN pip install mlflow

COPY start.sh /
RUN chmod 755 /start.sh

ENV PORT=5000
ENV MLFLOW_MODEL_URI=/model
EXPOSE 5000
CMD [ "/start.sh" ]