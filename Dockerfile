FROM docker:28.5.1-dind

ARG KIND_VERSION=0.29.0
ARG KUBECTL_VERSION=1.33.4
ARG TARGETARCH

LABEL version="v1.0.0"
LABEL maintainer="spatterlight@spatterlight.space"

ADD https://kind.sigs.k8s.io/dl/v${KIND_VERSION}/kind-linux-${TARGETARCH} /usr/local/bin/kind
ADD https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl /usr/local/bin/kubectl

RUN apk update
RUN apk --no-cache add bash python3 py3-kubernetes

RUN chmod +x /usr/local/bin/kind /usr/local/bin/kubectl
