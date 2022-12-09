FROM arm64v8/alpine:3.16

RUN apk add --update \
    bash 

RUN apk add bcc-tools py3-pip py3-bcc

RUN pip install prometheus_client requests

WORKDIR /app

COPY . .

ENV KUBERNETES_SERVICE_HOST=10.152.183.1
ENV KUBERNETES_PORT_443_TCP_PORT=443
ENV NODE_NAME=sumologic-kubernetes-collection
ENV DEBUG=

CMD ["python3", "main.py"]