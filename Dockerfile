# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
RUN opentelemetry-bootstrap -a install

COPY . .

CMD [ "opentelemetry-instrument", "--traces_exporter", "console" , "--metrics_exporter", "console", "flask", "run"]
