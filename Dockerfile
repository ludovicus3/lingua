ARG BASE_IMAGE=quay.io/devfile/base-developer-image
ARG BASE_IMAGE_TAG=ubi9-latest
FROM ${BASE_IMAGE}:${BASE_IMAGE_TAG}

LABEL maintainer="Jason Galens"

LABEL name="devfile/lingua-developer-image"
LABEL version="${BASE_IMAGE_TAG}"

USER 0

RUN set -eux; \
    dnf install -y llvm-devel llvm-toolset llvm-static cmake clang clangd; \
    dnf clean all -y --enable-repos='*'

USER 10001

ENV HOME=/home/user
ENV PATH=${HOME}/bin:${PATH}
