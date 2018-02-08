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

RUN pip install asyncio

RUN pip install ccxt

Run apt-get update

Run apt-get install -y  supervisor

ENV AIRFLOW_HOME ~/airflow

COPY . /root/airflow

COPY ./supervisord.conf /etc/supervisor

COPY ./airflow.conf /etc/supervisor/conf.d

RUN pip install airflow -i https://mirrors.aliyun.com/pypi/simple

RUN airflow initdb

CMD [ "supervisord", "-c", "/etc/supervisor/supervisord.conf" ]
