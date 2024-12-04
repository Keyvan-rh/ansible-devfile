FROM quay.io/devfile/universal-developer-image:ubi8-latest

ARG PYV=3.11

LABEL org.opencontainers.image.source=https://github.com/ansible/ansible-workspace-env-reference-image
LABEL org.opencontainers.image.authors="Ansible DevTools"
LABEL org.opencontainers.image.vendor="Red Hat"
LABEL org.opencontainers.image.licenses="GPL-3.0"
LABEL org.opencontainers.image.description="An OpenShift Dev Spaces container image for Ansible."

USER 0

WORKDIR /context
# install ansible-dev-tools specific packages and dependencies while avoiding
# adding multiple layers to the image.
RUN --mount=type=bind,target=. --mount=type=cache,dst=/var/cache/dnf --mount=type=cache,dst=/root/.cache/pip ./setup.sh

USER 10001