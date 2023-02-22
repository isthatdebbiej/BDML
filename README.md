##BDML Homework 1 

In this homework,  I created a flask app that will generate a random number between 1-6 everytime the endpoint \rolldice is called. The code is copied from [Getting Started](https://opentelemetry.io/docs/instrumentation/python/getting-started/). The goal is to let automatic instrumentation generate telemetry data on our behalf. I haved used the opentelemetry-instrument agent in this homework.

On running *opentelemetry-instrument  --traces_exporter console --metrics_exporter console flask run*,  we get the trace with a span which is useful to track the lifetime of a request to the /rolldice route.
{<br />
    "name": "do_roll",<br />
    "context": {<br />
        "trace_id": "0x7e91fb5b09856d64fb279058c183a01c",<br />
        "span_id": "0x5747d68929dd2b6d",<br />
        "trace_state": "[]"<br />
    },<br />
    "kind": "SpanKind.INTERNAL",
    "parent_id": "0x9ea1aa62870d561c",
    "start_time": "2023-02-01T22:58:58.173725Z",
    "end_time": "2023-02-01T22:58:58.173725Z",
    "status": {
        "status_code": "UNSET"
    },
    "attributes": {
        "roll.value": 1
    },
    "events": [],
    "links": [],
    "resource": {
        "attributes": {
            "telemetry.sdk.language": "python",
            "telemetry.sdk.name": "opentelemetry",
            "telemetry.sdk.version": "1.15.0",
            "telemetry.auto.version": "0.36b0",
            "service.name": "unknown_service"
        },
        "schema_url": ""
    }
}
![alt text](https://github.com/isthatdebbiej/BDML/blob/main/screenshots/docker.png)
I installed Microk8s, docker and enabled istio. I also created a Dockerfile and a k8 config file (rolling-dice-deployment.yaml). I built a docker image and ran it and generated the trace. I pushed it into the registry and created a deployment and exposed it. The trace can be found at trace.txt.
![alt text](https://github.com/isthatdebbiej/BDML/blob/main/screenshots/k8.png)

To get the Jaegar dashboard running, I enabled Jaegar, hence craeting a namespace under istio-system. The dashbard can be viewed at http://localhost:16686
![alt text](https://github.com/isthatdebbiej/BDML/blob/main/screenshots/jaeger.png)
