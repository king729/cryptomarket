FROM python:3
ENV PYTHONUNBUFFERED 1
WORKDIR /root/airflow

RUN pip install pika

RUN pip install PyMySQL

RUN pip install pysnowflake

RUN pip install redis

RUN pip install SQLAlchemy==1.2.1 -i https://mirrors.aliyun.com/pypi/simple

RUN pip install click

RUN pip install cryptography

RUN pip install pyjwt

ENV AIRFLOW_HOME ~/airflow

RUN pip install airflow

RUN airflow initdb

CMD [ "airflow", "webserver", "-p", "8080" ]