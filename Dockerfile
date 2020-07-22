# Digest declared in Jenkinsfile
ARG DOCKER_DIGEST=$DOCKER_DIGEST
FROM alpine@$DOCKER_DIGEST

ARG TRAEFIK_VERSION=2.2.7

RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add \
    su-exec \
    ca-certificates \
    wget \
    tzdata

RUN wget -P /tmp/ https://github.com/containous/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_v${TRAEFIK_VERSION}_linux_armv7.tar.gz && \
    tar -xf /tmp/traefik_v${TRAEFIK_VERSION}_linux_armv7.tar.gz -C /usr/local/bin/ && \
    chmod +x /usr/local/bin/traefik && \
    apk del wget && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

LABEL description="Modern HTTP reverse proxy and load balancer" \
      maintainer="ARM-PIt" \
      traefik_version="${TRAEFIK_VERSION}" \
      project_url="https://docs.traefik.io/" \
      alpine_version="3.12" \
      architecture="armhf"

EXPOSE 80 8080 443

ENTRYPOINT ["/usr/local/bin/traefik"]
