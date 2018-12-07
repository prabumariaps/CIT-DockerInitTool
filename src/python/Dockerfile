FROM python:3

WORKDIR /usr/src/app

RUN pip install --proxy=http://10.10.10.10:8080 --no-cache-dir -r requirements.txt

ENTRYPOINT ["python","run.py"]
