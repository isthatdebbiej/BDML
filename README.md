##BDML Homework 1 

In this homework,  I created a flask app that will generate a random number between 1-6 everytime the endpoint \rolldice is called. The code is copied from [Getting Started](https://opentelemetry.io/docs/instrumentation/python/getting-started/). The goal is to let automatic instrumentation generate telemetry data on our behalf. I haved used the opentelemetry-instrument agent in this homework.

On running *opentelemetry-instrument  --traces_exporter console --metrics_exporter console flask run*,  we get the trace with a span which is useful to track the lifetime of a request to the /rolldice route.

I used cloudlab to install Microk8s, docker and enabled istio. I also created a Dockerfile and a k8 comfig file (rolling-dice-deployment.yaml). I built a docker image and ran it and generated the trace. I pushed it into the registry and created a deployment and exposed it. The trace can be found at tarce.txt.

To get the Jaegar dashboard running, I enabled Jaegar, hence craeting a namespace under istio-system. The dashbard can be viewed at http://localhost:16686

