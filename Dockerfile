# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

ENV FLASK_APP=app.py

COPY . /app
WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

EXPOSE 5000

CMD [ "opentelemetry-instrument", "--traces_exporter", "console" , "--metrics_exporter", "console", "flask", "run"]
