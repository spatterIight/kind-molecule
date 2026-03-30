FROM docker:29.3.1-dind

ARG KIND_VERSION=0.31.0
ARG KUBECTL_VERSION=1.35.3
ARG TARGETARCH

LABEL maintainer="spatterlight@spatterlight.space"

ADD https://kind.sigs.k8s.io/dl/v${KIND_VERSION}/kind-linux-${TARGETARCH} /usr/local/bin/kind
ADD https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/${TARGETARCH}/kubectl /usr/local/bin/kubectl

RUN apk update
RUN apk --no-cache add bash python3 py3-kubernetes

RUN chmod +x /usr/local/bin/kind /usr/local/bin/kubectl
