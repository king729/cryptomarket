from airflow import DAG
from airflow.operators import BashOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'king',
    'depends_on_past': False,
    'start_date': datetime.today() - timedelta(days=1),
    'retries': 2,
    'retry_delay': timedelta(minutes=15),
}

dag = DAG('miniute_process', default_args=default_args, schedule_interval=timedelta(minutes=1))

templated_command = 'python ../project/cryptomarket.py'


task = BashOperator(
    task_id='process_log',
    bash_command=templated_command,
    dag=dag
)